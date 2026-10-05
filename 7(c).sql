-- Create and switch to database for Set 7
CREATE DATABASE  Set7DB1;
USE Set7DB1;


-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert sample records
INSERT INTO Employee (employee_id, employee_name, hire_date, salary) VALUES
(401, 'Alice Smith',   '2021-03-15', 95000.00),
(402, 'Bob Johnson',   '2022-07-01', 75000.00),
(403, 'Charlie Brown', '2020-01-10', 82000.00);

-- =========================================================
-- Q7.c) Implement date functions: NOW, CURDATE, DATEDIFF and YEAR
-- =========================================================

SELECT employee_name,
       hire_date,
       -- NOW(): Returns current date and time
       NOW() AS current_datetime,
       -- CURDATE(): Returns current date
       CURDATE() AS current_date_only,
       -- DATEDIFF(): Returns number of days between current date and hire date
       DATEDIFF(CURDATE(), hire_date) AS days_worked,
       -- YEAR(): Extracts the year component from hire date
       YEAR(hire_date) AS hire_year
FROM Employee;