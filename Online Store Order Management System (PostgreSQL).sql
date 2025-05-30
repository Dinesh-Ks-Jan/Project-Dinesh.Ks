CREATE DATABASE OnlineStore;
USE OnlineStore;


CREATE TABLE Customers (
CUSTOMER_ID SERIAL PRIMARY KEY,
NAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(100) UNIQUE NOT NULL,
PHONE VARCHAR(15),
ADDRESS TEXT
);
CREATE TABLE Products (
PRODUCT_ID SERIAL PRIMARY KEY,
PRODUCT_NAME VARCHAR(100) NOT NULL,
CATEGORY VARCHAR(50),
PRICE DECIMAL(10, 2) NOT NULL,
STOCK INT NOT NULL
);
CREATE TABLE Orders (
ORDER_ID SERIAL PRIMARY KEY,
CUSTOMER_ID INT,
PRODUCT_ID INT,
QUANTITY INT NOT NULL,
ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (CUSTOMER_ID) REFERENCES Customers(CUSTOMER_ID) ON
DELETE CASCADE,
FOREIGN KEY (PRODUCT_ID) REFERENCES Products(PRODUCT_ID) ON DELETE
CASCADE
);
INSERT INTO Customers (CUSTOMER_ID, NAME, EMAIL, PHONE, ADDRESS)
VALUES
(1,'John Doe', 'john.doe@email.com', '123-456-7890', '123 Elm St,
Springfield'),
(2,'Jane Smith', 'jane.smith@email.com', '987-654-3210', '456 Oak
St, Springfield'),
(3,'Emily Johnson', 'emily.johnson@email.com', '555-123-4567', '789
Pine St, Springfield'),
(4,'Michael Brown', 'michael.brown@email.com', '555-234-5678', '101
Maple St, Springfield'),
(5,'Sarah Lee', 'sarah.lee@email.com', '555-345-6789', '202 Birch
St, Springfield'),
(6,'David Williams', 'david.williams@email.com', '555-456-7890',
'303 Cedar St, Springfield'),
(7,'Laura Wilson', 'laura.wilson@email.com', '555-567-8901', '404
Walnut St, Springfield'),
(8,'James Moore', 'james.moore@email.com', '555-678-9012', '505
Pineapple St, Springfield'),
(9,'Sophia Harris', 'sophia.harris@email.com', '555-789-0123', '606
Cherry St, Springfield'),
(10,'Daniel Martinez', 'daniel.martinez@email.com', '555-890-1234',
'707 Chestnut St, Springfield'),
(11,'Vijay', 'vijay.thalapathy@email.com', '777-890-1234', '807
Panayur St, Chennai');
INSERT INTO Products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE, STOCK)
VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 799.99, 120),
(3, 'Headphones', 'Accessories', 199.99, 75),
(4, 'Smartwatch', 'Electronics', 249.99, 30),
(5, 'Backpack', 'Fashion', 49.99, 200),
(6, 'Running Shoes', 'Footwear', 89.99, 100),
(7, 'Gaming Mouse', 'Accessories', 49.99, 150),
(8, 'Office Chair', 'Furniture', 149.99, 60),
(9, 'Bluetooth Speaker', 'Electronics', 59.99, 0),
(10, 'Desk Lamp', 'Furniture', 39.99, 120),
(11, 'PS5', 'Electronics', 400.99, 95);
INSERT INTO Orders (CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE)
VALUES
(1, 1, 1, '2025-05-20 10:30:00'),
(2, 2, 2, '2025-05-20 11:00:00'),
(3, 3, 1, '2025-05-20 11:30:00'),
(4, 4, 1, '2025-05-20 12:00:00'),
(5, 5, 3, '2025-05-20 12:30:00'),
(6, 6, 2, '2025-05-20 13:00:00'),
(7, 7, 1, '2025-05-20 13:30:00'),
(8, 8, 1, '2025-05-20 14:00:00'),
(9, 9, 2, '2025-05-20 14:30:00'),
(10, 10, 1, '2025-05-20 15:00:00'),
(1, 2, 1, '2025-05-21 10:30:00'),
(2, 3, 3, '2025-05-21 11:00:00'),
(3, 4, 1, '2025-05-21 11:30:00'),
(4, 5, 2, '2025-05-21 12:00:00'),
(5, 6, 1, '2025-05-21 12:30:00'),
(6, 7, 1, '2025-05-21 13:00:00'),
(7, 8, 3, '2025-05-21 13:30:00'),
(8, 9, 2, '2025-05-21 14:00:00'),
(9, 10, 1, '2025-05-21 14:30:00'),
(10, 1, 2, '2025-05-21 15:00:00');
--SELECT * FROM Customers;
--SELECT * FROM Products;
--SELECT * FROM Orders;
--Order Management:
-- Retrieve all orders placed by a specific customer
SELECT O.ORDER_ID, O.QUANTITY, O.ORDER_DATE, C.NAME AS CUSTOMER_NAME,
P.PRODUCT_NAME, P.PRICE AS PRODUCT_PRICE
FROM Orders O
JOIN Customers C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE O.CUSTOMER_ID = 1;

--Find products that are out of stock.
SELECT PRODUCT_NAME,STOCK from products
WHERE STOCK = 0;

--Calculate the total revenue generated per product.
SELECT PRODUCT_NAME, SUM (O.QUANTITY + P.PRICE) AS TOTAL_REVENUE
FROM Orders O
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY PRODUCT_NAME
ORDER BY TOTAL_REVENUE desc;

--Retrieve the top 5 customers by total purchase amount
SELECT NAME, SUM (O.QUANTITY + P.PRICE) AS TOTAL_PURCHASE
FROM Orders O
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID
JOIN Customers C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY NAME
ORDER BY TOTAL_PURCHASE desc;

--Find customers who placed orders in at least two different product categories.
SELECT C.NAME, O.CUSTOMER_ID, count(DISTINCT P.CATEGORY) AS
TOTAL_CATEGORY
FROM Orders O
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID
JOIN Customers C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.NAME, O.CUSTOMER_ID
HAVING count(DISTINCT P.CATEGORY) >= 2;

--Analytics:
--Find the month with the highest total sales
SELECT SUM(O.QUANTITY + P.PRICE) AS TOTAL_SALES,
TO_CHAR(O.ORDER_DATE,'YYYY:MM') AS month
FROM Orders O
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY month;

--Identify products with no orders in the last 6 months
SELECT P.PRODUCT_NAME, P.PRODUCT_ID
FROM Products P
LEFT JOIN Orders O ON O.PRODUCT_ID = P.PRODUCT_ID AND O.ORDER_DATE >=
CURRENT_DATE - INTERVAL '2 months'
WHERE O.ORDER_ID IS NULL;

--Retrieve customers who have never placed an order.
SELECT C.NAME, O.CUSTOMER_ID
FROM Customers C
LEFT JOIN Orders O ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.ORDER_ID IS NULL;

--Calculate the average order value across all orders.
SELECT AVG(O.QUANTITY * P.PRICE) AS AVERAGE_ORDER_VALUE
FROM Orders O
JOIN Products P ON O.PRODUCT_ID = P.PRODUCT_ID;