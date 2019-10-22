--All customers that their first names begin with R
SELECT FirstName, MiddleName, LastName FROM SalesLT.Customer WHERE FirstName LIKE 'R%';

--All customers whose last name has S
SELECT FirstName, MiddleName, LastName FROM SalesLT.Customer WHERE LastName LIKE '%s%';

--All customers whose phone numbers begin with 710
SELECT FirstName, MiddleName, LastName, Phone FROM SalesLT.Customer WHERE Phone LIKE '710%';

--All the products whose profit is greater than 100
--ListPrice - StandardCost
SELECT ListPrice, StandardCost, ListPrice-StandardCost AS Profit FROM SalesLT.Product  WHERE ListPrice-StandardCost > 100;
