

USE Set4DB;





-- 1. Create the View
CREATE OR REPLACE VIEW EmployeeDetailsView AS
SELECT employee_id,
       employee_name,
       department,
       salary
FROM Employee;

-- 2. Retrieve records from the View
SELECT * FROM EmployeeDetailsView;