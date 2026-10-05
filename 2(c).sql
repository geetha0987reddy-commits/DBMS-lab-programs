CREATE DATABASE set2DB;
use set2DB;
-- Create Department table first (parent table)
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Student table with foreign key reference
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert sample records
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering');

INSERT INTO Student (student_id, student_name, dept_id) VALUES
(101, 'Alice Smith', 1),
(102, 'Bob Johnson', 1),
(103, 'Charlie Brown', 2),
(104, 'Diana Prince', 3);
SELECT s.student_id,
       s.student_name,
       d.dept_name AS major
FROM Student s
JOIN Department d
ON s.dept_id = d.dept_id;