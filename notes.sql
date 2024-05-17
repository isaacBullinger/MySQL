-- Notes

-- general syntax of a function: function(parameter, parameter)
-- pass the results fo one function to another function: function2(function1(parameter, parameter), parameter)

USE bike;

SELECT shipped_date, DATE_FORMAT(DATE_ADD(shipped_date, INTERVAL 2 MONTH), '%M %e, %Y')
FROM cust_order;

USE magazine;

SELECT magazineName, SUBSTRING(magazineName, LOCATE('Ma', magazineName))
FROM magazine
ORDER BY magazineName;