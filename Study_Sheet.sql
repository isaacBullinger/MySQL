# Order you must write the code:

# SELECT
# FROM and JOIN
# WHERE
# GROUP BY
# HAVING
# ORDER BY
# LIMIT

# String Data Types
# CHAR 	Fixed-length string from 1 to 255 characters long. The length is fixed at creation.
# VARCHAR 	Variable-length string from 1 to 65,535 characters long
# ENUM 	One string from a predefined list of strings
# SET 	Zero or more values from a predefined list

# Numeric Data Types
# INT 	Integer (whole number)
# TINYINT 	Integers at a smaller range -128 to 127 used for Boolean 0 and 1
# DECIMAL 	Numbers with digits after the decimal point

# A note about ENUM: ENUM is not part of the SQL-standard and many database systems do not support it. Using a reference table instead of ENUM is advisable. In MySQL, only use ENUM when you’re storing distinct, unchanging values sets where you will never need to store additional related info. It should only have more than 2 to 20 items. If there are only 2 choices use tinyint for 1 or 0. Again, even with MySQL, when there may be any changes to the value options in the future use a reference table instead.
# Date and Time Data Types
# DATE 	Dates from 1000-01-01 to 9999-12-31 as YYYY-MM-DD
# DATETIME 	Combines DATE AND TIME
# TIME 	Time as HH:MM:SS in 24 hour format
# YEAR 	Years ranging from 1901 to 2155

# Insert Statement
# INSERT INTO table_name (column_list) VALUES (value_list)

# No Column List, Multiple Rows Example
# INSERT INTO course VALUES
# (2, 'Economics', '388', 4, 2),
# (3, 'Micro Economics', '150', 3, 2),
# (4, 'Classical Heritage', '376', 2, 3);

# Using a Column List, One Row
# INSERT INTO course 
#    (courseid, name, number, credit, departmentid)
# VALUES
#    (1, 'Intro to Databases', '111', 3, 1);

# UPDATE Statement
# UPDATE table_name
# SET column_name = expresson
# WHERE search_condition

# UPDATE Example
# UPDATE artist 
# SET fname = 'Vinny' 
# WHERE artist_id = 2;

# DELETE FROM table_name
# WHERE search_condition;
            
# Delete Example
# DELETE FROM artist  
# WHERE lname = 'van Gogh';

#SELECT Statement
# SELECT column_list
# FROM table_source;

# Math Operators
# *  Multiplication		
# /  Division		
# %  Modulus		
# +  Addition
# -  Subtraction

# DISTINCT
# SELECT DISTINCT(prod_price)
# FROM products

# WHERE Operators
# =	   	       Equal to
# <		       Less than
# <=		   Less than or equal to
# > 		   Greater than
# >= 		   Greater than or equal to
# <> or !=	   Not equal to

# Using AND OR and NOT to combine search conditions
# AND    Both conditions have to be true for it to show up in the result set
# OR     One of the conditions has to be true for it to show up in the result set
# NOT    Negates the condition.

# Order of precedence
# NOT
# AND
# OR

# BETWEEN operator compares an expression with a range of values.

# The LIKE operator matches a string pattern to an expression.
# It uses two characters to represent characters.
#The _ underscore is a wild card to one character and the % percent
# is a wild card to any number of characters.

# The IS NULL or IS NOT NULL will find all nulls or all values that are not null.
# We only had one null in our table; the product category of the jump rope row.

# ORDER BY clause sorts results

# LIMIT clause specifies the maximum number of rows that will be returned.

# Functions:

# String
# Function 	Description
# CONCAT(string, string) 	Returns all the string combined into one string
# LEFT(string, length) 	Returns characters from the left of the string
# RIGHT(string, length) 	Returns characters from the right of the string
# LTRIM(string) 	Trims white space from the left of the string
# RTRIM(string) 	Trims white space from the right of the string
# TRIM( string) 	Trims white space from the left and right of the string
# LENGTH(string) 	Returns the length of characters of the string
# LOWER(string) 	Converts the string to lowercase
# UPPER(string) 	Converts the string to uppercase
# LOCATE(find, search, start) 	Find a substring within the string
# SUBSTRING(string, start, length ) 	Return characters from within a string

# Numeric
# Function 	Description
# ROUND(number, length) 	Returns the number rounded
# FLOOR(number) 	Returns the next smaller whole number
# CEILING(number) 	Returns the next larger whole number
# ABS(number) 	Returns the absolute value of the number
# SQRT(number) 	Returns the square root of the number
# MOD(number, divisor) 	Returns the remainder of the number divided by the divisor
# FORMAT(number, decimals, locale) 	Returns the number is currency format

# Date and Time
# Function 	Description
# YEAR(date) 	Returns the year portion of a date
# MONTH(date) 	Returns the month portion of a date
# DAY(date) 	Returns the day portion of a date
# HOUR(time) 	Returns the hour portion of a time
# MINUTE(time) 	Returns the minute portion of a time
# SECOND(time) 	Returns the second portion of a time
# NOW() 	Returns the current local time and date from your system
# DATE_ADD(date, INTERVAL length time) 	Adds a specified interval to a date
# DATEDIFF(date, date) 	Calculates the difference in days between two dates
# DATE_FORMAT(date, format) 	Returns a string for a date with specific formatting

# DATE_FORMAT codes
# Format Code 	Description
# %c 	Month, numeric
# %M 	Month name
# %e 	Day of the month, numeric
# %D 	Day of the month with suffix
# %y 	Year, 2 digits
# %Y 	Year, 4 digits
# %W 	Weekday name

# INNER JOIN       
#       Returns rows that have matching values in both tables	
#   LEFT JOIN        
#       Returns all rows from the left table, and matched rows from the right table
#   RIGHT JOIN       
#       Returns all rows from the right table, and matching rows from the left table
#   FULL OUTER JOIN  
#       Returns all rows from both tables, even if there is not a related key

# INNER JOIN
# SELECT select_list
#  FROM table_1
#      JOIN table_2
#          ON join_condition_1
#      JOIN table_3
#          ON join_condition_2 [. . .]

# OUTER JOIN returns all rows from one table and just the matched rows from another table.

# Common SQL Aggregate Functions
# AVG()       Returns a column’s average value         AVG([ALL| DISTINCT] expression)
# SUM()       Returns the sum of a column’s values     SUM([ALL| DISTINCT] expression)
# MAX()       Returns a column’s highest value         MAX([ALL| DISTINCT] expression)
# MIN()       Returns a column’s lowest value          MIN([ALL| DISTINCT] expression)
# COUNT()     Returns the number of rows in a column   COUNT([ALL| DISTINCT] expression)

# ALL is assumed, use distinct if needed.

# GROUP BY clause is used when you have an aggregate function that you want
# to use on the grouped data.

# HAVING clause also works with aggregate functions and allows you to filter the groups
# (or in other words specify which groups to include or not include).
# It works a lot like the WHERE clause but the WHERE clause filters rows and the
# HAVING clause filters groups.

# ROLLUP operator can be used with grouping and aggregates allowing you to add one
# or more summary rows to your results.
# A summary row will show up for every group you have.

