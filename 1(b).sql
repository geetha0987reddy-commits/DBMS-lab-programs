CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO Employee VALUES
(1,'John','IT',60000,'Hyderabad'),
(2,'David','Finance',55000,'Chennai'),
(3,'Anu','HR',45000,'Bangalore');

SELECT * FROM Employee;

UPDATE Employee
SET salary = 65000
WHERE emp_id = 1;

DELETE FROM Employee
WHERE emp_id = 3;