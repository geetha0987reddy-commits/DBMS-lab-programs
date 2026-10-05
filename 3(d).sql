-- Create and switch to database for Set 3
CREATE DATABASE IF NOT EXISTS Set3DB;
USE Set3DB;

-- Create sample tables for set operations
CREATE TABLE IF NOT EXISTS Course_A (
    student_id INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Course_B (
    student_id INT PRIMARY KEY
);

-- Populate sample data
INSERT INTO Course_A (student_id) VALUES (101), (102), (103)
ON DUPLICATE KEY UPDATE student_id = VALUES(student_id);

INSERT INTO Course_B (student_id) VALUES (102), (103), (104)
ON DUPLICATE KEY UPDATE student_id = VALUES(student_id);

-- =========================================================
-- Q3.d) Perform UNION, INTERSECTION and SET DIFFERENCE
-- =========================================================

-- 1. UNION (Combines distinct records from both sets)
SELECT student_id FROM Course_A
UNION
SELECT student_id FROM Course_B;


-- 2. INTERSECTION (Returns records present in both sets)
-- MySQL 8.0+ native syntax:
SELECT student_id FROM Course_A
INTERSECT
SELECT student_id FROM Course_B;

-- Equivalent query for older MySQL versions (< 8.0):
-- SELECT student_id FROM Course_A WHERE student_id IN (SELECT student_id FROM Course_B);


-- 3. SET DIFFERENCE (Returns records in Course_A that are NOT in Course_B)
-- MySQL 8.0+ native syntax:
SELECT student_id FROM Course_A
EXCEPT
SELECT student_id FROM Course_B;

-- Equivalent query for older MySQL versions (< 8.0):
-- SELECT student_id FROM Course_A WHERE student_id NOT IN (SELECT student_id FROM Course_B);