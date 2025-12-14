##Select the database to work with
USE sql_third_assignment;

##Confirm the current database in use
SELECT DATABASE();

##create customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    loyalty_points INT,
    registration_date DATE,
    age INT
);

##Insert Data into customers table
INSERT INTO Customers (customer_id, name, loyalty_points, registration_date, age) VALUES
(101, 'Shehu Salihu', 150, '2019-05-15', 35),
(201, '``', 200, '2020-06-20', 42),
(305, 'Agnes Pam', 300, '2018-08-10', 29),
(405, 'Esther James', 120, '2022-01-05', 50),
(509, 'Larry Adams', 250, '2021-10-12', 32);

##create transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount_spent DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

##Insert Data into transactions table
INSERT INTO Transactions (transaction_id, customer_id, amount_spent, transaction_date) VALUES
(1, 101, 100, '2023-05-10'),
(2, 201, 200, '2023-05-11'),
(3, 305, 300, '2023-05-12'),
(4, 405, 400, '2023-05-13'),
(5, 509, 150, '2023-05-14'),
(6, 305, 500, '2023-05-15');

##create products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

##Insert Data into products table
INSERT INTO Products (product_id, product_name, price, category) VALUES
(102, 'Laptop', 200000, 'Electronics'),
(201, 'Smartphone', 500000, 'Electronics'),
(203, 'Blender', 120000, 'Home Appliance'),
(104, 'Sofa', 450000, 'Furniture'),
(107, 'Desk Lamp', 350000, 'Furniture');

##Show all existing tables in this database
SHOW TABLES;

##Using CASE Statement and Conditional Aggregation, Display total amount spent by customers below 40 years old
SELECT 
    CASE 
        WHEN c.age < 40 THEN 'Below 40'
        ELSE '40 and Above'
    END AS age_group,
    SUM(t.amount_spent) AS total_amount_spent
FROM Customers c
JOIN Transactions t
    ON c.customer_id = t.customer_id
GROUP BY 
    CASE 
        WHEN c.age < 40 THEN 'Below 40'
        ELSE '40 and Above'
    END;
    
##Create an index on transaction_date

##Total sales and number of transactions per customer, use GROUP BY.
SELECT 
    c.customer_id,
    CASE 
        WHEN c.name IS NULL OR c.name = '``' THEN 'Unknown Customer'
        ELSE c.name
    END AS name,
    SUM(t.amount_spent) AS total_sales,
    COUNT(t.transaction_id) AS number_of_transactions
FROM Customers c
JOIN Transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, name;

##Analyze the query execution plan and identify bottlenecks
EXPLAIN ANALYZE
SELECT 
    c.customer_id,
    CASE 
        WHEN c.name IS NULL OR c.name = '' THEN 'Unknown Customer'
        ELSE c.name
    END AS name,
    SUM(t.amount_spent) AS total_sales,
    COUNT(t.transaction_id) AS number_of_transactions
FROM Customers c
JOIN Transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, name;