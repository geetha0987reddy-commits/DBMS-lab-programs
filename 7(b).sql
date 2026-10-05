
USE Set7DB;


-- =========================================================

SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 75000.00;