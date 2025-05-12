CREATE DATABASE UniversityDB;
GO

USE UniversityDB;
GO

USE UniversityDB;
GO

DROP TABLE IF EXISTS Enrolls, Course, Student, Instructor, Department;
GO

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Building VARCHAR(100) DEFAULT ('Main')
);
GO

CREATE TABLE Instructor (
    InstID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL,
    DeptID INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
GO

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    MajorDeptID INT NOT NULL,
    FOREIGN KEY (MajorDeptID) REFERENCES Department(DeptID)
);
GO

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT NOT NULL CHECK (Credits > 0),
    DeptID INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
GO

CREATE TABLE Enrolls (
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Grade CHAR(2) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F', 'I')),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
GO

