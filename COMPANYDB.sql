CREATE DATABASE companyDB;
 

 USE companyDB;


 CREATE TABLE EMPLOYEE (
    Ssn CHAR(9) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(50) NOT NULL,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    Super_ssn CHAR(9),
    Dno INT NULL,  -- initially allow null to avoid FK circularity
    FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
);

CREATE TABLE DEPARTMENT (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL UNIQUE,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE,
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT
FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);

CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT,
    Dlocation VARCHAR(100),
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);
CREATE TABLE PROJECT (
    Pnumber INT PRIMARY KEY,
    Pname VARCHAR(100),
    Plocation VARCHAR(100),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(5,2) CHECK (Hours >= 0),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);



