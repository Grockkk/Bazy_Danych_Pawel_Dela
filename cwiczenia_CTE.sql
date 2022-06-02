
-----1)
WITH TempEmployeeInfo AS (
SELECT Person.Person.BusinessEntityID,FirstName, MiddleName, LastName, JobTitle, Rate
FROM Person.Person
INNER JOIN HumanResources.EmployeePayHistory ON EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Employee ON Employee.BusinessEntityID = Person.BusinessEntityID
)
SELECT BusinessEntityID AS ID,FirstName,MiddleName ,LastName ,JobTitle ,ROUND(Rate,2) AS Rate 
FROM TempEmployeeInfo
ORDER BY ID



-----2)
WITH CompanyInfo AS 
(
SELECT [CompanyName] + '(' + [FirstName] + ' ' + [LastName] + ')' AS CompanyContact, SalesOrderHeader.TotalDue AS   Revenue
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
)
SELECT * FROM CompanyInfo ORDER BY CompanyContact ASC


-----3)

WITH SalesInfo AS 
(
SELECT ProductCategory.Name AS Category, LineTotal AS SalesValue
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory ON Product.ProductCategoryID = ProductCategory.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail ON Product.ProductID = SalesOrderDetail.ProductID
)
SELECT Category, ROUND(SUM(SalesValue),2) AS SalesValue FROM SalesInfo
GROUP BY Category







