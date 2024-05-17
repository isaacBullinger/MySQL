USE v_art;

SELECT COUNT(country), country
FROM artist
WHERE country = "France";

USE bike;

SELECT FORMAT(AVG(list_price),2), model_year
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP; #WITH ROLLUP takes an average of the averages.

SELECT SUM(list_price), MAX(list_price), MIN(list_price)
FROM product;

SELECT model_year, COUNT(DISTINCT list_price) #DISTINCT only selects unique values
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP; #WITH ROLLUP takes an average of the averages.

SELECT model_year, FORMAT(AVG(list_price),2)
FROM product
WHERE list_price > 2800
GROUP BY model_year WITH ROLLUP
HAVING AVG(list_price) > 4000;

SELECT model_year, FORMAT(AVG(list_price),2)
FROM product
WHERE product_name LIKE "%speed%"
GROUP BY model_year WITH ROLLUP
HAVING AVG(list_price) > 300;

-- Average of each brand list price with no 2016 and only averages over 2000
SELECT brand_name, FORMAT(AVG(list_price),2)
FROM brand b
	JOIN product p
    ON b.brand_id = p.brand_id
WHERE model_year > '2016'
GROUP BY brand_name WITH ROLLUP
HAVING AVG(list_price) > 2000;

USE magazine;

SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription s
    ON m.magazineKey = s.magazineKey
WHERE magazineName = "Beautiful Birds";

SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription s
    ON m.magazineKey = s.magazineKey
GROUP BY magazineName
HAVING subscribers >= 2;

-- What is the total revenue for each magazine?
SELECT magazineName, COUNT(subscriberKey) AS subscrbers, SUM(magazinePrice) AS 'Total Revenue'
FROM magazine m
	JOIN subscription s
	ON m.magazineKey = s.magazineKey
GROUP BY magazineName
ORDER BY magazineName;

USE bike;

SELECT brand_name, MAX(list_price), MIN(list_price)
FROM product p
	JOIN brand b
    ON p.brand_id = b.brand_id
GROUP BY brand_name;

SELECT store_name, product_name, SUM(quantity)
FROM store s
	JOIN stock st
    ON s.store_id = st.store_id
    JOIN product p
    ON st.product_id = p.product_id
WHERE product_name LIKE "Electra Cruiser 1 Ladies%"
GROUP BY product_name, store_name WITH ROLLUP;





