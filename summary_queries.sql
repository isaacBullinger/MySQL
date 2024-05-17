-- Bike database

USE bike;

-- Query 1:

SELECT ROUND(AVG(quantity)) AS 'Stock Average'
FROM stock;

-- Query 2:

SELECT product_name
FROM product p
	JOIN stock s
    ON p.product_id = s.product_id
WHERE quantity = 0
ORDER BY product_name;

-- Query 3

SELECT category_name, COUNT(quantity) AS 'instock'
FROM store st
	JOIN stock s
    ON st.store_id = s.store_id
	JOIN product p
    ON s.product_id = p.product_id
    JOIN category c
    ON p.category_id = c.category_id
WHERE st.store_id = 2
GROUP BY category_name
ORDER BY COUNT(quantity);

-- Employee Database:

USE employees;

-- Query 4

SELECT COUNT(emp_no) AS 'Number of Employees'
FROM employees;

-- Query 5:

SELECT dept_name, FORMAT(AVG(salary),2,'en_US') AS average_salary
FROM departments d
	JOIN dept_emp de
    ON d.dept_no = de.dept_no
    JOIN employees e
    ON de.emp_no = e.emp_no
    JOIN salaries s
	ON e.emp_no = s.emp_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;

-- Query 6:

SELECT dept_name, COUNT(gender)
FROM departments d
	JOIN dept_emp de
    ON d.dept_no = de.dept_no
    JOIN employees e
    ON de.emp_no = e.emp_no
WHERE gender = 'F'
GROUP BY dept_name
ORDER BY dept_name;









