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

DROP TABLE Check_Record
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

);

INSERT INTO BRANCH (BRANCHID, NAME, LOCATION)
VALUES 
(1, 'Muscat Grand Hotel', 'Muscat'),
(2, 'Salalah Beach Resort', 'Salalah');

INSERT INTO ROOM (ROOMNUMBER, BRANCHID, TYPE, NIGHTLYRATE)
VALUES 
(101, 1, 'Single', 35.00),
(102, 1, 'Double', 50.00),
(201, 2, 'Suite', 120.00);

INSERT INTO CUSTOMER (CUSTOMERID, NAME)
VALUES 
(1, 'Ali Al-Harthy'),
(2, 'Fatma Al-Zahra');


INSERT INTO CUSTOMER_PHONE (CustomerID, Phone)
VALUES 
(1, '99887766'),
(2, '99332211');


INSERT INTO CUSTOMER_EMAIL (CustomerID, Email)
VALUES 
(1, 'ali@example.com'),
(2, 'fatma@example.com');


INSERT INTO BOOKING (BOOKINGID, CUSTOMERID, CheckInDate, CheckOutDate)
VALUES 
(1, 1, '2025-05-20', '2025-05-23'),
(2, 2, '2025-06-01', '2025-06-05');

INSERT INTO BOOKING_ROOM (BookingID, RoomNumber, BranchID)
VALUES 
(1, 101, 1),
(2, 201, 2);


INSERT INTO STAFF (StaffID, BranchID, Name, JobTitle, Salary)
VALUES 
(1, 1, 'Ahmed Al-Balushi', 'Receptionist', 450.00),
(2, 2, 'Salma Al-Nasseri', 'Housekeeper', 350.00);


INSERT INTO CHECK_RECORD (StaffID, CustomerID, BookingID, Role, Timestamp)
VALUES 
(1, 1, 1, 'Check-in Assistant', '2025-05-20 14:00:00'),
(2, 2, 2, 'Room Service', '2025-06-01 16:00:00');


SELECT * FROM STAFF;
SELECT * FROM BRANCH;
SELECT * FROM ROOM;
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER_PHONE;
SELECT * FROM CUSTOMER_EMAIL;
SELECT * FROM BOOKING;
SELECT * FROM Check_Record;
SELECT * FROM Booking_Room;

