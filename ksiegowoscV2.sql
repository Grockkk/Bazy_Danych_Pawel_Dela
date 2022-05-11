-- U¿ywanie firmy
USE firma;
GO
-- utworzenie bazy danych o nazwie firma

CREATE DATABASE firma;

-- tworzenie schematu ksiegowosc

CREATE SCHEMA ksiegowosc;


-- Dodawanie tabel o konkretnych parametrach


CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika VARCHAR(10) PRIMARY KEY NOT NULL,
	imie NVARCHAR(40) NOT NULL, 
	nazwisko NVARCHAR(40) NOT NULL, 
	adres NVARCHAR(100) NOT NULL, 
	telefon VARCHAR(15) NOT NULL);

CREATE TABLE ksiegowosc.godziny (
	id_godziny VARCHAR(10) PRIMARY KEY NOT NULL, 
	data DATE NOT NULL, 
	liczba_godzin INTEGER NOT NULL,
	id_pracownika VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika)NOT NULL);

CREATE TABLE ksiegowosc.pensje (
	id_pensji VARCHAR(10) PRIMARY KEY NOT NULL, 
	stanowisko NVARCHAR(80) NOT NULL, 
	kwota INTEGER NOT NULL);

CREATE TABLE ksiegowosc.premie (
	id_premii VARCHAR(10) PRIMARY KEY NOT NULL, 
	rodzaj VARCHAR(60) , 
	kwota INTEGER DEFAULT 0);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia VARCHAR(10) PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	id_pracownika VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika)NOT NULL,
	id_godziny VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.godziny(id_godziny) NOT NULL,
	id_pensji VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.pensje(id_pensji) NOT NULL,
	id_premii VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.premie(id_premii) NOT NULL);

-- Dodawanie rekordów do pracowników

INSERT INTO ksiegowosc.pracownicy VALUES('A01', 'Pawe³', 'Dela', 'Zabierzów ul. Poziomkowa 4', 123456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A02', 'Kuba', 'Kowalski', 'Kraków ul. Kapelanka 16', 123436789);

INSERT INTO ksiegowosc.pracownicy VALUES('A03', 'Anna', 'Chmiel', 'Wadowice ul. Lwowska 7', 123456053);

INSERT INTO ksiegowosc.pracownicy VALUES('A04', 'Artur', 'Kozakiewicz', 'Zielona Góra ul. Dzia³kowa 1', 856043796);

INSERT INTO ksiegowosc.pracownicy VALUES('A05', 'Julita', 'Zawadzka', 'Kraków ul. Karmelicka 34', 123176789);

INSERT INTO ksiegowosc.pracownicy VALUES('A06', 'Andrzej', 'Pros', 'Warszawa ul. W³adys³awa Broniewskiego 26', 890345832);

INSERT INTO ksiegowosc.pracownicy VALUES('A07', '£ukasz', 'Nanusza', 'Krzeszowice ul. Legionów Polskich 20', 123456798);

INSERT INTO ksiegowosc.pracownicy VALUES('A08', 'Emilia', 'Szel', 'Bolechowice ul. Jurajska 9', 123456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A09', 'Natalia', 'Nowak', 'Kraków ul. Lipska 2', 321456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A10', 'Eliza', 'Bielska', 'Kraków ul. Jagielloñska 12', 563208912);

-- Dodawanie rekordów do godzin

INSERT INTO ksiegowosc.godziny VALUES('G01', '2020-11-12' , 160, 'A01');

INSERT INTO ksiegowosc.godziny VALUES('G02', '2020-11-13' , 170, 'A02');

INSERT INTO ksiegowosc.godziny VALUES('G03', '2020-11-14' , 180, 'A03');

INSERT INTO ksiegowosc.godziny VALUES('G04', '2020-11-15' , 175, 'A04');

INSERT INTO ksiegowosc.godziny VALUES('G05', '2020-11-20' , 160, 'A05');

INSERT INTO ksiegowosc.godziny VALUES('G06', '2020-11-11' , 160, 'A06');

INSERT INTO ksiegowosc.godziny VALUES('G07', '2020-11-23' , 170, 'A07');

INSERT INTO ksiegowosc.godziny VALUES('G08', '2020-11-05' , 180, 'A08');

INSERT INTO ksiegowosc.godziny VALUES('G09', '2020-11-08' , 190, 'A09');

INSERT INTO ksiegowosc.godziny VALUES('G10', '2020-11-21' , 170, 'A10');

-- Dodanie rekordów do pensji

INSERT INTO ksiegowosc.pensje VALUES('PE01', 'Stazysta', 900);

INSERT INTO ksiegowosc.pensje VALUES('PE02', 'Analiyk Systemu Komputerowego',7200);

INSERT INTO ksiegowosc.pensje VALUES('PE03', 'Analityk Finansowy',5600);

INSERT INTO ksiegowosc.pensje VALUES('PE04', 'Administrator Sieci LAN',1900);

INSERT INTO ksiegowosc.pensje VALUES('PE05', 'Adnimistrator Systemu',7900);

INSERT INTO ksiegowosc.pensje VALUES('PE06', 'Stazysta',900);

INSERT INTO ksiegowosc.pensje VALUES('PE07', 'Analityk Finansowy',6100);

INSERT INTO ksiegowosc.pensje VALUES('PE08', 'Kierownik Dzia³u Marketingu',2600);

INSERT INTO ksiegowosc.pensje VALUES('PE09', 'Kierownik Dzia³u Rozwoju i Innowacji',4800);

INSERT INTO ksiegowosc.pensje VALUES('PE10', 'Kierownik Zespo³u Badawczego',10900);

-- Dodawanie rekordów do premii

INSERT INTO ksiegowosc.premie VALUES('PR01' , NULL, NULL);

INSERT INTO ksiegowosc.premie VALUES('PR02', 'Premia uznaniowa', '1000');

INSERT INTO ksiegowosc.premie VALUES('PR03', 'Premia uznaniowa', '1050');

INSERT INTO ksiegowosc.premie VALUES('PR04', NULL, NULL);

INSERT INTO ksiegowosc.premie VALUES('PR05','Premia uznaniowa', '1000');

INSERT INTO ksiegowosc.premie VALUES('PR06',NULL, NULL);

INSERT INTO ksiegowosc.premie VALUES('PR07','Premia uznaniowa', '1000');

INSERT INTO ksiegowosc.premie VALUES('PR08', NULL, NULL);

INSERT INTO ksiegowosc.premie VALUES('PR09', 'Premia uznaniowa', '1100');

INSERT INTO ksiegowosc.premie VALUES('PR10', 'Premia uznaniowa', '1200');

-- Dodawanie rekordów do wynagordzeñ

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W01','04-12-2020','A01','G01','PE01','PR01');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W02','05-12-2020','A02','G02','PE02','PR02');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W03','09-12-2020','A03','G03','PE03','PR03');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W04','07-12-2020','A04','G04','PE04','PR04');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W05','01-12-2020','A05','G05','PE05','PR05');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W06','10-12-2020','A06','G06','PE06','PR06');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W07','08-12-2020','A07','G07','PE07','PR07');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W08','05-12-2020','A08','G08','PE08','PR08');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W09','03-12-2020','A09','G09','PE09','PR09');

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W10','07-12-2020','A10','G10','PE10','PR10');


--a)

ALTER TABLE ksiegowosc.pracownicy
ADD telefon_Polska VARCHAR(15);

UPDATE Ksiegowosc.Pracownicy
	SET telefon_Polska = (
	SELECT CONCAT('+48',SUBSTRING(telefon, 1, 9)) AS  telefon_Polska)
	WHERE ksiegowosc.pracownicy.telefon IS NOT NULL;



--b)

UPDATE Ksiegowosc.Pracownicy
	SET ksiegowosc.pracownicy.telefon = (
	SELECT CONCAT(SUBSTRING(telefon, 1, 3), '-' , SUBSTRING(telefon, 4, 3), '-' , SUBSTRING(telefon, 7, 3)) AS  telefon)
	WHERE ksiegowosc.pracownicy.telefon IS NOT NULL;
	


--c)

SELECT id_pracownika , UPPER(imie) AS imie, UPPER(nazwisko) AS nazwisko, UPPER(adres) AS adres, telefon
FROM ksiegowosc.pracownicy
WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko))FROM ksiegowosc.pracownicy)




--d)

Select
CONVERT(VARCHAR(32), HashBytes('MD5',pracownicy.id_pracownika), 2) as id_pracownika,
CONVERT(VARCHAR(32), HashBytes('MD5',pracownicy.imie), 2) AS imie,
CONVERT(VARCHAR(32), HashBytes('MD5',pracownicy.nazwisko), 2) AS nazwisko,
CONVERT(VARCHAR(32), HashBytes('MD5',pracownicy.adres), 2) AS adres,
CONVERT(VARCHAR(32), HashBytes('MD5',pracownicy.telefon), 2) AS telefon,
CONVERT(VARCHAR(32), HashBytes('MD5',CAST(pensje.kwota AS VARCHAR(10))), 2) AS pensja
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje ON pensje.id_pensji = wynagrodzenie.id_pensji


--e)

SELECT pracownicy.id_pracownika , pracownicy.imie, pracownicy.nazwisko, ksiegowosc.pensje.kwota AS kwota_pensji, ksiegowosc.premie.kwota AS kwota_premii
FROM ksiegowosc.pracownicy
LEFT OUTER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT OUTER JOIN ksiegowosc.premie ON premie.id_premii = wynagrodzenie.id_premii
LEFT OUTER JOIN ksiegowosc.pensje ON pensje.id_pensji = wynagrodzenie.id_pensji



--f)




SELECT 'Pracownik ' 
+ [imie] 
+ ' ' 
+ [nazwisko]  
+ ', w dniu ' 
+ CONVERT(VARCHAR(10),[godziny].[data]) 
+ ' otrzyma³ pensjê ca³kowit¹ na kwotê '  
+ CONVERT(VARCHAR(10),[premie].[kwota]) -- tu ma byæ suma
+ ' , gdzie wynagrodzenie zasadnicze wynosi³o: ' 
+ CONVERT(VARCHAR(10),[pensje].[kwota] )
+ ', premia: '
+ CONVERT(VARCHAR(10),[premie].[kwota] )
+', nadgodziny: ' 
+ CONVERT(VARCHAR(10),[godziny].[liczba_godzin])
+ 'z³.' AS raport
FROM [ksiegowosc].[pracownicy] 
INNER JOIN [ksiegowosc].[wynagrodzenie] ON [pracownicy].[id_pracownika] = [wynagrodzenie].[id_pracownika]
INNER JOIN [ksiegowosc].[pensje] ON [wynagrodzenie].[id_pensji] = [pensje].[id_pensji]
INNER JOIN [ksiegowosc].[premie] ON [wynagrodzenie].[id_premii] = [premie].[id_premii]
INNER JOIN [ksiegowosc].[godziny] ON [wynagrodzenie].[id_godziny] = [godziny].[id_godziny];


SELECT * FROM ksiegowosc.premie;



DROP TABLE ksiegowosc.pracownicy
DROP TABLE ksiegowosc.godziny
DROP TABLE ksiegowosc.pensje
DROP TABLE ksiegowosc.premie
DROP TABLE ksiegowosc.wynagrodzenie