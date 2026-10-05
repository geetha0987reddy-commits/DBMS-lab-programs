CREATE DATABASE UniversityDB;
use UniversityDB;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Dept_ID INT,
    Major VARCHAR(50),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Faculty_ID INT,
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

CREATE TABLE Enrollment (
    Student_ID INT,
    Course_ID INT,
    Grade VARCHAR(5),
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

#inserting values
INSERT INTO Department VALUES
(1, 'CSE'),
(2, 'IT'),
(3, 'ECE');

INSERT INTO Faculty VALUES
(101, 'Ravi', 1),
(102, 'Priya', 2),
(103, 'Kiran', 3);

INSERT INTO Student VALUES
(201, 'Anu', 1, 'AI'),
(202, 'David', 2, 'Cloud Computing'),
(203, 'Rahul', 1, 'Data Science');

INSERT INTO Course VALUES
(301, 'DBMS', 101),
(302, 'Python', 102),
(303, 'IoT', 103);

INSERT INTO Enrollment VALUES
(201, 301, 'A'),
(202, 302, 'B'),
(203, 301, 'A');


SELECT * FROM Department;
SELECT * FROM Faculty;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;