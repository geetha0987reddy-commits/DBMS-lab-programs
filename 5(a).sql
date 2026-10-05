-- Create and switch to database for Set 5
CREATE DATABASE IF NOT EXISTS Set5DB;
USE Set5DB;

-- Clean up existing tables to prevent duplicate key or schema conflicts
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS Course, Faculty, Department;
SET foreign_key_checks = 1;

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
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

-- Insert sample records into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert sample records into Faculty
INSERT INTO Faculty (faculty_id, faculty_name, dept_id) VALUES
(101, 'Dr. Alan Turing', 1),
(102, 'Dr. Ada Lovelace', 1),
(103, 'Dr. Isaac Newton', 3);

-- Insert sample records into Course
INSERT INTO Course (course_id, course_name, faculty_id) VALUES
(501, 'Database Systems', 101),
(502, 'Data Structures', 102),
(503, 'Classical Mechanics', 103);

-- =========================================================
-- Q5.a) Display courses along with the corresponding faculty names
-- =========================================================

SELECT c.course_id,
       c.course_name,
       f.faculty_name
FROM Course c
JOIN Faculty f ON c.faculty_id = f.faculty_id;