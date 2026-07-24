

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

-- ============================================
-- BOOKING TABLE
-- ============================================

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

-- ============================================
-- PAYMENT TABLE
-- ============================================

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

-- ============================================
-- STAFF TABLE
-- ============================================

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
