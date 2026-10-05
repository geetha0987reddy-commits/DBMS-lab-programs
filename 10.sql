-- Create and switch to database for Set 10
CREATE DATABASE  Set10DB;
USE Set10DB;



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
(1, 'Engineering'),
(2, 'Finance'),
(3, 'Sales');

-- Insert sample records into Employee
INSERT INTO Employee (employee_id, employee_name, dept_id, salary) VALUES
(701, 'Alice Smith',   1, 95000.00),
(702, 'Bob Johnson',   1, 75000.00),
(703, 'Charlie Brown', 2, 82000.00),
(704, 'Diana Prince',  3, 68000.00),
(705, 'Evan Wright',   1, 88000.00);


-- =========================================================
-- Q10.a) Demonstrate EXISTS and NOT EXISTS subqueries
-- =========================================================

-- 1. EXISTS: Find departments that have at least one employee assigned
SELECT d.dept_id,
       d.dept_name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.dept_id = d.dept_id
);

-- 2. NOT EXISTS: Find departments with no employees assigned
SELECT d.dept_id,
       d.dept_name
FROM Department d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.dept_id = d.dept_id
);


-- =========================================================
-- Q10.b) Create, use, and drop an Index to optimize query performance
-- =========================================================

-- Create a sample table for index demonstration
CREATE TABLE Index_Demo_Table (
    user_id INT PRIMARY KEY,
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Insert sample records
INSERT INTO Index_Demo_Table (user_id, email, city) VALUES
(1, 'alice@example.com', 'New York'),
(2, 'bob@example.com', 'London'),
(3, 'charlie@example.com', 'New York');

-- Create an Index on the 'city' column
CREATE INDEX idx_city ON Index_Demo_Table(city);

-- Query utilizing the indexed column
SELECT * FROM Index_Demo_Table WHERE city = 'New York';

-- Drop the created Index
DROP INDEX idx_city ON Index_Demo_Table;


-- =========================================================
-- Q10.c) Implement Control Flow Functions: IF, IFNULL, and CASE
-- =========================================================

SELECT employee_name,
       salary,
       -- IF: Evaluate conditional logic (High/Low earner threshold)
       IF(salary >= 80000.00, 'High Earner', 'Standard Earner') AS salary_tier,
       
       -- IFNULL: Return replacement value if expression is NULL
       IFNULL(dept_id, 0) AS safe_dept_id,
       
       -- CASE: Multi-branch conditional logic for evaluation
       CASE 
           WHEN salary >= 90000.00 THEN 'Executive Tier'
           WHEN salary >= 75000.00 THEN 'Senior Tier'
           ELSE 'Associate Tier'
       END AS employment_level
FROM Employee;


-- =========================================================
-- Q10.d) Demonstrate Stored Procedure creation and execution
-- =========================================================

-- Change delimiter to define stored procedure body containing multiple statements
DELIMITER //



CREATE PROCEDURE GetEmployeesByDepartment(IN input_dept_id INT)
BEGIN
    SELECT employee_id,
           employee_name,
           salary
    FROM Employee
    WHERE dept_id = input_dept_id;
END //

-- Reset delimiter back to default semicolon
DELIMITER ;

-- Call/Execute the stored procedure
CALL GetEmployeesByDepartment(1);