-- Create the database named "TechShop"
CREATE DATABASE TechShop;

USE TechShop;

-- 2. Data Definition Language (DDL):

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) NOT NULL,
	Phone VARCHAR(10),
	Address VARCHAR(255)
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
	Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
	CustomerID INT NOT NULL,
    OrderDate DATE,
	TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Inventory table
CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
	LastStockUpdate INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- 3. Data Manipulation Language (DML):
-- a. Insert at least 10 sample records into each of the following tables.
-- Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Delhi India'),
    (2, 'Joey', 'Tribiani', 'joey.tribiani@example.com', '9876543210', '456 Newyork London'),
    (3, 'Chandler', 'Bing', 'chandler.bing@example.com', '5551234567', '789 Paris France'),
    (4, 'Ross', 'Geller', 'ross.geller@example.com', '2223334444', '101 Mumbai India'),
    (5, 'Rachel', 'Green', 'rachel.green@example.com', '7778889999', '202 Banaras India'),
    (6, 'Monica', 'Geller', 'monica.geller@example.com', '4445556666', '303 Bhopal India'),
    (7, 'Pheobe', 'Buffay', 'pheobe.buffay@example.com', '6667778888', '404 Indore India'),
    (8, 'Taylor', 'Swift', 'taylor.swift@example.com', '8889990000', '505 Agra India'),
    (9, 'Jane', 'Doe', 'jane.doe@example.com', '1112223333', '606 Goa India'),
    (10, 'Vaibhav', 'Sharma', 'vaibhav.sharma@example.com', '9990001111', '707 Sagar India');

-- Products
INSERT INTO Products (ProductId, ProductName, Description, Price)
VALUES
    (1, 'Laptop', 'Dell XPS 13', 69999.59),
    (2, 'Smartphone', 'iPhone 13', 89999.69),
    (3, 'Headphones', 'Sony WH-1000XM4', 12999.59),
    (4, 'Smartwatch', 'Samsung Galaxy Watch', 30000.00),
    (5, 'Camera', 'Canon EOS 5D Mark IV', 59999.89),
    (6, 'TV', 'LG OLED C1', 79999.99),
    (7, 'Tablet', 'iPad Air', 30999.49),
    (8, 'Gaming Console', 'PlayStation 5', 59999.00),
    (9, 'Router', 'TP-Link Archer C7', 12999.89),
    (10, 'Bluetooth Speaker', 'JBL Flip 5', 19999.99);

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 139999.18),
    (2, 2, '2023-01-02', 269999.07),
    (3, 3, '2023-01-03', 12999.59),
    (4, 4, '2023-01-04', 61998.98),
    (5, 5, '2023-01-05', 59999.89),
    (6, 6, '2023-01-06', 25999.78),
    (7, 7, '2023-01-07', 59999.00),
    (8, 8, '2023-01-08', 79999.99),
    (9, 9, '2023-01-09', 59999.97),
    (10, 10, '2023-01-10', 60000.00);

-- OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 3, 3, 1),
    (3, 2, 2, 3),
    (4, 5, 5, 1),
    (5, 10, 4, 2),
    (6, 7, 8, 1),
    (7, 4, 7, 2),
    (8, 8, 6, 1),
    (9, 9, 10, 3),
    (10, 6, 9, 2);


-- Inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 50, 55),
    (2, 2, 100, 95),
    (3, 3, 30, 50),
    (4, 4, 75, 80),
    (5, 5, 20, 10),
    (6, 6, 10, 25),
    (7, 7, 40, 35),
    (8, 8, 5, 15),
    (9, 9, 60, 90),
    (10, 10, 25, 30);


-- b. Write SQL queries for the following tasks: 
-- 1. Write an SQL query to retrieve the names and emails of all customers.
SELECT CONCAT(FirstName,' ',LastName),Email FROM Customers;

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT Orders.OrderDate, CONCAT(Customers.FirstName,' ',Customers.LastName) AS CustomerName FROM Orders 
INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'John', 'Wick', 'john.wick@example.com', '1234567890', '123 Goa India');

-- 4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products
SET price = price * 1.10;

-- 5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @OrderIDToDelete INT=2;
DELETE FROM OrderDetails
WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders
WHERE OrderID = @OrderIDToDelete;

-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 10, '2023-01-12', 139999.18);

-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
DECLARE @CustomerIdToUpdate INT=1;
DECLARE @CustomerEmail VARCHAR(100)='newid@example.com';
DECLARE @CustomerPhone VARCHAR(10)='8999979999';
UPDATE Customers SET Email=@CustomerEmail WHERE CustomerID=@CustomerIdToUpdate;
UPDATE Customers SET Phone=@CustomerPhone WHERE CustomerID=@CustomerIdToUpdate;

-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
SELECT * FROM Orders;
UPDATE Orders
SET TotalAmount=(
	SELECT OrderDetails.Quantity*Products.Price 
	FROM OrderDetails
	JOIN Products ON OrderDetails.ProductID=Products.ProductID
	WHERE Orders.OrderID=OrderDetails.OrderID
);
SELECT * FROM Orders;

-- 9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @CustomerIdToDelete INT=3;
DELETE FROM OrderDetails WHERE OrderID = (SELECT OrderID FROM Orders WHERE CustomerID=@CustomerIdToDelete);
DELETE FROM Orders WHERE CustomerID=@CustomerIdToDelete;

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
INSERT INTO Products (ProductId, ProductName, Description, Price)
VALUES
    (13, 'Laptop', 'HP XPS 13', 79999.59);

-- 11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE Orders
ADD OrderStatus VARCHAR(30) DEFAULT 'Not Shipped';
DECLARE @OrderIdToUpdate INT =5;
UPDATE Orders SET OrderStatus='Shipped' WHERE OrderID=@OrderIdToUpdate;

-- 12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
ALTER TABLE Customers
ADD OrdersCount INT;

UPDATE Customers
SET OrdersCount = (
    SELECT COUNT(OrderID)
    FROM Orders
    WHERE Customers.CustomerID = Orders.CustomerID
);

-- 4. Joins:
-- 1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
SELECT
    Orders.OrderID,
    Orders.OrderDate,
	Orders.TotalAmount,
    CONCAT(FirstName,' ',LastName) AS CustomerName,
    Customers.Email,
    Customers.Phone,
	Customers.Address
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID;

-- 2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
SELECT
    Products.ProductName,
    SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM
    Products
JOIN
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY
    Products.ProductID, Products.ProductName;


-- 3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
SELECT
    Customers.CustomerID,
    CONCAT(Customers.FirstName,' ',Customers.LastName),
    Customers.Email,
    Customers.Phone
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID;

-- 4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
SELECT
    Products.ProductName,
    SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Products.ProductName
ORDER BY
    TotalQuantityOrdered DESC
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;


-- 5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
ALTER TABLE Products
ADD CategoryName VARCHAR(30);
SELECT
    ProductName,
    CategoryName
FROM
    Products;


-- 6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
SELECT
    Customers.CustomerID,
    CONCAT(Customers.FirstName,' ',Customers.LastName) as CustomerName,
    AVG(OrderDetails.Quantity * Products.Price) AS AverageOrderValue
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Customers.CustomerID, Customers.FirstName,Customers.LastName;


-- 7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT
    Orders.OrderID,
    Customers.FirstName,
    Customers.LastName,
    SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Orders.OrderID, Customers.FirstName, Customers.LastName
ORDER BY
    TotalRevenue DESC
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;

-- 8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT
    Products.ProductName,
    COUNT(OrderDetails.OrderID) AS NumberOfOrders
FROM
    Products
LEFT JOIN
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY
    Products.ProductName;


-- 9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
DECLARE @ProductNameParam NVARCHAR(100)='TV';

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email,
    Customers.Phone
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Products.ProductName = @ProductNameParam;


-- 10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
DECLARE @StartDateParam DATE='2023-01-01';
DECLARE @EndDateParam DATE='2023-12-30';

SELECT
    SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM
    Orders
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Orders.OrderDate BETWEEN @StartDateParam AND @EndDateParam;

-- 5. Aggregate Functions and Subqueries:
-- 1. Write an SQL query to find out which customers have not placed any orders.
SELECT CustomerID, CONCAT(FirstName,' ',LastName)
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

-- 2. Write an SQL query to find the total number of products available for sale.
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- 3. Write an SQL query to calculate the total revenue generated by TechShop.
SELECT SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID;

-- 4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.

DECLARE @CategoryInput VARCHAR(30)='Headphones'
SELECT AVG(OrderDetails.Quantity) AS AvgQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.CategoryName = @CategoryInput;

-- 5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
DECLARE @CustomerIdInput INT='6'
SELECT SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Orders.CustomerID = @CustomerIdInput;

-- 6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
SELECT Customers.FirstName,Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName,Customers.LastName
ORDER BY OrderCount DESC
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;

-- 7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
SELECT Products.CategoryName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.CategoryName
ORDER BY TotalQuantityOrdered DESC
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;

-- 8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
SELECT Customers.FirstName,Customers.LastName, SUM(OrderDetails.Quantity * Products.Price) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName,Customers.LastName
ORDER BY TotalSpending DESC
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;

-- 9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.


-- 10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
SELECT Customers.FirstName,Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName,Customers.LastName;
