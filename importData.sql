/*
    Autor:  Jonas, Fabian, Bojan
    Datum:  29.08.2024
    DB:     Techelectronics
*/

-- -----------------------------------------------------
-- Deactivate FOREIGN_KEY_CHECKS and prepare to delete old data
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

-- Delete existing data in all tables
DELETE FROM Techelectronics.Warenkorb;
DELETE FROM Techelectronics.Lager;
DELETE FROM Techelectronics.Bestellung;
DELETE FROM Techelectronics.Produkt;
DELETE FROM Techelectronics.Produktkategorie;
DELETE FROM Techelectronics.Zahlmethode;

-- -----------------------------------------------------
-- Insert data for 'Zahlmethode'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Zahlmethode (Zahlmethode) 
VALUES 
  ('Kreditkarte'),
  ('Twint'),
  ('Überweisung');

-- -----------------------------------------------------
-- Insert data for 'Produktkategorie'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Produktkategorie (Produktkategorie) 
VALUES 
  ('Smartphones'),
  ('Laptops'),
  ('Tablets');

-- -----------------------------------------------------
-- Insert data for 'Produkt'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Produkt (Name, Hersteller, Produktnummer, Preis, Produktkategorie_id_Produktkategorie) 
VALUES 
  ('iPhone 15', 'Apple', '123456', 899.99, 1),
  ('Galaxy S24', 'Samsung', '654321', 799.99, 1),
  ('MacBook Air', 'Apple', '123654', 1199.99, 2),
  ('Surface Pro', 'Microsoft', '456123', 999.99, 3);

-- -----------------------------------------------------
-- Insert data for 'Bestellung'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Bestellung (Zahlmethode_id_Zahlmethode, Zeitstempfel, Abgerechnet, Kunde_id_Kunde) 
VALUES 
  (1, '2024-08-01 14:30:00', 'Ja', 1),
  (2, '2024-08-03 10:15:00', 'Nein', 2),
  (3, '2024-08-05 18:45:00', 'Ja', 3);

-- -----------------------------------------------------
-- Insert data for 'Warenkorb'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Warenkorb (Bestellung_id_Bestellung, Produkt_id_Produkt) 
VALUES 
  (1, 1),
  (1, 3),
  (2, 2),
  (3, 4);

-- -----------------------------------------------------
-- Insert data for 'Lager'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Lager (Anzahl, Lagerort, Produkt_id_Produkt) 
VALUES 
  (50, 1, 1),
  (30, 2, 2),
  (15, 3, 3),
  (25, 1, 4);

-- -----------------------------------------------------
-- LOAD DATA for 'Kunde' table
-- -----------------------------------------------------
-- Format: Nachname, Vorname, Strasse, Postleitzahl, Ort, Telefonnummer, Handynummer, Geburtsdatum, `E-Mail Adresse`
-- Windows Path: C:\ProgramData\MySQL\MySQL Server 8.4\Uploads\

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.4\\Uploads\\Kunde.csv' 
INTO TABLE Techelectronics.Kunde
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
ignore 1 rows
(Nachname, Vorname, Strasse, Postleitzahl, Ort, Telefonnummer, Handynummer, Geburtsdatum, `E-Mail Adresse`);

-- -----------------------------------------------------
-- Reactivate FOREIGN_KEY_CHECKS
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;
