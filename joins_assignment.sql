-- v_art Database:

USE v_art;

-- Query 1:

SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- Query 2:

SELECT artfile
FROM artwork a
	JOIN artwork_keyword ak
    ON a.artwork_id = ak.artwork_id
    JOIN keyword k
    ON k.keyword_id = ak.keyword_id
WHERE keyword LIKE 'flower%';

-- Query 3:

SELECT fname, lname, title
FROM artist a
	LEFT JOIN artwork k
    ON a.artist_id = k.artist_id;

-- Magazine Database:

USE magazine;

-- Query 4:

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine m
	JOIN subscription s
    ON m.magazineKey = s.magazineKey
    JOIN subscriber r
    ON s.subscriberKey = r.subscriberKey
ORDER BY magazineName;

-- Query 5:

SELECT magazineName
FROM magazine m
	JOIN subscription s
    ON m.magazineKey = s.magazineKey
    JOIN subscriber r
    ON s.subscriberKey = r.subscriberKey
WHERE r.subscriberKey = '3';

-- Employee Database:

USE employees;

-- Query 6:

SELECT * FROM departments;

SELECT * FROM employees;

SELECT first_name, last_name
FROM departments d
	JOIN dept_emp de
    ON d.dept_no = de.dept_no
    JOIN employees e
    ON de.emp_no = e.emp_no
WHERE dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5;

-- Query 7:

SELECT * FROM employees;

SELECT first_name, last_name, dept_name, salary, s.from_date
FROM departments d
	JOIN dept_emp de
    ON d.dept_no = de.dept_no
    JOIN employees e
    ON de.emp_no = e.emp_no
    JOIN salaries s
    ON de.emp_no = s.emp_no
WHERE e.emp_no = '10014'
ORDER BY s.from_date DESC
LIMIT 1;
    









