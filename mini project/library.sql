CREATE DATABASE Labmansystem;
USE LabmanSystem;
-- BOOKS TABLE
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    available_copies INT NOT NULL DEFAULT 0,

    CHECK (price > 0),
    CHECK (available_copies >= 0)
);

-- STUDENT TABLE
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    department VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    CHECK (year BETWEEN 1 AND 4)
);
-- ISSUE TABLE
CREATE TABLE IssuedBook (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);

SHOW TABLES;

--  INSERT DATA IN BOOK TABLE
INSERT INTO Books (book_name, author, category, price, available_copies)
VALUES
('Java Programming', 'James Gosling', 'Programming', 550, 10),
('Database System', 'Korth', 'Database', 650, 5),
('Python Basics', 'Guido van Rossum', 'Programming', 450,8),
('Operating System', 'Galvin', 'Computer', 700, 6),
('Computer Networks', 'Tanenbaum', 'Networking', 800, 4);
-- INSERT DATA IN STUDENT TABLE
INSERT INTO Student (student_name, email, department, year)
VALUES
('Shubham', 'shubham@gmail.com', 'IT', 3),
('Rahul', 'rahul@gmail.com', 'Computer', 2),
('Sneha', 'sneha@gmail.com', 'IT', 4),
('Priya', 'priya@gmail.com', 'ENTC', 1),
('Amit', 'amit@gmail.com', 'Mechanical', 2);
-- ISERT DATA IN ISSUSED BOOK 
INSERT INTO IssuedBook (student_id, book_id, issue_date, return_date)
VALUES
(1, 2, '2026-07-18', '2026-08-01'),
(2, 1, '2026-07-17', NULL),
(3, 5, '2026-07-16', '2026-07-30');
-- pratice questions(Simple querys)
SELECT * FROM Books;
SELECT * FROM Student;
SELECT * FROM IssuedBook;
SELECT book_name FROM Books;
SELECT book_name , price FROM Books;
SELECT * FROM Student
WHERE department='IT';
SELECT * FROM Books
ORDER BY available_copies DESC;

-- practice intermediate
UPDATE Books
SET price=600
WHERE book_name='java Programming';
SET SQL_SAFE_UPDATES =0;
DELETE FROM Student
WHERE student_name = 'Amit';
SELECT * FROM Student;
SELECT * FROM Books
WHERE book_name LIKE '%Java%';
SELECT * FROM Books
WHERE price BETWEEN 500 AND 800;
SELECT * FROM Student
WHERE department IN ('IT', 'Computer');
SELECT * FROM Student
WHERE department IN ('IT','Computer');
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT
    category,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY category;
SELECT
    category,
    AVG(price) AS AveragePrice
FROM Books
GROUP BY category;

-- having 

SELECT
    category,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY category
HAVING COUNT(*) > 1;

SELECT
    department,
    COUNT(*) AS TotalStudents
FROM Student
GROUP BY department
HAVING COUNT(*) > 1;



 DROP TABLE Student;
 drop database StuManSystem;
  DROP table IssuedBook ;
