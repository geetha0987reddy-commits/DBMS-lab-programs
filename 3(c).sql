-- Create and switch to database for Set 3
CREATE DATABASE IF NOT EXISTS Set3DB;
USE Set3DB;

-- Create Employee table (if not already created in Q3.b)
CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records if table is empty
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(201, 'Alice Smith',   'Engineering', 95000.00),
(202, 'Bob Johnson',   'Engineering', 75000.00),
(203, 'Charlie Brown', 'Finance',     82000.00),
(204, 'Diana Prince',  'Sales',       68000.00),
(205, 'Evan Wright',   'Sales',       45000.00),
(206, 'Fiona Clark',   'Finance',     91000.00)
ON DUPLICATE KEY UPDATE salary = VALUES(salary);

-- Q3.c) Implement SUM, AVG, MIN, MAX and COUNT using GROUP BY and HAVING
SELECT department,
       COUNT(*) AS total_employees,
       SUM(salary) AS total_salary,
       AVG(salary) AS average_salary,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 60000;