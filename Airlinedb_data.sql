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


-- Insert Data
INSERT INTO Airport (Airport_code, City, State, Name)
VALUES 
('MCT', 'Muscat', 'Oman', 'Muscat International Airport'),
('DXB', 'Dubai', 'UAE', 'Dubai International Airport'),
('JFK', 'New York', 'USA', 'John F. Kennedy Airport');

INSERT INTO Airplane_Type (Type_name, Max_seats, Company)
VALUES 
('A320', 180, 'Airbus'),
('B737', 160, 'Boeing');

INSERT INTO Airplane (Airplane_id, Type_name, Total_no_of_seats)
VALUES 
(1, 'A320', 180),
(2, 'B737', 160);

INSERT INTO Flight (Number, Airline, Weekdays)
VALUES 
(1001, 'Oman Air', 'Mon,Tue,Wed'),
(2002, 'Emirates', 'Fri,Sat,Sun');

INSERT INTO Flight_Leg (Leg_no, Number, Scheduled_dep_time, Scheduled_arr_time, Departure_airport, Arrival_airport)
VALUES 
(1, 1001, '08:00', '10:00', 'MCT', 'DXB'),
(2, 2002, '15:00', '21:00', 'DXB', 'JFK');

INSERT INTO Leg_Instance (Leg_no, Date, Dep_time, Arr_time, No_of_avail_seats, Airplane_id)
VALUES 
(1, '2025-06-01', '08:10', '10:15', 170, 1),
(2, '2025-06-02', '15:05', '21:10', 150, 2);

INSERT INTO Fare (Number, Code, Amount, Restrictions)
VALUES 
(1001, 'ECO', 150.00, 'Non-refundable'),
(2002, 'BUS', 500.00, 'Refundable');

INSERT INTO Seat (Seat_no)
VALUES 
('1A'), ('1B'), ('1C'), ('2A'), ('2B');

INSERT INTO Reservation (Seat_no, Leg_no, Date, Customer_name, Cphone)
VALUES 
('1A', 1, '2025-06-01', 'Ahmed Al-Rashdi', '91234567'),
('1B', 2, '2025-06-02', 'Fatma Al-Busaidi', '91345678');

INSERT INTO Can_Land (Airport_code, Type_name)
VALUES 
('MCT', 'A320'),
('DXB', 'B737'),
('JFK', 'A320');

INSERT INTO Assigned (Leg_no, Date, Airplane_id)
VALUES 
(1, '2025-06-01', 1),
(2, '2025-06-02', 2);


SELECT * FROM Airport;
SELECT f.Number, f.Airline, fl.Leg_no, fl.Departure_airport, fl.Arrival_airport
FROM Flight f
JOIN Flight_Leg fl ON f.Number = fl.Number;

SELECT r.Customer_name, r.Seat_no, r.Date, l.Leg_no, a.Name AS DepartureAirport
FROM Reservation r
JOIN Leg_Instance l ON r.Leg_no = l.Leg_no AND r.Date = l.Date
JOIN Flight_Leg fl ON fl.Leg_no = r.Leg_no
JOIN Airport a ON fl.Departure_airport = a.Airport_code;
