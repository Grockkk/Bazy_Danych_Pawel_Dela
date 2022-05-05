-- U�ywanie firmy
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
	telefon INTEGER NOT NULL);

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
	kwota INTEGER);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia VARCHAR(10) PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	id_pracownika VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika)NOT NULL,
	id_godziny VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.godziny(id_godziny) NOT NULL,
	id_pensji VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.pensje(id_pensji) NOT NULL,
	id_premii VARCHAR(10) FOREIGN KEY REFERENCES ksiegowosc.premie(id_premii) NOT NULL);

-- Dodawanie rekord�w do pracownik�w

INSERT INTO ksiegowosc.pracownicy VALUES('A01', 'Pawe�', 'Dela', 'Zabierz�w ul. Poziomkowa 4', 123456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A02', 'Kuba', 'Kowalski', 'Krak�w ul. Kapelanka 16', 123436789);

INSERT INTO ksiegowosc.pracownicy VALUES('A03', 'Anna', 'Chmiel', 'Wadowice ul. Lwowska 7', 123456053);

INSERT INTO ksiegowosc.pracownicy VALUES('A04', 'Artur', 'Kozakiewicz', 'Zielona G�ra ul. Dzia�kowa 1', 856043796);

INSERT INTO ksiegowosc.pracownicy VALUES('A05', 'Julita', 'Zawadzka', 'Krak�w ul. Karmelicka 34', 123176789);

INSERT INTO ksiegowosc.pracownicy VALUES('A06', 'Andrzej', 'Pros', 'Warszawa ul. W�adys�awa Broniewskiego 26', 890345832);

INSERT INTO ksiegowosc.pracownicy VALUES('A07', '�ukasz', 'Nanusza', 'Krzeszowice ul. Legion�w Polskich 20', 123456798);

INSERT INTO ksiegowosc.pracownicy VALUES('A08', 'Emilia', 'Szel', 'Bolechowice ul. Jurajska 9', 123456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A09', 'Natalia', 'Nowak', 'Krak�w ul. Lipska 2', 321456789);

INSERT INTO ksiegowosc.pracownicy VALUES('A10', 'Eliza', 'Bielska', 'Krak�w ul. Jagiello�ska 12', 563208912);

-- Dodawanie rekord�w do godzin

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

-- Dodanie rekord�w do pensji

INSERT INTO ksiegowosc.pensje VALUES('PE01', 'Stazysta', 900);

INSERT INTO ksiegowosc.pensje VALUES('PE02', 'Analiyk Systemu Komputerowego',7200);

INSERT INTO ksiegowosc.pensje VALUES('PE03', 'Analityk Finansowy',5600);

INSERT INTO ksiegowosc.pensje VALUES('PE04', 'Administrator Sieci LAN',1900);

INSERT INTO ksiegowosc.pensje VALUES('PE05', 'Adnimistrator Systemu',7900);

INSERT INTO ksiegowosc.pensje VALUES('PE06', 'Stazysta',900);

INSERT INTO ksiegowosc.pensje VALUES('PE07', 'Analityk Finansowy',6100);

INSERT INTO ksiegowosc.pensje VALUES('PE08', 'Kierownik Dzia�u Marketingu',2600);

INSERT INTO ksiegowosc.pensje VALUES('PE09', 'Kierownik Dzia�u Rozwoju i Innowacji',4800);

INSERT INTO ksiegowosc.pensje VALUES('PE10', 'Kierownik Zespo�u Badawczego',10900);

-- Dodawanie rekord�w do premii

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

-- Dodawanie rekord�w do wynagordze�

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


COMMENT ON TABLE ksiegowosc.pracownicy IS 'Wszyscy pracownicy firmy';


COMMENT ON TABLE ksiegowosc.godziny IS 'Godziny pracy pracownik�w';


COMMENT ON TABLE ksiegowosc.pensje IS 'Pensje pracownik�w';


COMMENT ON TABLE ksiegowosc.premie IS 'Premia wyliczona dla ka�dego pracownika';


COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Lista wynagrodze� i po��czenie tabel';



-- a) Wy�wietl tylko id pracownika oraz jego nazwisko

SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy;

-- b) Wy�wietl id pracownik�w, kt�rych p�aca jest wi�ksza ni� 1000

SELECT ksiegowosc.pracownicy.id_pracownika
	FROM ((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji) 
	WHERE ksiegowosc.pensje.kwota > 1000;

-- c) Wy�wietl id pracownik�w nieposiadaj�cych premii,kt�rych p�aca jest wi�ksza ni� 2000

SELECT ksiegowosc.pracownicy.id_pracownika 
	FROM (((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji) 
	INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii)
	WHERE ksiegowosc.premie.kwota IS NULL AND ksiegowosc.pensje.kwota > 2000;

-- d) Wy�wietl pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�. 

SELECT id_pracownika,imie, nazwisko FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

-- e) Wy�wietl pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�

SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%a';

-- f) Wy�wietl imi� i nazwisko pracownik�w oraz liczb� ich nadgodzin, przyjmuj�c, i� standardowy czas pracy to 160 h miesi�cznie

SELECT ksiegowosc.pracownicy.imie,ksiegowosc.pracownicy.nazwisko , ksiegowosc.godziny.liczba_godzin - 160 AS 'Nadgodziny'
	FROM ((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny) 

-- g) Wy�wietl imi� i nazwisko pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 �3000PLN

SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
	FROM ((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji) 
	WHERE ksiegowosc.pensje.kwota > 1500 AND ksiegowosc.pensje.kwota < 3000;

-- h) Wy�wietl imi� i nazwisko pracownik�w, kt�rzy pracowali w nadgodzinachi nie otrzymali premii.

SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
	FROM (((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii) 
	INNER JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny) 
	WHERE ksiegowosc.godziny.liczba_godzin > 160 AND ksiegowosc.premie.kwota IS NULL;

-- i) Uszereguj pracownik�w wed�ug pensji. 

SELECT ksiegowosc.pracownicy.id_pracownika , ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
	FROM ((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji)
	ORDER BY ksiegowosc.pensje.kwota ;

-- j) Uszereguj pracownik�w wed�ug pensji i premii malej�co.

SELECT ksiegowosc.pracownicy.id_pracownika , ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
	FROM (((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji)
	INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii)
	ORDER BY ksiegowosc.pensje.kwota, ksiegowosc.premie.kwota DESC;

-- k) Zlicz i pogrupuj pracownik�w wed�ug pola �stanowisko�.

SELECT COUNT(stanowisko) AS 'Ilosc pracownikow', stanowisko
	FROM ksiegowosc.pensje
	GROUP BY stanowisko;

-- l) Policz �redni�, minimaln� i maksymaln� p�ac� dla stanowiska �Analityk finansowy� 
SELECT MIN(ksiegowosc.pensje.kwota) AS 'Najmnnijeszy zarobek na stanowisku Analityk finansowy', MAX(ksiegowosc.pensje.kwota) AS 'Najwiekszy zarobek',AVG(ksiegowosc.pensje.kwota) AS '�rednia p�aca' 
	FROM ksiegowosc.pensje 
	WHERE ksiegowosc.pensje.stanowisko = 'Analityk finansowy';

-- m) Policz sum� wszystkich wynagrodze�.

SELECT SUM(ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) AS 'Suma wszystkich wynagrodzen'
	FROM ksiegowosc.wynagrodzenie
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;

-- n) Policz sum� wynagrodze� w ramach danego stanowiska.
SELECT SUM(kwota) AS 'Suma wynagrodzen na stanowisku', stanowisko 
	FROM ksiegowosc.pensje
	GROUP BY stanowisko;

-- g) Wyznacz liczb� premii przyznanych dla pracownik�w danego stanowiska.

SELECT COUNT(ksiegowosc.premie.kwota) AS 'ilo�� premi na stanowisku',stanowisko
	FROM ((ksiegowosc.pensje 
	INNER JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji=wynagrodzenie.id_pensji)
	INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii=premie.id_premii)
	GROUP BY stanowisko


-- h) Usu� wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�.



--

ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT id_pracownika;
ALTER TABLE ksiegowosc.wynagrodzenie DROP CONSTRAINT id_pracownika;
DELETE ksiegowosc.pracownicy  FROM ksiegowosc.pracownicy AS pracownicy
INNER JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje AS pensje ON pensje.id_pensji = wynagrodzenie.id_pensji
WHERE kwota < '1200';

-- access
DELETE pracownicy.id_pracownika, pensje.kwota
FROM pracownicy INNER JOIN (pensje INNER JOIN wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji) ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
WHERE (((pensje.kwota)<'1200'));

-- 

ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
ALTER TABLE ksiegowosc.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_pracownika_fkey;
DELETE FROM ksiegowosc.pracownicy
USING (ksiegowosc.pensja,ksiegowosc.wynagrodzenie)
WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika 
AND pensja.id_pensji=wynagrodzenie.id_pensji
AND pensja.kwota < '1200';







DROP TABLE ksiegowosc.pracownicy;
DROP TABLE ksiegowosc.godziny;
DROP TABLE ksiegowosc.premie;
DROP TABLE ksiegowosc.pensje ;
DROP TABLE ksiegowosc.wynagrodzenie;

SELECT * FROM ksiegowosc.pracownicy