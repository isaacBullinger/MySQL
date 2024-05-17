-- Virtual Art Gallery Application Queries:

-- Query 1:

USE art_gallery;

SELECT * FROM artist;

INSERT INTO artist VALUES
	(9, 'Johannes', NULL, 'Vermeer', 1632, 1674, 'Netherlands', 'n');
    
-- Query 2:

SELECT fname, mname, lname, dob, dod, country, local_artist
FROM artist
ORDER BY lname;

-- Query 3:

SELECT * FROM artist;

UPDATE artist
SET dod = '1675'
WHERE artist_id = 9;
    
-- Query 4:

SELECT * FROM artist;

DELETE FROM artist
WHERE artist_id = 9;

-- Bike Shop Queries:

-- Query 5:

USE bike;

SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Houston';

-- Query 6:

SELECT product_name, list_price, list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- Query 7:

SELECT first_name, last_name, email
FROM staff
WHERE NOT store_id = 1;

-- Query 8:

SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';

-- Query 9:

SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- Query 10:

SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL AND (city LIKE '%ach%' OR city LIKE '%och%') OR last_name = 'William'
LIMIT 5;