CREATE DATABASE HOTELDB;
USE HOTELDB;

CREATE TABLE BRANCH(
BRANCHID INT PRIMARY KEY,
NAME VARCHAR(100),
LOCATION VARCHAR(100),
);

CREATE TABLE ROOM(
ROOMNUMBER INT,
BRANCHID INT,
TYPE VARCHAR(100),
NIGHTLYRATE DECIMAL (10,2),
    PRIMARY KEY (RoomNumber, BranchID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE CUSTOMER(
CUSTOMERID INT PRIMARY KEY,
NAME VARCHAR(100),
);

CREATE TABLE CUSTOMER_PHONE(
CustomerID INT,
    Phone VARCHAR(20),
    PRIMARY KEY (CustomerID, Phone),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CUSTOMER_EMAIL(
CustomerID INT,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID, Email),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE BOOKING(
BOOKINGID INT PRIMARY KEY,
CUSTOMERID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Booking_Room (Associative table)
CREATE TABLE Booking_Room (
    BookingID INT,
    RoomNumber INT,
    BranchID INT,
    PRIMARY KEY (BookingID, RoomNumber, BranchID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (RoomNumber, BranchID) REFERENCES Room(RoomNumber, BranchID)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    BranchID INT,
    Name VARCHAR(100),
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Check_Record Table
CREATE TABLE Check_Record (
    StaffID INT,
    CustomerID INT,
    BookingID INT,
    Role VARCHAR(50),
    Timestamp DATETIME,
    PRIMARY KEY (StaffID, CustomerID, BookingID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);