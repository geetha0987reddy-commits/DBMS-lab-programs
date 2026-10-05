create database set6DB3;
USE Set6DB3;


-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(301, 'Alice Smith',   'Engineering', 95000.50),
(302, 'Bob Johnson',   'Engineering', 75000.25),
(303, 'Charlie Brown', 'Finance',     82000.75),
(304, 'Diana Prince',  'Sales',       68000.00);

-- =========================================================
-- Q6.c) Implement numeric functions: ROUND, CEIL, FLOOR and ABS
-- =========================================================

SELECT salary,
       -- ROUND: Rounds salary to nearest integer (or specified decimal places)
       ROUND(salary) AS rounded_salary,
       -- CEIL: Rounds salary UP to the nearest integer
       CEIL(salary) AS ceil_salary,
       -- FLOOR: Rounds salary DOWN to the nearest integer
       FLOOR(salary) AS floor_salary,
       -- ABS: Returns the absolute (positive) value
       ABS(salary - 80000) AS abs_difference_from_80k
FROM Employee;