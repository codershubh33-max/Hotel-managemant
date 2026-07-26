

-- Create Database
CREATE DATABASE HotelManagementSystem;

-- Use Database
USE HotelManagementSystem;

CREATE TABLE Hotel(
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);



CREATE TABLE RoomType(
    room_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL
);



CREATE TABLE Room(
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type_id INT,
    status ENUM('Available','Booked','Maintenance') DEFAULT 'Available',

    FOREIGN KEY (hotel_id)
    REFERENCES Hotel(hotel_id),

    FOREIGN KEY (room_type_id)
    REFERENCES RoomType(room_type_id)
);

CREATE TABLE Customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female','Other'),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);



CREATE TABLE Booking(
    booking_id INT PRIMARY KEY AUTO_INCREMENT,

    customer_id INT,
    room_id INT,

    check_in DATE,
    check_out DATE,

    total_amount DECIMAL(10,2),

    booking_status ENUM('Confirmed','Cancelled','Completed')
    DEFAULT 'Confirmed',

    FOREIGN KEY(customer_id)
    REFERENCES Customer(customer_id),

    FOREIGN KEY(room_id)
    REFERENCES Room(room_id)
);


CREATE TABLE Payment(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,

    booking_id INT,

    payment_date DATE,

    payment_method ENUM('Cash','Card','UPI'),

    amount DECIMAL(10,2),

    payment_status ENUM('Paid','Pending')
    DEFAULT 'Pending',

    FOREIGN KEY(booking_id)
    REFERENCES Booking(booking_id)
);



CREATE TABLE Staff(
    staff_id INT PRIMARY KEY AUTO_INCREMENT,

    hotel_id INT,

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    designation VARCHAR(50),

    salary DECIMAL(10,2),

    phone VARCHAR(15),

    FOREIGN KEY(hotel_id)
    REFERENCES Hotel(hotel_id)
);


-- HOTEL DATA

INSERT INTO Hotel(hotel_name, city, state, phone, email)
VALUES
(' shauryawada','Pune','Maharashtra','9876543210','shauya@hotel.com'),
('jagdamba','kolhapur','Maharashtra','9876543211','jagdmba@hotel.com'),
('akshay','sinhgad','Maharashtra','9876543212','akshay@hotel.com');

-- ROOM TYPES

INSERT INTO RoomType(type_name, price_per_night)
VALUES
('Single',1500),
('Double',2500),
('triple',4500),
('bighall',3000);



-- ROOMS

INSERT INTO Room(hotel_id, room_number, room_type_id, status)
VALUES
(1,'101',1,'Available'),
(1,'102',2,'Booked'),
(1,'103',3,'Available'),
(1,'104',4,'Maintenance'),

(2,'201',1,'Available'),
(2,'202',2,'Available'),
(2,'203',3,'Booked'),

(3,'301',1,'Available'),
(3,'302',2,'Booked'),
(3,'303',4,'Available');

-- CUSTOMERS

INSERT INTO Customer(first_name,last_name,gender,phone,email,city)
VALUES
('Rahul','Sharma','Male','9876500001','rahul@gmail.com','Pune'),
('Priya','Patil','Female','9876500002','priya@gmail.com','Mumbai'),
('Amit','Joshi','Male','9876500003','amit@gmail.com','Nagpur'),
('Sneha','Kulkarni','Female','9876500004','sneha@gmail.com','Nashik'),
('Rohan','Patel','Male','9876500005','rohan@gmail.com','Surat');

------------------------------------------------

-- BOOKINGS

INSERT INTO Booking(customer_id,room_id,check_in,check_out,total_amount,booking_status)
VALUES
(1,2,'2026-07-28','2026-07-30',5000,'Confirmed'),
(2,7,'2026-07-29','2026-08-02',18000,'Confirmed'),
(3,9,'2026-07-30','2026-08-01',5000,'Completed'),
(4,3,'2026-08-01','2026-08-04',13500,'Confirmed'),
(5,10,'2026-08-05','2026-08-07',14000,'Cancelled');

------------------------------------------------

-- PAYMENTS

INSERT INTO Payment(booking_id,payment_date,payment_method,amount,payment_status)
VALUES
(1,'2026-07-28','UPI',5000,'Paid'),
(2,'2026-07-29','Card',18000,'Paid'),
(3,'2026-07-30','Cash',5000,'Paid'),
(4,'2026-08-01','UPI',13500,'Pending'),
(5,'2026-08-05','Card',14000,'Pending');

-- STAFF

INSERT INTO Staff(hotel_id,first_name,last_name,designation,salary,phone)
VALUES
(1,'Suresh','Patil','Manager',55000,'9999000001'),
(1,'Kiran','Shinde','Receptionist',30000,'9999000002'),
(2,'Ajay','More','Manager',60000,'9999000003'),
(2,'Pooja','Joshi','Receptionist',32000,'9999000004'),
(3,'Vikas','Kale','Housekeeping',25000,'9999000005');


--  practice
-- SELECT * FROM Hotel;

-- SELECT * FROM RoomType;

-- SELECT * FROM Room;

-- SELECT * FROM Customer;

-- SELECT * FROM Booking;

-- SELECT * FROM Payment;

-- SELECT * FROM Staff;