# SQL_Projects_Portfolio

This repository contains **five SQL projects** demonstrating my ability to **design databases, analyze data, optimize queries, and solve real-world business problems using SQL**.

The projects cover **data analysis, database design, performance optimization, automation, and normalization**, making this repository suitable for **Data Analyst, Business Intelligence, and Junior Data Engineer roles**.

---

##  Skills Demonstrated

- SQL querying & analysis
- Database schema design
- Joins, subqueries & CTEs
- Window functions & aggregations
- Views & materialized views
- Stored procedures
- Database normalization (1NF–3NF)
- Performance awareness

---

##  Project Overviews

---

## 1. Customer & Transaction Analysis

**Objective:**  
Analyze customer transactions to understand spending behavior and transaction trends.

**What Was Done:**
- Created customer and transaction tables
- Used **LEFT and RIGHT JOINs** to merge datasets
- Identified customers with the **highest total spending**
- Filtered customers by location
- Applied **window functions** (`RANK`, `LAG`, `LEAD`) to analyze transaction sequences

**Business Value:**  
Helps organizations identify **top customers** and understand transaction patterns.

**SQL Concepts Used:**  
Joins, subqueries, aggregations, window functions

---

## 2. Sales & Revenue Analysis Using CTEs

**Objective:**  
Analyze customer orders and revenue performance across products and states.

**What Was Done:**
- Built order and payment tables
- Calculated **total revenue per customer** using a **CTE**
- Generated **subtotals by state and product** using `ROLLUP`
- Extracted **year and month** from order dates

**Business Value:**  
Supports sales trend analysis and regional performance tracking.

**SQL Concepts Used:**  
CTEs, ROLLUP, date functions, revenue calculations

---

## 3. Customer Behavior & Performance Analysis

**Objective:**  
Understand customer behavior using demographics and transaction history.

**What Was Done:**
- Created customer, transaction, and product tables
- Segmented customers by **age group using CASE statements**
- Calculated **total sales and transaction counts per customer**
- Handled missing or invalid customer data
- Analyzed query performance using `EXPLAIN ANALYZE`

**Business Value:**  
Improves customer segmentation and data quality for analytics.

**SQL Concepts Used:**  
CASE statements, conditional aggregation, data cleaning, performance analysis

---

## 4. Sales Automation with Views & Stored Procedures

**Objective:**  
Automate sales reporting and pricing updates using advanced SQL features.

**What Was Done:**
- Built a relational sales database (customers, products, sales)
- Created a **view** to identify **high-value customers**
- Created a **materialized view** for **monthly sales summaries**
- Developed a **stored procedure** to automatically increase product prices

**Business Value:**  
Improves reporting speed, supports pricing decisions, and reduces manual work.

**SQL Concepts Used:**  
Views, materialized views, stored procedures, automation

---

## 5. Database Normalization (1NF → 3NF)

**Objective:**  
Design an efficient and scalable employee database using normalization principles.

**What Was Done:**
- Converted raw employee data into **1NF** (atomic values)
- Eliminated partial dependencies using **2NF**
- Removed transitive dependencies using **3NF**
- Created separate tables for employees, departments, and managers
- Applied controlled salary updates by department

**Business Value:**  
Ensures data consistency, reduces redundancy, and improves long-term scalability.

**SQL Concepts Used:**  
Normalization, foreign keys, schema design, safe updates

---

## 🛠 Tools & Technologies

- SQL (MySQL / PostgreSQL compatible)
- Relational Databases
- Git & GitHub

---

##  How to Use This Repository

1. Clone the repository:
   ```bash
   git clone https://github.com/Stellabigeal/sql-projects-portfolio.git


