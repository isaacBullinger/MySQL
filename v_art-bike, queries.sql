USE v_art;

SELECT * FROM artwork;

SELECT title, period, artyear
FROM artwork
WHERE artyear BETWEEN 1800 AND 1900;

SELECT title, period
FROM artwork
WHERE period IN ('Modern', 'Baroque', 'Impressionism');

SELECT title, period
FROM artwork
WHERE period LIKE '%impression%';

SELECT title, period
FROM artwork
WHERE title REGEXP 'the|in|on';

SELECT * FROM artist;

-- ORDER BY recognized aliases, WHERE does not!
SELECT fname AS First, mname AS Middle, lname AS Last
FROM artist
WHERE mname IS NOT NULL
ORDER BY Middle;

USE bike;

SELECT * FROM product;

-- Command execution order: FROM, WHERE, SELECT, ORDER BY, LIMIT
-- Code write order: SELECT, FROM, WHERE, ORDER BY, LIMIT
SELECT product_name, model_year, list_price + 100 AS marked_up, list_price
FROM product
WHERE list_price + 100 > 1000
ORDER BY marked_up;

-- AND has precedence over OR
SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') AND model_year <> 2016;