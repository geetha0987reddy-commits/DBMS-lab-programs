-- Create and switch to database for Set 7
CREATE DATABASE IF NOT EXISTS Set7DB;
USE Set7DB;

-- Safe cleanup to avoid table creation conflicts
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
(401, 'Alice Smith',   'Engineering', 95000.00),
(402, 'Bob Johnson',   'Engineering', 75000.00),
(403, 'Charlie Brown', 'Finance',     82000.00),
(404, 'Diana Prince',  'Sales',       68000.00),
(405, 'Evan Wright',   'Engineering', 88000.00);

-- =========================================================
-- Q7.d) Demonstrate Subqueries in SELECT, FROM, and WHERE clauses
-- =========================================================

-- 1. Subquery in WHERE clause
-- Finds employees earning more than the company overall average salary
SELECT employee_id,
       employee_name,
       salary
FROM Employee
WHERE salary > (
    SELECT AVG(salary) 
    FROM Employee
);

-- 2. Subquery in SELECT clause (Scalar Subquery)
-- Compares individual salary against overall average salary in a computed column
SELECT employee_name,
       salary,
       (SELECT AVG(salary) FROM Employee) AS overall_avg_salary,
       salary - (SELECT AVG(salary) FROM Employee) AS diff_from_avg
FROM Employee;

-- 3. Subquery in FROM clause (Derived Table)
-- Queries a temporary summary table of average salaries by department
SELECT summary.department,
       summary.avg_dept_salary
FROM (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM Employee
    GROUP BY department
) AS summary
WHERE summary.avg_dept_salary > 80000.00;