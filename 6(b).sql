-- Create and switch to database for Set 6
CREATE DATABASE  Set6DB2;
USE Set6DB2;


-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(301, 'Alice Smith',   'Engineering', 95000.00),
(302, 'Bob Johnson',   'Engineering', 75000.00),
(303, 'Charlie Brown', 'Finance',     82000.00),
(304, 'Diana Prince',  'Sales',       68000.00),
(305, 'Evan Wright',   'Sales',       45000.00);

-- =========================================================
-- Q6.b) Retrieve the top 3 highest-paid employees using the ORDER BY and LIMIT clauses
-- =========================================================

SELECT employee_id,
       employee_name,
       department,
       salary
FROM Employee
ORDER BY salary DESC
LIMIT 3;