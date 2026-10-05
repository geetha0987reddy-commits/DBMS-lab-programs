

USE Set5DB;


-- Q5.c) Implement string functions: CONCAT, UPPER, LOWER and LENGTH


SELECT employee_name,
       -- CONCAT: Combine name and department into a formatted string
       CONCAT(employee_name, ' works in ', department) AS employee_info,
       -- UPPER: Convert name to uppercase
       UPPER(employee_name) AS upper_name,
       -- LOWER: Convert department to lowercase
       LOWER(department) AS lower_department,
       -- LENGTH: Calculate character length of the employee name
       LENGTH(employee_name) AS name_length
FROM Employee;