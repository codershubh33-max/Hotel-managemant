-- Create Database
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

-- Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- Insert Sample Data
INSERT INTO Employee
(first_name,last_name,gender,email,phone,department,designation,salary,hire_date,city,state)
VALUES
('Rahul','Sharma','Male','rahul@gmail.com','9271698133','IT','Java Developer',55000,'2024-01-10','Pune','Maharashtra'),
('Priya','Patil','Female','priya@gmail.com','9271698131','HR','HR Executive',42000,'2023-09-15','Mumbai','Maharashtra'),
('Amit','Verma','Male','amit@gmail.com','9271698130','Finance','Accountant',48000,'2022-05-20','satara','Maharashtra'),
('Sneha','Kulkarni','Female','sneha@gmail.com','9271698135','IT','Software Engineer',65000,'2023-02-18','Pune','Maharashtra'),
('Rohan','Joshi','Male','rohan@gmail.com','9271698136','Sales','Sales Executive',40000,'2024-03-05','numbai','Maharashtra');

-- show All Employees
SELECT * FROM Employee;
--  Employee by ID
SELECT * FROM Employee
WHERE emp_id = 1;

-- Employees from IT Department
SELECT * FROM Employee
WHERE department = 'IT';

-- Employees with Salary Greater Than 50000
SELECT * FROM Employee
WHERE salary > 50000;

-- Employees Ordered by Salary
SELECT * FROM Employee
ORDER BY salary DESC;

-- Update Salary
UPDATE Employee
SET salary = 70000
WHERE emp_id = 1;

-- Update Department
UPDATE Employee
SET department = 'Development'
WHERE emp_id = 4;

-- Delete Employee
DELETE FROM Employee
WHERE emp_id = 5;

-- Count Employees
SELECT COUNT(*) AS TotalEmployees
FROM Employee;

-- Average Salary
SELECT AVG(salary) AS AverageSalary
FROM Employee;

-- Maximum Salary
SELECT MAX(salary) AS HighestSalary
FROM Employee;

-- Minimum Salary
SELECT MIN(salary) AS LowestSalary
FROM Employee;

-- Total Salary
SELECT SUM(salary) AS TotalSalary
FROM Employee;

-- Department-wise Employee Count
SELECT department, COUNT(*) AS Total
FROM Employee
GROUP BY department;

-- Search Employee by Name
SELECT *
FROM Employee
WHERE first_name LIKE 'R%';

-- Active Employees
SELECT *
FROM Employee
WHERE status = 'Active';

-- Employees Hired After 2023
SELECT *
FROM Employee
WHERE hire_date > '2023-01-01';