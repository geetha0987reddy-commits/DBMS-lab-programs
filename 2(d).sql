CREATE USER 'studentuser'@'localhost'
IDENTIFIED BY 'student123';

GRANT SELECT, INSERT
ON employeeDB.*
TO 'studentuser'@'localhost';

REVOKE INSERT
ON employeeDB.*
FROM 'studentuser'@'localhost';

START TRANSACTION;

SELECT employee_id, employee_name, salary FROM Employee;

UPDATE Employee
SET salary = salary + 5000
WHERE employee_id = 101;


SAVEPOINT sp1;

UPDATE Employee
SET salary = salary + 3000
WHERE employee_id = 2;

ROLLBACK TO sp1;

COMMIT;