CREATE DATABASE airlineDB;

use airlineDB;



-- Table: Airport
CREATE TABLE Airport (
    Airport_code CHAR(5) PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Name VARCHAR(100)
);

-- Table: Airplane_Type
CREATE TABLE Airplane_Type (
    Type_name VARCHAR(50) PRIMARY KEY,
    Max_seats INT,
    Company VARCHAR(100)
);

-- Table: Airplane
CREATE TABLE Airplane (
    Airplane_id INT PRIMARY KEY,
    Type_name VARCHAR(50),
    Total_no_of_seats INT,
    FOREIGN KEY (Type_name) REFERENCES Airplane_Type(Type_name)
);

-- Table: Flight
CREATE TABLE Flight (
    Number INT PRIMARY KEY,
    Airline VARCHAR(100),
    Weekdays VARCHAR(100)
);

-- Table: Flight_Leg
CREATE TABLE Flight_Leg (
    Leg_no INT PRIMARY KEY,
    Number INT,
    Scheduled_dep_time TIME,
    Scheduled_arr_time TIME,
    Departure_airport CHAR(3),
    Arrival_airport CHAR(3),
    FOREIGN KEY (Number) REFERENCES Flight(Number),
    FOREIGN KEY (Departure_airport) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Arrival_airport) REFERENCES Airport(Airport_code)
);

-- Table: Leg_Instance
CREATE TABLE Leg_Instance (
    Leg_no INT,
    Date DATE,
    Dep_time TIME,
    Arr_time TIME,
    No_of_avail_seats INT,
    Airplane_id INT,
    PRIMARY KEY (Leg_no, Date),
    FOREIGN KEY (Leg_no) REFERENCES Flight_Leg(Leg_no),
    FOREIGN KEY (Airplane_id) REFERENCES Airplane(Airplane_id)
);

-- Table: Fare
CREATE TABLE Fare (
    Number INT,
    Code VARCHAR(10),
    Amount DECIMAL(10, 2),
    Restrictions TEXT,
    PRIMARY KEY (Number, Code),
    FOREIGN KEY (Number) REFERENCES Flight(Number)
);
-- Table: Seat
CREATE TABLE Seat (
    Seat_no VARCHAR(10) PRIMARY KEY
);

-- Table: Reservation
CREATE TABLE Reservation (
    Seat_no VARCHAR(10),
    Leg_no INT,
    Date DATE,
    Customer_name VARCHAR(100),
    Cphone VARCHAR(20),
    PRIMARY KEY (Seat_no, Leg_no, Date),
    FOREIGN KEY (Seat_no) REFERENCES Seat(Seat_no),
    FOREIGN KEY (Leg_no, Date) REFERENCES Leg_Instance(Leg_no, Date)
);

-- Table: Can_Land
CREATE TABLE Can_Land (
    Airport_code CHAR(3),
    Type_name VARCHAR(50),
    PRIMARY KEY (Airport_code, Type_name),
    FOREIGN KEY (Airport_code) REFERENCES Airport(Airport_code),
    FOREIGN KEY (Type_name) REFERENCES Airplane_Type(Type_name)
);

-- Table: Assigned
CREATE TABLE Assigned (
    Leg_no INT,
    Date DATE,
    Airplane_id INT,
    PRIMARY KEY (Leg_no, Date),
    FOREIGN KEY (Leg_no, Date) REFERENCES Leg_Instance(Leg_no, Date),
    FOREIGN KEY (Airplane_id) REFERENCES Airplane(Airplane_id)
);
