USE sql_first_assignment;
SHOW TABLES;
SELECT DATABASE();

DROP TABLE IF EXISTS `customer_first _asignment`;

CREATE TABLE customer (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  State VARCHAR(100),
  Income DECIMAL(10,2)
);

INSERT INTO customer (Customer_ID, Name, State, Income) VALUES
(3021, 'Kolawale Saidu', 'Lagos', 85000),
(3028, 'Ade Abu', 'Edo', 120000),
(3067, 'Imabong Udo', 'Akwa Ibom', 65000),
(3078, 'Diana Ross', 'Cross River', 95000),
(3097, 'Adullahi Usman', NULL, 70000),
(3043, 'Jefferson Chris', 'Taraba', 51000),
(3056, 'Chidinma Ikena', 'Abia', 67000);

SELECT * FROM customer;

CREATE TABLE transactions (
    Transaction_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Amount DECIMAL(10,2),
    Transaction_Type VARCHAR(20),
    Date DATE
);


INSERT INTO transactions (Transaction_ID, Customer_ID, Amount, Transaction_Type, Date) VALUES
('T001', 3021, 8000, 'Credit', '2024-12-01'),
('T002', 3028, 1000, 'Debit', '2024-12-02'),
('T003', 3078, 4000, 'Credit', '2024-12-03'),
('T004', 3067, 1500, 'Credit', '2024-12-03'),
('T005', 3021, 15000, 'Debit', '2024-12-04'),
('T006', 3097, 30000, 'Debit', '2024-12-05'),
('T007', 3028, 90000, 'Credit', '2024-12-05'),
('T008', 3056, 7600, 'Debit', '2024-12-06'),
('T009', 3043, 5800, 'Credit', '2024-12-06');

SELECT * FROM transactions;


SELECT 
    c.Customer_ID,
    c.Name,
    c.State,
    c.Income,
    t.Transaction_ID,
    t.Amount,
    t.Transaction_Type,
    t.Date
FROM customer c
LEFT JOIN transactions t ON c.Customer_ID = t.Customer_ID

UNION

SELECT 
    c.Customer_ID,
    c.Name,
    c.State,
    c.Income,
    t.Transaction_ID,
    t.Amount,
    t.Transaction_Type,
    t.Date
FROM customer c
RIGHT JOIN transactions t ON c.Customer_ID = t.Customer_ID;

SELECT Customer_ID, Name, TotalAmount
FROM (
    SELECT 
        c.Customer_ID,
        c.Name,
        SUM(t.Amount) AS TotalAmount
    FROM customer c
    JOIN transactions t
        ON c.Customer_ID = t.Customer_ID
    GROUP BY c.Customer_ID, c.Name
) AS Sub
WHERE TotalAmount = (
    SELECT MAX(TotalAmount)
    FROM (
        SELECT SUM(Amount) AS TotalAmount
        FROM transactions
        GROUP BY Customer_ID
    ) AS InnerSub
);

SELECT Customer_ID, Name, State, Income
FROM customer
WHERE State = 'Lagos'

UNION

SELECT Customer_ID, Name, State, Income
FROM customer
WHERE State = 'Edo';

SELECT
    Transaction_ID,
    Customer_ID,
    Amount,
    Transaction_Type,
    Date,
    RANK() OVER (ORDER BY Amount DESC) AS RankByAmount,
    LAG(Amount, 1) OVER (ORDER BY Date) AS PrevAmount,
    LEAD(Amount, 1) OVER (ORDER BY Date) AS NextAmount
FROM transactions;