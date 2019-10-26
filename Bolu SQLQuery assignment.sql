---1. Customers that their first names begins with R
SELECT FirstName
FROM SalesLT.Customers
WHERE FirstName like 'R%';

---2. Give me all customers whose last name contains S
SELECT LastName
FROM SalesLT.Customers
WHERE LastName like '%S%';


---3. Give me all customers whose phone numbers begin with 710
SELECT Phone
FROM SalesLT.Customer
WHERE Phone like '710%';


---4. Give me all the products whose profit is greater than 100%
SELECT ListPrice, StandardCost, ListPrice - StandardCost AS Profit
FROM SalesLT.Product
WHERE ListPrice-StandardCost > 100;




