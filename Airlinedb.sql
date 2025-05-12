CREATE DATABASE airlineDB;

use airlineDB;



CREATE TABLE Booking (
    BookingID VARCHAR(10) PRIMARY KEY,
    PassengerName VARCHAR(100) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL
);

CREATE TABLE flight (
    flightID VARCHAR(10) PRIMARY KEY,
    Route VARCHAR(100) NOT NULL,
    
);

CREATE TABLE FLIGHT_BOOKING (
BookingID VARCHAR(10),
FlightID VARCHAR(10),
SeatNumber VARCHAR(10),
    PRIMARY KEY (BookingID, FlightID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);
