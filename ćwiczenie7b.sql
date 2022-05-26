



-- A


CREATE OR ALTER FUNCTION Fib(@n INT)
RETURNS @Fibonacci TABLE(Fibonacci INT)
AS
BEGIN
	DECLARE @TEMP_1 INT = 0, @TEMP_2 INT = 1, @indeks INT = 0
	INSERT INTO @Fibonacci VALUES (@TEMP_1), (@TEMP_2)
	WHILE (@indeks <= @n - 2)
	BEGIN
		INSERT INTO @Fibonacci VALUES (@TEMP_1 + @TEMP_2)
		SET @TEMP_2 += @TEMP_1
		SET @TEMP_1 = @TEMP_2 - @TEMP_1
		SET @indeks += 1
	END

	RETURN
END;



 CREATE OR ALTER PROCEDURE Fibonacci
 (
 @n INT
 )
 AS
 BEGIN
	SELECT * FROM AdventureWorks2019.dbo.Fib(@n)
 END;

EXEC AdventureWorks2019.dbo.Fibonacci 20;


DROP FUNCTION Fib;


-- B


CREATE TRIGGER Nazwisko_trigg
ON Person.Person 
AFTER INSERT, UPDATE
AS 
BEGIN
	UPDATE Person.Person
	SET LastName = UPPER(LastName)
	WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM inserted)
END


UPDATE Person.Person
SET FirstName = 'Pawel', LastName = 'dela' WHERE BusinessEntityID = 1;


SELECT * FROM Person.Person WHERE BusinessEntityID = 1;


--
UPDATE Person.Person
SET Person.LastName = LOWER(Person.LastName) WHERE BusinessEntityID = 1;
--


-- C



CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate 
FOR UPDATE
AS
BEGIN
	IF EXISTS (SELECT Inserted.TaxRate, deleted.TaxRate FROM deleted 
	INNER JOIN Inserted 
	ON deleted.TaxRate * 1.3 < Inserted.TaxRate OR deleted.TaxRate * 0.7 > Inserted.TaxRate) 
	BEGIN
	PRINT 'You can not rise or reduce this value more than 30%';
	END
END


SELECT * FROM  Sales.SalesTaxRate;


DROP TRIGGER Sales.taxRateMonitoring

UPDATE Sales.SalesTaxRate
SET TaxRate = 10
WHERE SalesTaxRateID = 1

