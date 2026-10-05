

USE Set5DB;

-- Clean up existing table to prevent schema or data conflicts
DROP TABLE IF EXISTS Employee;

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(201, 'Alice Smith',   'Engineering', 95000.00),
(202, 'Bob Johnson',   'Engineering', 75000.00),
(203, 'Charlie Brown', 'Finance',     82000.00),
(204, 'Diana Prince',  'Sales',       68000.00),
(205, 'Evan Wright',   'Sales',       45000.00);

-- =========================================================
-- Q5.b) Use SELECT with a WHERE clause to retrieve specified employee records
-- (e.g., retrieve all employees working in 'Engineering' with salary > 80000)
-- =========================================================

SELECT employee_id,
       employee_name,
       department,
       salary
FROM Employee
WHERE department = 'Engineering' 
  AND salary > 80000.00;