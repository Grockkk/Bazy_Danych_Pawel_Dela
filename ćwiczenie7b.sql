



-- A Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako 
----argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta�
----zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

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


-- B Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko 
----tak, aby by�o napisane du�ymi literami. 


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

DROP TRIGGER Person.Nazwisko_trigg



-- C Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi 
-----zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%



CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate 
AFTER UPDATE
AS
BEGIN
	IF EXISTS 
	(
	SELECT Inserted.TaxRate, deleted.TaxRate 
	FROM deleted 
	INNER JOIN Inserted 
	ON deleted.TaxRate * 1.3 < Inserted.TaxRate OR deleted.TaxRate * 0.7 > Inserted.TaxRate
	) 
	BEGIN
	PRINT 'You can not rise or reduce this value more than 30%';
	END
END


SELECT * FROM  Sales.SalesTaxRate WHERE SalesTaxRateID = 1;


UPDATE Sales.SalesTaxRate
SET TaxRate = 10 WHERE SalesTaxRateID = 1


DROP TRIGGER Sales.taxRateMonitoring


