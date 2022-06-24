/*Vending Database Queries 
See Database Model and Scripts in Vending Database Folder*/

-- Query 1 
SELECT OrderID, OrderDate, CustomerID, EmployeeID
FROM Vending.Orders
WHERE orderdate >= '2015-06-01' AND orderdate <=  '2015-06-30';

-- Query 2
SELECT OrderID, ROUND(SUM(Quantity * UnitPrice),0) AS TotalValue
FROM Vending.OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity * UnitPrice) > 10000
ORDER BY SUM(Quantity * UnitPrice) DESC;

-- Query 3 
SELECT ShipCountry, ROUND(AVG(Freight),2) AS AvgFreight
FROM Vending.Orders
WHERE OrderDate  >= '2015-01-01' AND OrderDate <=  '2015-12-31'
GROUP BY ShipCountry
ORDER BY AVG(Freight) DESC
LIMIT 3;

-- Query 4
SELECT cus.CustomerID, CompanyName, 
CASE WHEN cus.CustomerID IN (
SELECT CustomerID
FROM Vending.Orders
WHERE OrderDate = '2016-04-06')
	THEN 'Yes'
	ELSE 'No'
END AS  HasOrderOn20160406 
FROM Vending.Customers cus
JOIN Vending.Orders ord 
ON cus.CustomerID = ord.CustomerID
GROUP BY CustomerID;

-- Query 5
CREATE TABLE Vending.Order14To16 AS 
SELECT * FROM Vending.Orders
WHERE OrderDate BETWEEN '2014-01-01' AND '2016-12-31';

ALTER TABLE Vending.Order14To16
ADD FiscalYear int;

UPDATE Vending.Order14To16
SET FiscalYear =  
CASE WHEN MONTH(OrderDate) IN (10,11,12) THEN (YEAR(DATE_ADD(OrderDate, INTERVAL 1 YEAR)))
ELSE YEAR(OrderDate)
END;

