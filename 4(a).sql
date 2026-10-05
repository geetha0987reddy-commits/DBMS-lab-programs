-- Create and switch to database for Set 4
CREATE DATABASE IF NOT EXISTS Set4DB;
USE Set4DB;

-- Create Employee table
CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(101, 'Alice Smith',   'Engineering', 95000.00),
(102, 'Bob Johnson',   'Engineering', 75000.00),
(103, 'Charlie Brown', 'Finance',     82000.00),
(104, 'Diana Prince',  'Sales',       95000.00)
ON DUPLICATE KEY UPDATE salary = VALUES(salary);

-- =========================================================
-- Q4.a) Find employees having the highest salary using a nested query
-- =========================================================

SELECT employee_id,
       employee_name,
       department,
       salary
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);