USE bike;

SELECT * FROM product;

SELECT product_name, list_price, ROUND(list_price * 0.8, 2) AS 'Sales Price' 
FROM product
WHERE brand_id = 2;

USE bike;

SELECT cust_order_id, order_date
FROM cust_order
WHERE order_date > '2017-01-31' AND order_date < '2017-03-1';

USE bike;

SELECT first_name, last_name, phone, email, street, city, state, zip_code
FROM customer
WHERE email LIKE '%@gmail.com';