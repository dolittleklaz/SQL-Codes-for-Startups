--Schema
CREATE DATABASE Project1DB;
USE Project1DB;


CREATE TABLE Customer (
    CustomerID INT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(255),
    CustomerAddress VARCHAR(255) NOT NULL
    PRIMARY KEY (CustomerID)
);

CREATE TABLE CustomerOrder (
    CustomerID INT NOT NULL,
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    OrderDescription VARCHAR(255),
    PRIMARY KEY (CustomerID, OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product (
    ProductID INT NOT NULL,
    ProductName VARCHAR(255),
    ProductDescription VARCHAR(255)
    PRIMARY KEY (ProductID)
);

CREATE TABLE Item (
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderID INT NOT NULL,
    OrderAmount INT NOT NULL,
    TransactionDate DATE,
    ShipDate DATE,
    PRIMARY KEY (ProductID, CustomerID, OrderID),
   FOREIGN KEY (CustomerID, OrderID) REFERENCES CustomerOrder(CustomerID, OrderID)
);

--Seeds--
--Seeds for Customer Table--
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, CustomerAddress)
VALUES (001, 'Jon', 'Snow', 'jsnow@gmail.com', '215-685-7933', 'Winterfell');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, CustomerAddress)
VALUES (002, 'Cersei', 'Lannister', 'clannister@gmail.com', '215-685-7766', 'Kings Landing');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, CustomerAddress)
VALUES (003, 'Bryon', 'Stark', 'bstark@gmail.com', '215-685-7789', 'Winterfell');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, CustomerAddress)
VALUES (004, 'Arya', 'Stark', 'astark@gmail.com', '215-985-7789', 'Winterfell');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, CustomerAddress)
VALUES (005, 'John', 'Tully', 'jtully@gmail.com', '215-685-7987', 'The Midlands');

--Seeds for CustomerOrder Table--
INSERT INTO CustomerOrder (CustomerID, OrderID, OrderDate, Quantity, OrderDescription)
VALUES (001, 1, '2019-11-2', 5, 'Saddle');

INSERT INTO CustomerOrder (CustomerID, OrderID, OrderDate, Quantity, OrderDescription)
VALUES (004, 2, '2019-11-3', 1, 'Sword');

INSERT INTO CustomerOrder (CustomerID, OrderID, OrderDate, Quantity, OrderDescription)
VALUES (003, 3, '2019-11-1', 1, 'Horse');

INSERT INTO CustomerOrder (CustomerID, OrderID, OrderDate, Quantity, OrderDescription)
VALUES (002, 4, '2019-10-31', 1, 'Armor');

INSERT INTO CustomerOrder (CustomerID, OrderID, OrderDate, Quantity, OrderDescription)
VALUES (005, 5, '2019-10-28', 1, 'Horse');

--Seeds for Product Table--
INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (01, 'Sword', 'Valyrian Steel Sword');

INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (02, 'Cloak', 'Winter Fur cloak');

INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (03, 'Armor', 'Full Body Armour');

INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (04, 'Saddle', 'Riding Saddle');

INSERT INTO Product (ProductID, ProductName, ProductDescription)
VALUES (05, 'Horse', 'Gelding');

--Seeds for Item Table--
INSERT INTO Item (ProductID, CustomerID, OrderID, OrderAmount, TransactionDate, ShipDate)
VALUES (02, 005, 5, 25, '2019-10-28', '2019-10-30');

INSERT INTO Item (ProductID, CustomerID, OrderID, OrderAmount, TransactionDate, ShipDate)
VALUES (03, 002, 4, 30, '2019-10-31', '2019-11-2');

INSERT INTO Item (ProductID, CustomerID, OrderID, OrderAmount, TransactionDate, ShipDate)
VALUES (05, 003, 3, 5000, '2019-11-1', '2019-11-3');

INSERT INTO Item (ProductID, CustomerID, OrderID, OrderAmount, TransactionDate, ShipDate)
VALUES (04, 001, 1, 200, '2019-11-2', '2019-11-4');

INSERT INTO Item (ProductID, CustomerID, OrderID, OrderAmount, TransactionDate, ShipDate)
VALUES (01, 004, 2, 50, '2019-11-3', '2019-11-5');

--Queries--
--Two Queries demonstrating Scalar Functions--
SELECT *
FROM Customer
ORDER BY LastName;

SELECT *
FROM CustomerOrder
ORDER BY OrderDate;

--Two Queries demonstrating Aggregate Functions--
SELECT COUNT(*) AS ProductID, COUNT(DISTINCT ProductName) AS Categories
FROM Product;

SELECT COUNT(ProductID)
FROM Product
WHERE ProductName LIKE 'A%';

--Two Queries demonstrating Logical Functions--
SELECT *
FROM Customer
WHERE ISNUMERIC(CustomerID) > 0;

SELECT *
FROM CustomerOrder
WHERE OrderID > 0;


--Two Queries with Group By Clause--
SELECT c.FirstName AS Name, COUNT(p.OrderID) AS MadeOrders 
FROM Customer AS c
JOIN CustomerOrder AS p
ON c.CustomerID = p.CustomerID
GROUP BY c.FirstName
ORDER BY Name;

SELECT C.LastName AS Name, Count(p.OrderID) as ItemsOrdered
FROM Customer AS c
JOIN Item AS p
ON c.CustomerID = p.CustomerID
GROUP BY c.LastName
ORDER BY Name;


--Queries with Having clause--
SELECT COUNT(CustomerID), LastName, FirstName
FROM Customer
GROUP BY LastName, FirstName
HAVING COUNT (CustomerID) > 0;

SELECT FirstName, LastName
FROM Customer AS c
JOIN CustomerOrder AS p
ON c.CustomerID = p.CustomerID
GROUP BY LastName, FirstName
HAVING COUNT(c.CustomerID) > 0;

--Test Queries--
SELECT *
FROM Customer;

SELECT *
FROM CustomerOrder;

SELECT *
FROM Product;

SELECT *
FROM Item;


