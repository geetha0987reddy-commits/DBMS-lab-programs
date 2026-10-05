use employeeDB;
CREATE VIEW EmployeeView AS
SELECT employee_id, employee_name, department, salary
FROM Employee;

SELECT * FROM EmployeeView;

CREATE TABLE EmployeeMaterialized AS
SELECT employee_id, employee_name, department, salary
FROM Employee;

SELECT * FROM EmployeeMaterialized;

TRUNCATE TABLE EmployeeMaterialized;

INSERT INTO EmployeeMaterialized
SELECT employee_id, employee_name, department, salary
FROM Employee;