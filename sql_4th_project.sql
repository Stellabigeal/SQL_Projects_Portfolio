USE sql_fourth_assignment

##1. Convert into 1NF: Remove duplicate values and ensure atomicity
##Create the Employee_1NF table
CREATE TABLE Employee_1NF (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    department_location VARCHAR(50),
    manager_id INT
);

INSERT INTO Employee_1NF (emp_id, emp_name, department, salary, department_location, manager_id)
VALUES
(101, 'Umar Adamu', 'HR', 50000, 'Lokoja', 201),
(102, 'Jane Abu', 'IT', 60000, 'Cross River', 202),
(103, 'Caroline Agu', 'Finance', 55000, 'Sokoto', 203),
(104, 'Shehu Umar', 'Logistics', 48000, 'Zamfara', 204),
(105, 'Mohammed Bello', 'Procurement', 53000, 'Jigawa', 205),
(106, 'Frank Ewu', 'IT', 62000, 'Delta', 202);

SELECT*
FROM Employee_1NF

##2. Transform into 2NF: Eliminate partial dependencies by creating separate tables.
##Create the Department_2NF table
CREATE TABLE Department_2NF (
    department VARCHAR(50) PRIMARY KEY,
    department_location VARCHAR(50),
    manager_id INT
);

INSERT INTO Department_2NF (department, department_location, manager_id)
VALUES
('HR', 'Lokoja', 201),
('IT', 'Cross River', 202),
('Finance', 'Sokoto', 203),
('Logistics', 'Zamfara', 204),
('Procurement', 'Jigawa', 205);

##Create the Employee_2NF table
CREATE TABLE Employee_2NF (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (department) REFERENCES Department_2NF(department)
);

INSERT INTO Employee_2NF (emp_id, emp_name, department, salary)
VALUES
(101, 'Umar Adamu', 'HR', 50000),
(102, 'Jane Abu', 'IT', 60000),
(103, 'Caroline Agu', 'Finance', 55000),
(104, 'Shehu Umar', 'Logistics', 48000),
(105, 'Mohammed Bello', 'Procurement', 53000),
(106, 'Frank Ewu', 'IT', 62000);

##3. Achieve 3NF: Remove transitive dependencies and ensure all non-key attributes depend only on the primary key.
CREATE TABLE Manager_3NF (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50)
);

##Insert manager id into Manager_3NF table
INSERT INTO Manager_3NF (manager_id)
VALUES
(201),
(202),
(203),
(204),
(205);


CREATE TABLE Department_3NF (
    department VARCHAR(50) PRIMARY KEY,
    department_location VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Manager_3NF(manager_id)
);

INSERT INTO Department_3NF (department, department_location, manager_id)
VALUES
('HR', 'Lokoja', 201),
('IT', 'Cross River', 202),
('Finance', 'Sokoto', 203),
('Logistics', 'Zamfara', 204),
('Procurement', 'Jigawa', 205);

CREATE TABLE Employee_3NF (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (department) REFERENCES Department_3NF(department)
);

INSERT INTO Employee_3NF (emp_id, emp_name, department, salary)
VALUES
(101, 'Umar Adamu', 'HR', 50000),
(102, 'Jane Abu', 'IT', 60000),
(103, 'Caroline Agu', 'Finance', 55000),
(104, 'Shehu Umar', 'Logistics', 48000),
(105, 'Mohammed Bello', 'Procurement', 53000),
(106, 'Frank Ewu', 'IT', 62000);

##4. Transform Data — Increase IT Department Salaries by 10%
UPDATE Employee_3NF
SET salary = salary * 1.10
WHERE department = 'IT';






CREATE DATABASE fifth_sql_assignment;

##Switch to the new database
USE fifth_sql_assignment;
