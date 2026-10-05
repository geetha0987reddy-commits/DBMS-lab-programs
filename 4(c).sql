
USE Set4DB;

-- Disable warnings output temporarily during setup if tables exist
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS Enrollment, Course, Faculty, Student, Department;
SET foreign_key_checks = 1;

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create Faculty table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create Course table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade VARCHAR(5),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert sample records into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

-- Insert sample records into Student
INSERT INTO Student (student_id, student_name, dept_id) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 1),
(3, 'Mark Lee', 2);

-- Insert sample records into Faculty
INSERT INTO Faculty (faculty_id, faculty_name, dept_id) VALUES
(10, 'Dr. Alan Turing', 1);

-- Insert sample records into Course
INSERT INTO Course (course_id, course_name, faculty_id) VALUES
(501, 'Database Systems', 10),
(502, 'Calculus', 10);

-- Insert sample records into Enrollment
INSERT INTO Enrollment (student_id, course_id, grade) VALUES
(1, 501, 'A'),
(2, 501, 'B'),
(3, 502, 'A');

-- =========================================================
-- Q4.c) Find all students enrolled in a specific course
-- =========================================================

SELECT s.student_id,
       s.student_name,
       c.course_name,
       e.grade
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';