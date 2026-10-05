-- Create and switch to database for Set 8
CREATE DATABASE  Set8DB;
USE Set8DB;



-- Create base Employee table for Set 8 exercises
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(501, 'Alice Smith',   'Engineering', 95000.00),
(502, 'Bob Johnson',   'Engineering', 75000.00),
(503, 'Charlie Brown', 'Finance',     82000.00),
(504, 'Diana Prince',  'Sales',       68000.00),
(505, 'Evan Wright',   'Engineering', 88000.00);


-- =========================================================
-- Q8.a) Create a View and demonstrate querying through it
-- =========================================================

-- Create a view for employees earning above 80,000
CREATE VIEW HighEarnersView AS
SELECT employee_id,
       employee_name,
       department,
       salary
FROM Employee
WHERE salary > 80000.00;

-- Query the created view
SELECT * FROM HighEarnersView;


-- =========================================================
-- Q8.b) Update data through a View and drop the View
-- =========================================================

-- Update data in the base table via the view
UPDATE HighEarnersView
SET salary = 98000.00
WHERE employee_id = 501;

-- Verify the update took effect in the base table
SELECT * FROM Employee WHERE employee_id = 501;

-- Drop the view
DROP VIEW IF EXISTS HighEarnersView;


-- =========================================================
-- Q8.c) Demonstrate TCL commands: COMMIT, ROLLBACK, and SAVEPOINT
-- =========================================================

-- Note: Ensure autocommit is temporarily turned off to demonstrate transactions
SET autocommit = 0;

-- Start Transaction
START TRANSACTION;

-- Perform an insert operation
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(506, 'Fiona Gallagher', 'Finance', 62000.00);

-- Set a Savepoint
SAVEPOINT Sp1;

-- Perform another insert operation
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(507, 'George Clark', 'Sales', 55000.00);

-- Roll back to Savepoint 1 (cancels George Clark's insert, retains Fiona Gallagher's insert)
ROLLBACK TO SAVEPOINT Sp1;

-- Permanently commit the changes up to Savepoint 1
COMMIT;

-- Restore default autocommit setting
SET autocommit = 1;

-- Verify final state of the Employee table
SELECT * FROM Employee;


-- =========================================================
-- Q8.d) Demonstrate Schema Modification using ALTER TABLE and DROP TABLE
-- =========================================================

-- Create a temporary table for demonstration
CREATE TABLE View_Test_Table (
    id INT PRIMARY KEY,
    temp_name VARCHAR(50)
);

-- 1. ALTER TABLE: Add a new column
ALTER TABLE View_Test_Table
ADD status VARCHAR(20) DEFAULT 'Active';

-- 2. ALTER TABLE: Modify column data type
ALTER TABLE View_Test_Table
MODIFY COLUMN status VARCHAR(50);

-- 3. ALTER TABLE: Drop a column
ALTER TABLE View_Test_Table
DROP COLUMN status;

-- 4. DROP TABLE: Permanently delete table schema and data
DROP TABLE IF EXISTS View_Test_Table;