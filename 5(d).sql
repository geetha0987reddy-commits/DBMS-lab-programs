
USE Set5DB;

-- Safe cleanup: Drop dependent child tables first, then parent tables
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
SET foreign_key_checks = 1;

-- 1. Create Department table (Parent table)
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- 2. Create Employee table (Child table referencing Department)
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Populate Department table
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Finance'),
(3, 'Marketing');

-- Populate Employee table
INSERT INTO Employee (employee_id, employee_name, dept_id, salary) VALUES
(201, 'Alice Smith',   1, 95000.00),
(202, 'Bob Johnson',   2, 75000.00),
(203, 'Charlie Brown', NULL, 82000.00);

-- =========================================================
-- Q5.d) Join Operations (Note: Highlight and execute each SELECT fully)
-- =========================================================

-- 1. INNER JOIN
-- 'e' is defined as the alias for Employee, 'd' is defined as the alias for Department
SELECT e.employee_id,
       e.employee_name,
       d.dept_name
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;

-- 2. LEFT OUTER JOIN
SELECT e.employee_id,
       e.employee_name,
       d.dept_name
FROM Employee e
LEFT OUTER JOIN Department d ON e.dept_id = d.dept_id;

-- 3. RIGHT OUTER JOIN
SELECT e.employee_id,
       e.employee_name,
       d.dept_name
FROM Employee e
RIGHT OUTER JOIN Department d ON e.dept_id = d.dept_id;