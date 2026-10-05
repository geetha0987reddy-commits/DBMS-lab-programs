-- Create and switch to database for Set 6
CREATE DATABASE IF NOT EXISTS Set6DB4;
USE Set6DB4;



-- 1. Create Parent Table: Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL
);

-- 2. Create Parent Table: Project
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL
);

-- 3. Create Child Table with Referencing Constraints (Foreign Keys)
CREATE TABLE ProjectAssignment (
    assignment_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Populate Employee table
INSERT INTO Employee (employee_id, employee_name) VALUES
(101, 'Alice Smith'),
(102, 'Bob Johnson');

-- Populate Project table
INSERT INTO Project (project_id, project_name) VALUES
(501, 'Cloud Migration'),
(502, 'Security Audit');

-- Populate ProjectAssignment table (FK referencing existing keys)
INSERT INTO ProjectAssignment (assignment_id, employee_id, project_id) VALUES
(1, 101, 501),
(2, 102, 502);

-- =========================================================
-- Q6.d) Demonstrate Referencing Constraints and FOREIGN KEY operations
-- =========================================================

-- View initial referenced state
SELECT pa.assignment_id, e.employee_name, p.project_name
FROM ProjectAssignment pa
JOIN Employee e ON pa.employee_id = e.employee_id
JOIN Project p ON pa.project_id = p.project_id;

-- Demonstrate Foreign Key CASCADE ON UPDATE:
-- Updating parent PK updates child FK automatically
UPDATE Employee SET employee_id = 105 WHERE employee_id = 101;

-- Demonstrate Foreign Key CASCADE ON DELETE:
-- Deleting parent record automatically removes corresponding child record
DELETE FROM Project WHERE project_id = 502;

-- Verify cascading changes in the referencing table
SELECT * FROM ProjectAssignment;