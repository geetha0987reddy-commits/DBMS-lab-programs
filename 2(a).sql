CREATE DATABASE employeeDB;
use employeeDB;
-- Create the Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample data across different departments and salary tiers
INSERT INTO Employee (employee_id, employee_name, department, salary) VALUES
(101, 'Alice Smith',   'Engineering', 95000.00),
(102, 'Bob Johnson',   'Engineering', 75000.00),
(103, 'Charlie Brown', 'Engineering', 60000.00),
(104, 'Diana Prince',  'Sales',       80000.00),
(105, 'Evan Wright',   'Sales',       45000.00),
(106, 'Fiona Gallagher','Sales',      50000.00),
(107, 'George Clark',  'HR',          62000.00),
(108, 'Hannah Abbott', 'HR',          58000.00);
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

SELECT e1.*
FROM Employee e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e2.department = e1.department
);