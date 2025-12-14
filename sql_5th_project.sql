--Create Tables
--Customer Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

--Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

--Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


--Insert into Customers
INSERT INTO Customers VALUES
(1, 'John Doe', 'Lagos', 30, 'Male'),
(2, 'Jane Smith', 'Abuja', 28, 'Female'),
(3, 'Peter Adams', 'Port Harcourt', 40, 'Male'),
(4, 'Sarah Johnson', 'Kano', 35, 'Female');

--Insert into Products
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 350000),
(102, 'Phone', 'Electronics', 150000),
(103, 'Printer', 'Office', 85000);

--Insert into Sales
INSERT INTO Sales VALUES
(5001, 1, 101, '2024-01-10', 1, 350000),
(5002, 2, 102, '2024-02-15', 2, 300000),
(5003, 3, 103, '2024-03-20', 1, 85000),
(5004, 4, 101, '2024-03-25', 1, 350000);

SELECT * FROM Customers;

SELECT * FROM products;

SELECT * FROM sales;

--2. SQL View to Retrieve Customers Who Spent More Than ₦300,000
CREATE VIEW high_value_customers AS
SELECT 
    c.customer_id,
    c.name,
    SUM(s.total_amount) AS total_spent
FROM 
    Sales s
JOIN 
    Customers c ON s.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    SUM(s.total_amount) > 300000;

SELECT * FROM high_value_customers;


--3. Materialized View to Summarize Total Sales per Month
CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') AS month,
    SUM(total_amount) AS total_sales
FROM 
    Sales
GROUP BY 
    TO_CHAR(sale_date, 'YYYY-MM');

REFRESH MATERIALIZED VIEW monthly_sales_summary;
SELECT * FROM monthly_sales_summary;


--5. Stored Procedure to Increase Price of Phones by 10%
CREATE OR REPLACE PROCEDURE update_product_price()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET price = price * 1.10
    WHERE product_name = 'Phone';
END;
$$;

CALL update_product_price();

SELECT * FROM products;

