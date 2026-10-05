-- Create and switch to database for Set 7
CREATE DATABASE  Set7DB;
USE Set7DB;


-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(401, 'Alice Smith',   'Engineering', 95000.00),
(402, 'Bob Johnson',   'Engineering', 75000.00),
(403, 'Charlie Brown', 'Finance',     82000.00),
(404, 'Diana Prince',  'Sales',       68000.00),
(405, 'Evan Wright',   'Engineering', 88000.00);

-- =========================================================
-- Q7.a) Find the average salary of employees in each department 
--       using GROUP BY and aggregate functions
-- =========================================================

SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department;