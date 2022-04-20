
-- U¿ywanie firmy
USE firma;
GO
-- utworzenie bazy danych o nazwie firma

CREATE DATABASE firma;

-- tworzenie schematu rozliczenia

CREATE SCHEMA rozliczenia;


-- Dodawanie tabel o konkretnych parametrach


CREATE TABLE rozliczenia.pracownicy (id_pracownika VARCHAR(10) PRIMARY KEY NOT NULL,imie NVARCHAR(40) NOT NULL, nazwisko NVARCHAR(40) NOT NULL, adres NVARCHAR(100) NOT NULL, telefon INTEGER NOT NULL);

CREATE TABLE rozliczenia.godziny (id_godziny VARCHAR(10) PRIMARY KEY NOT NULL, data DATE NOT NULL, liczba_godzin INTEGER NOT NULL);

CREATE TABLE rozliczenia.premie (id_premii VARCHAR(10) PRIMARY KEY NOT NULL, rodzaj VARCHAR(60) , kwota INTEGER);

CREATE TABLE rozliczenia.pensje (id_pensji VARCHAR(10) PRIMARY KEY NOT NULL, stanowisko NVARCHAR(80) NOT NULL);

-- Dodawanie kluczy FOREIGN

ALTER TABLE rozliczenia.godziny ADD id_pracownika VARCHAR(10) FOREIGN KEY REFERENCES rozliczenia.pracownicy(id_pracownika) NOT NULL;
ALTER TABLE rozliczenia.pensje ADD id_premii VARCHAR(10) FOREIGN KEY REFERENCES rozliczenia.premie(id_premii) NOT NULL;

-- Dodawanie rekordów do pracowników

INSERT INTO rozliczenia.pracownicy VALUES('A01', 'Pawe³', 'Dela', 'Zabierzów ul. Poziomkowa 4', 123456789);

INSERT INTO rozliczenia.pracownicy VALUES('A02', 'Kuba', 'Kowalski', 'Kraków ul. Kapelanka 16', 123436789);

INSERT INTO rozliczenia.pracownicy VALUES('A03', 'Anna', 'Chmiel', 'Wadowice ul. Lwowska 7', 123456053);

INSERT INTO rozliczenia.pracownicy VALUES('A04', 'Artur', 'Kozakiewicz', 'Zielona Góra ul. Dzia³kowa 1', 856043796);

INSERT INTO rozliczenia.pracownicy VALUES('A05', 'Julita', 'Zawadzka', 'Kraków ul. Karmelicka 34', 123176789);

INSERT INTO rozliczenia.pracownicy VALUES('A06', 'Andrzej', 'Pros', 'Warszawa ul. W³adys³awa Broniewskiego 26', 890345832);

INSERT INTO rozliczenia.pracownicy VALUES('A07', '£ukasz', 'Janusz', 'Krzeszowice ul. Legionów Polskich 20', 123456798);

INSERT INTO rozliczenia.pracownicy VALUES('A08', 'Emilia', 'Szel', 'Bolechowice ul. Jurajska 9', 123456789);

INSERT INTO rozliczenia.pracownicy VALUES('A09', 'Antoni', 'Nowak', 'Kraków ul. Lipska 2', 321456789);

INSERT INTO rozliczenia.pracownicy VALUES('A10', 'Eliza', 'Bielska', 'Kraków ul. Jagielloñska 12', 563208912);

-- Dodawanie rekordów do godzin

INSERT INTO rozliczenia.godziny VALUES('G01', '2020-11-12' , 100, 'A01');

INSERT INTO rozliczenia.godziny VALUES('G02', '2020-11-13' , 120, 'A02');

INSERT INTO rozliczenia.godziny VALUES('G03', '2020-11-14' , 125, 'A03');

INSERT INTO rozliczenia.godziny VALUES('G04', '2020-11-15' , 110, 'A04');

INSERT INTO rozliczenia.godziny VALUES('G05', '2020-11-20' , 115, 'A05');

INSERT INTO rozliczenia.godziny VALUES('G06', '2020-11-11' , 120, 'A06');

INSERT INTO rozliczenia.godziny VALUES('G07', '2020-11-23' , 120, 'A07');

INSERT INTO rozliczenia.godziny VALUES('G08', '2020-11-05' , 90, 'A08');

INSERT INTO rozliczenia.godziny VALUES('G09', '2020-11-08' , 130, 'A09');

INSERT INTO rozliczenia.godziny VALUES('G10', '2020-11-21' , 140, 'A10');

-- Dodawanie rekordów do premii

INSERT INTO rozliczenia.premie VALUES('PR01' , NULL, NULL);

INSERT INTO rozliczenia.premie VALUES('PR02', 'Premia uznaniowa', '1000');

INSERT INTO rozliczenia.premie VALUES('PR03', 'Premia uznaniowa', '1050');

INSERT INTO rozliczenia.premie VALUES('PR04', NULL, NULL);

INSERT INTO rozliczenia.premie VALUES('PR05', NULL, NULL);

INSERT INTO rozliczenia.premie VALUES('PR06','Premia uznaniowa', '1000');

INSERT INTO rozliczenia.premie VALUES('PR07','Premia uznaniowa', '1000');

INSERT INTO rozliczenia.premie VALUES('PR08', NULL, NULL);

INSERT INTO rozliczenia.premie VALUES('PR09', 'Premia uznaniowa', '1100');

INSERT INTO rozliczenia.premie VALUES('PR10', 'Premia uznaniowa', '1200');

-- Dodanie rekordów do pensji

INSERT INTO rozliczenia.pensje VALUES('PE01', 'Asystent Zarz¹du', 'PR01');

INSERT INTO rozliczenia.pensje VALUES('PE02', 'Analiyk Systemu Komputerowego','PR02');

INSERT INTO rozliczenia.pensje VALUES('PE03', 'Analityk Finansowy','PR03');

INSERT INTO rozliczenia.pensje VALUES('PE04', 'Administrator Sieci LAN','PR04');

INSERT INTO rozliczenia.pensje VALUES('PE05', 'Adnimistrator Systemu','PR05');

INSERT INTO rozliczenia.pensje VALUES('PE06', 'Analityk Systemu Komputerowego','PR06');

INSERT INTO rozliczenia.pensje VALUES('PE07', 'Analityk Finansowy','PR07');

INSERT INTO rozliczenia.pensje VALUES('PE08', 'Kierownik Dzia³u Marketingu','PR08');

INSERT INTO rozliczenia.pensje VALUES('PE09', 'Kierownik Dzia³u Rozwoju i Innowacji','PR09');

INSERT INTO rozliczenia.pensje VALUES('PE10', 'Kierownik Zespo³u Badawczego','PR10');

-- Wyœwietlanie nazwiska i adresu pracowników

SELECT nazwisko,adres FROM rozliczenia.pracownicy;

-- Wyœwietlanie daty u¿ywaj¹c funkcji DATEPART

SELECT DATEPART(DW ,data) AS Dzieñ_tygodnia,DATEPART(MM ,data) AS Miesi¹c  FROM rozliczenia.godziny;

-- Zamiana kwoty na kwote brutto

EXEC SP_RENAME 'rozliczenia.premie.kwota', 'kwota_brutto' ;
ALTER TABLE rozliczenia.premie ADD kwota_netto AS premie.kwota_brutto*0.7;

