-- Create and switch to database for Set 6
CREATE DATABASE  Set6DB;
USE Set6DB;



-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert sample records into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Finance'),
(2, 'IT'),
(3, 'HR'),
(4, 'Marketing');

-- Insert sample records into Employee
INSERT INTO Employee (employee_id, employee_name, dept_id, salary) VALUES
(301, 'Alice Smith', 1, 85000.00),
(302, 'Bob Johnson', 2, 90000.00),
(303, 'Charlie Brown', 3, 60000.00),
(304, 'Diana Prince', 2, 95000.00),
(305, 'Evan Wright', 4, 70000.00);

-- =========================================================
-- Q6.a) Find employees working in the Finance and IT departments using nested queries
-- =========================================================

SELECT employee_id,
       employee_name,
       dept_id,
       salary
FROM Employee
WHERE dept_id IN (
    SELECT dept_id
    FROM Department
    WHERE dept_name IN ('Finance', 'IT')
);