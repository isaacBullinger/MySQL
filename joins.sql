-- Joins:

USE v_art;

SELECT fname, lname, title
FROM artwork
	JOIN artist
	ON artwork.artist_id = artist.artist_id
WHERE lname = 'da Vinci';

SELECT * FROM artist;

SELECT * FROM artwork;

USE bike;

SELECT * FROM category;

SELECT * FROM product;

SELECT product_name, category_name, brand_name, list_price
FROM product p
	JOIN category c
    ON p.category_id = c.category_id
	JOIN brand b
    ON p.brand_id = b.brand_id
WHERE category_name = "Children Bicycles";

SELECT first_name, last_name
FROM staff
	JOIN store
	ON staff.store_id = store.store_id
WHERE store.store_id = 3;

USE v_art;

SELECT title
FROM artwork
	JOIN artwork_keyword
    ON artwork.artwork_id = artwork_keyword.artwork_id
    JOIN keyword
    ON artwork_keyword.keyword_id = keyword.keyword_id
WHERE keyword = "water";

USE employees;

SELECT first_name, last_name, dept_name, salary, s.from_date
FROM departments d
	JOIN dept_emp de
    ON d.dept_no = de.dept_no
    JOIN employees e
    ON e.emp_no = de.emp_no
    JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE s.from_date > '2000-12-31';

SELECT first_name, last_name, dept_name, salary, s.from_date
FROM salaries s
	JOIN employees e
    ON e.emp_no = s.emp_no
    JOIN dept_emp de
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON d.dept_no = de.dept_no
WHERE s.from_date > '2000-12-31';

USE world;
SELECT * FROM country;
SELECT * FROM city;

SELECT co.name, ci.name
FROM city ci
	JOIN country co
    ON code = countrycode;
    
USE bike;

SELECT product_name, order_date
FROM customer c
	JOIN cust_order co
    ON c.customer_id = co.customer_id
    JOIN cust_order_item coi
    ON co.cust_order_id = coi.cust_order_id
    JOIN product p
    ON p.product_id = coi.product_id
WHERE last_name = 'Baldwin';

-- OUTER JOIN:

USE v_art;

SELECT fname, lname, title
FROM artist a
	LEFT OUTER JOIN artwork # Left circle on a Venn Diagram. LEFT JOIN also means the same thing.
    ON a.artist_id = artwork.artist_id;