-- 1. Top Restaurants & Rankings

select r.restaurant_name, rt.aggregate_rating, rt.votes 
from restaurants r 
join ratings rt 
on r.restaurant_id = rt.restaurant_id
where rt.votes >= 500
order by rt.aggregate_rating desc
limit 100;

-- 2. Cuisine Analysis
-- i) Most common cuisines

select c.name, count(*) as count
from restaurant_cuisines rc
join cuisines c 
on rc.cuisine_id = c.cuisine_id
group by c.name
order by count desc;

-- ii) Top 10 Best Rated Cuisines
SELECT c.name, round(AVG(rt.aggregate_rating),1) AS avg_rating
FROM restaurant_cuisines rc
JOIN cuisines c ON rc.cuisine_id = c.cuisine_id
JOIN ratings rt ON rc.restaurant_id = rt.restaurant_id
GROUP BY c.name
ORDER BY avg_rating DESC
LIMIT 10;

-- 3. City & Location Insights
-- i) Top 5 cities with highest number of listed restaurants

SELECT l.city, COUNT(*) AS restaurant_count
FROM locations l
JOIN restaurants r ON l.location_id = r.location_id
GROUP BY l.city
ORDER BY restaurant_count DESC
LIMIT 5;

-- ii) Average cost by city

SELECT l.city, round(AVG(p.average_cost_for_two),0) AS avg_cost
FROM pricing p
JOIN restaurants r ON r.restaurant_id = p.restaurant_id
JOIN locations l ON r.location_id = l.location_id
GROUP BY l.city
ORDER BY avg_cost DESC;

-- 4. Cost & Pricing Strategy
-- High-cost restaurants that still get good ratings

SELECT r.restaurant_name, p.average_cost_for_two, rt.aggregate_rating
FROM pricing p
JOIN ratings rt ON p.restaurant_id = rt.restaurant_id
JOIN restaurants r ON r.restaurant_id = p.restaurant_id
WHERE p.average_cost_for_two > 1500 AND rt.aggregate_rating >= 4.5;

-- 5.5. Online/Booking Preferences
-- i) Online delivery vs rating
SELECT rs.has_online_booking, AVG(rt.aggregate_rating) AS avg_rating
FROM restaurant_settings rs
JOIN ratings rt ON rs.restaurant_id = rt.restaurant_id
GROUP BY rs.has_online_booking;

-- ii) Table booking popularity by city
SELECT l.city, COUNT(*) AS booking_enabled
FROM restaurant_settings rs
JOIN restaurants r ON rs.restaurant_id = r.restaurant_id
JOIN locations l ON r.location_id = l.location_id
WHERE rs.has_table_booking = TRUE
GROUP BY l.city
ORDER BY booking_enabled DESC;

-- 7. Window Functions & Ranking
-- i) Top restaurant by votes in each city
SELECT restaurant_name, city, votes
FROM (
  SELECT r.restaurant_name, l.city, rt.votes,
         RANK() OVER(PARTITION BY l.city ORDER BY rt.votes DESC) AS city_rank
  FROM restaurants r
  JOIN ratings rt ON r.restaurant_id = rt.restaurant_id
  JOIN locations l ON r.location_id = l.location_id
) ranked
WHERE city_rank = 1;

-- 8) Apply 10% discount on restaurants costing more than ₹2000?

SELECT r.restaurant_name, p.average_cost_for_two,
       round((p.average_cost_for_two * 0.90),0) AS discounted_cost
FROM pricing p
JOIN restaurants r ON p.restaurant_id = r.restaurant_id
WHERE p.average_cost_for_two > 2000;

-- 9) Top 3 Cities by Average Spending
SELECT l.city, ROUND(AVG(p.average_cost_for_two),0) AS avg_cost
FROM locations l
JOIN restaurants r ON l.location_id = r.location_id
JOIN pricing p ON r.restaurant_id = p.restaurant_id
GROUP BY l.city
ORDER BY avg_cost DESC
LIMIT 3;

-- 10) Which Cuisine Has the Most Restaurants Offering Online Delivery?

SELECT cu.name, COUNT(*) AS online_delivery_count
FROM restaurant_cuisines rc
JOIN cuisines cu ON rc.cuisine_id = cu.cuisine_id
JOIN restaurant_settings rs ON rc.restaurant_id = rs.restaurant_id
WHERE rs.has_online_booking = 1
GROUP BY cu.name
ORDER BY online_delivery_count DESC
LIMIT 5;


