-- Create Database
CREATE DATABASE IF NOT EXISTS online_retail;
USE online_retail;

-- 1. Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 2. Insert Sample Data
INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Prajuth', 'Hyderabad'),
(2, 'Rushil', 'Mumbai'),
(3, 'Nani', 'Bangalore'),
(4, 'Johnny', 'Chennai'),
(5, 'Rahul', 'Delhi');

INSERT INTO Products (product_id, name, category, price) VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Smartphone', 'Electronics', 800.00),
(103, 'Chair', 'Furniture', 150.00),
(104, 'Table', 'Furniture', 250.00),
(105, 'Headphones', 'Electronics', 100.00);

-- Johnny (4) and Rahul (5) have no orders (inactive users)
INSERT INTO Orders (order_id, customer_id, date) VALUES
(1001, 1, '2023-01-15'),
(1002, 2, '2023-01-20'),
(1003, 1, '2023-02-10'),
(1004, 3, '2023-02-15'),
(1005, 2, '2023-03-05');

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1001, 101, 1),
(1001, 105, 2),
(1002, 102, 1),
(1003, 103, 4),
(1004, 104, 1),
(1004, 105, 1),
(1005, 101, 1);

-- 3. Queries

-- Top-selling products
SELECT
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity_sold
FROM
    Products p
JOIN
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY
    p.product_id, p.name
ORDER BY
    total_quantity_sold DESC;

-- Most valuable customers
SELECT
    c.customer_id,
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM
    Customers c
JOIN
    Orders o ON c.customer_id = o.customer_id
JOIN
    Order_Items oi ON o.order_id = oi.order_id
JOIN
    Products p ON oi.product_id = p.product_id
GROUP BY
    c.customer_id, c.name
ORDER BY
    total_spent DESC;

-- Monthly revenue
SELECT
    EXTRACT(YEAR FROM o.date) AS order_year,
    EXTRACT(MONTH FROM o.date) AS order_month,
    SUM(p.price * oi.quantity) AS monthly_revenue
FROM
    Orders o
JOIN
    Order_Items oi ON o.order_id = oi.order_id
JOIN
    Products p ON oi.product_id = p.product_id
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- Category-wise sales
SELECT
    p.category,
    SUM(oi.quantity) AS total_items_sold,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    Products p
JOIN
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY
    p.category
ORDER BY
    total_revenue DESC;

-- Inactive customers
SELECT
    c.customer_id,
    c.name,
    c.city
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;