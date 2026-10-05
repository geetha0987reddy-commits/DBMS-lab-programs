-- Create and switch to database for Set 3
CREATE DATABASE IF NOT EXISTS Set3DB;
USE Set3DB;

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Q3.b) Insert six employee records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(201, 'Alice Smith',   'Engineering', 95000.00),
(202, 'Bob Johnson',   'Engineering', 75000.00),
(203, 'Charlie Brown', 'Finance',     82000.00),
(204, 'Diana Prince',  'Sales',       68000.00),
(205, 'Evan Wright',   'Sales',       45000.00),
(206, 'Fiona Clark',   'Finance',     91000.00);

-- Display all employee records
SELECT * FROM Employee;