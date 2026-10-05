-- Create and switch to database for Set 9
CREATE DATABASE  Set9DB;
USE Set9DB;



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
(601, 'Alice Smith',   1, 95000.00),
(602, 'Bob Johnson',   1, 75000.00),
(603, 'Charlie Brown', 2, 82000.00),
(604, 'Diana Prince',  3, 68000.00),
(605, 'Evan Wright',   1, 88000.00);


-- =========================================================
-- Q9.a) Find employees whose salary is greater than the average salary 
--       of their respective department (Correlated Subquery)
-- =========================================================

SELECT e1.employee_id,
       e1.employee_name,
       e1.dept_id,
       e1.salary
FROM Employee e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e2.dept_id = e1.dept_id
);


-- =========================================================
-- Q9.b) Demonstrate UNION and UNION ALL operators
-- =========================================================

-- UNION: Combines results from two queries and eliminates duplicate rows
SELECT employee_name FROM Employee WHERE dept_id = 1
UNION
SELECT employee_name FROM Employee WHERE salary > 80000.00;

-- UNION ALL: Combines results from two queries and retains all duplicates
SELECT employee_name FROM Employee WHERE dept_id = 1
UNION ALL
SELECT employee_name FROM Employee WHERE salary > 80000.00;


-- =========================================================
-- Q9.c) Demonstrate String Functions: INSTR, SUBSTR (or SUBSTRING), TRIM, and REPLACE
-- =========================================================

SELECT employee_name,
       -- INSTR: Returns position of first occurrence of a substring ('i' in name)
       INSTR(employee_name, 'i') AS pos_of_i,
       -- SUBSTR: Extracts a substring starting from position 1 for 5 characters
       SUBSTR(employee_name, 1, 5) AS short_name,
       -- TRIM: Removes leading/trailing spaces
       TRIM('   ' FROM employee_name) AS trimmed_name,
       -- REPLACE: Replaces occurrence of a substring
       REPLACE(employee_name, 'Alice', 'A.') AS replaced_name
FROM Employee;


-- =========================================================
-- Q9.d) Demonstrate Primary Key, Candidate Key, and Unique Key constraints
-- =========================================================

-- Create a table demonstrating Key Constraints
CREATE TABLE Key_Constraints_Demo (
    -- Primary Key: Uniquely identifies each row, cannot contain NULLs
    id INT PRIMARY KEY,
    -- Unique Key / Candidate Key: Uniquely identifies rows, permits NULL values
    email VARCHAR(100) UNIQUE,
    passport_number VARCHAR(50) UNIQUE,
    user_name VARCHAR(50) NOT NULL
);

-- Insert valid records adhering to constraints
INSERT INTO Key_Constraints_Demo (id, email, passport_number, user_name) VALUES
(1, 'alice@example.com', 'A12345678', 'alice_s'),
(2, 'bob@example.com',   'B98765432', 'bob_j'),
(3, NULL,                NULL,        'charlie_b');

-- Verify inserted data
SELECT * FROM Key_Constraints_Demo;