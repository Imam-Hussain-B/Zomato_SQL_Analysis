SHOW VARIABLES LIKE 'secure_file_priv';
-- Loading the Table
LOAD DATA LOCAL INFILE 'C:/Users/imam9/Downloads/zomato.csv'
INTO TABLE zomato
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Location Table
CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100),
    country_code INT,
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);


-- Cuisines Table
CREATE TABLE cuisines (
    cuisine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);


CREATE TEMPORARY TABLE numbers (n INT);
INSERT INTO numbers (n)
SELECT a.N + b.N * 10 + 1
FROM (
  SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
) a,
(
  SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
) b;

-- Restaurant Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    address TEXT,
    locality VARCHAR(100),
    locality_verbose VARCHAR(255),
    longitude FLOAT,
    latitude FLOAT,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Restaurant Setting
CREATE TABLE restaurant_settings (
    restaurant_id INT PRIMARY KEY,
    has_table_booking BOOLEAN,
    has_online_booking BOOLEAN,
    is_delivering_now BOOLEAN,
    switch_to_order_menu BOOLEAN,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Pricing
CREATE TABLE pricing (
    restaurant_id INT PRIMARY KEY,
    average_cost_for_two INT,
    currency VARCHAR(50),
    price_range INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Rating
CREATE TABLE ratings (
    restaurant_id INT PRIMARY KEY,
    aggregate_rating DECIMAL(3,2),
    rating_color VARCHAR(20),
    rating_text VARCHAR(50),
    votes INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE restaurant_cuisines (
    restaurant_id INT,
    cuisine_id INT,
    PRIMARY KEY (restaurant_id, cuisine_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (cuisine_id) REFERENCES cuisines(cuisine_id)
);

WITH RECURSIVE cuisine_split AS (
  SELECT
    restaurant_id,
    TRIM(SUBSTRING_INDEX(cuisines, ',', 1)) AS cuisine,
    SUBSTRING(cuisines, LENGTH(SUBSTRING_INDEX(cuisines, ',', 1)) + 2) AS rest
  FROM zomato_raw
  WHERE cuisines IS NOT NULL AND cuisines <> ''
  
  UNION ALL

  SELECT
    restaurant_id,
    TRIM(SUBSTRING_INDEX(rest, ',', 1)) AS cuisine,
    SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest, ',', 1)) + 2)
  FROM cuisine_split
  WHERE rest <> ''
);











