CREATE DATABASE BANKDB;
USE BANKDB;




-- Branch Table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(20),
    DOB DATE
);

-- Account Table
CREATE TABLE Account (
    AccountNumber INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    Type VARCHAR(20), -- Savings, Checking, etc.
    Balance DECIMAL(12,2),
    DateCreated DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Transaction Table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    Date DATE,
    Amount DECIMAL(12,2),
    Type VARCHAR(20), -- Deposit, Withdrawal, Transfer
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

-- Loan Table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(12,2),
    IssueDate DATE,
    Type VARCHAR(50), -- Home, Personal, etc.
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Loan_Assigned Table (Loan handled by one Employee)
CREATE TABLE Loan_Assigned (
    LoanID INT,
    EmployeeID INT,
    PRIMARY KEY (LoanID, EmployeeID),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Assist Table (Employees assist Customers in various operations)
CREATE TABLE Assist (
    EmployeeID INT,
    CustomerID INT,
    ActionType VARCHAR(100),
    ActionDate DATE,
    PRIMARY KEY (EmployeeID, CustomerID, ActionDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
