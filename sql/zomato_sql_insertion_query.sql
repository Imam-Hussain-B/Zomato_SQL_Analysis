-- Location Table
INSERT INTO locations (city, country_code)
SELECT DISTINCT city, `country code`
FROM zomato_db.zomato_raw;

-- Cuisines Table
INSERT INTO cuisines (name)
SELECT DISTINCT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(zr.cuisines, ',', n), ',', -1)) AS cuisine
FROM zomato_raw zr
JOIN numbers ON n <= 1 + LENGTH(zr.cuisines) - LENGTH(REPLACE(zr.cuisines, ',', ''))
WHERE zr.cuisines IS NOT NULL
  AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(zr.cuisines, ',', n), ',', -1)) <> '';
  
  -- Restaurant Table
  INSERT INTO restaurants (
    restaurant_id, restaurant_name, address, locality, locality_verbose,
    longitude, latitude, location_id
)
SELECT 
    r.restaurant_id, r.restaurant_name, r.address, r.locality, r.locality_verbose,
    r.longitude, r.latitude,
    l.location_id
FROM zomato_raw r
JOIN locations l ON r.city = l.city AND r.country_code = l.country_code;

-- Restaurant Setting
INSERT INTO restaurant_settings
SELECT 
    restaurant_id,
    has_table_booking = 1,
    has_online_booking = 1,
    is_delivering_now = 1,
    switch_to_order_menu = 1
FROM zomato_raw;

-- Pricing
INSERT INTO pricing
SELECT 
    restaurant_id,
    `average_cost_for_two`,
    currency,
    price_range
FROM zomato_raw;

-- Rating
INSERT INTO ratings
SELECT 
    restaurant_id,
    aggregate_rating,
    rating_color,
    rating_text,
    votes
FROM zomato_raw;

-- Restaurant Cuisines
INSERT INTO restaurant_cuisines (restaurant_id, cuisine_id)
SELECT DISTINCT
    zr.restaurant_id,
    c.cuisine_id
FROM zomato_raw zr
JOIN cuisines c
  ON FIND_IN_SET(TRIM(c.name), zr.cuisines) > 0
WHERE zr.cuisines IS NOT NULL AND zr.cuisines <> ''
  AND NOT EXISTS (
    SELECT 1
    FROM restaurant_cuisines rc
    WHERE rc.restaurant_id = zr.restaurant_id
      AND rc.cuisine_id = c.cuisine_id
  );






