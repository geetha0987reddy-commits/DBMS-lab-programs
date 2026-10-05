SELECT *
FROM Student
NATURAL JOIN Department;

SELECT *
FROM Student s, Department d
WHERE s.dept_id = d.dept_id;

SELECT s.student_name, d.dept_name
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id;

SELECT s.student_name, d.dept_name
FROM Student s
LEFT JOIN Department d
ON s.dept_id = d.dept_id;

SELECT s.student_name, d.dept_name
FROM Student s
RIGHT JOIN Department d
ON s.dept_id = d.dept_id;
