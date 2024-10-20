/*
Zweck:  Importiert sämtliche Daten der Webseite
Autor:  Jonas Sieber, Fabian Manser, Bojan Maljuric
Datum:  19.10.2024
Ausführung: mysql -u root -p < C:\pfad\zum\Script\importData.sql
*/

-- Deaktiviert den FOREIGN_KEY_CHECKS und bereitet das Löschen alter Daten vor.
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

-- Vorhandene Daten in allen Tabellen löschen
DELETE FROM Techelectronics.Warenkorb;
DELETE FROM Techelectronics.Lager;
DELETE FROM Techelectronics.Bestellung;
DELETE FROM Techelectronics.Produkt;
DELETE FROM Techelectronics.Produktkategorie;
DELETE FROM Techelectronics.Zahlmethode;
DELETE FROM Techelectronics.Kunde;

-- -----------------------------------------------------
-- Insert data für 'Zahlmethode'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Zahlmethode (Zahlmethode) 
VALUES 
  ('Kreditkarte'),
  ('Twint'),
  ('Überweisung');

-- -----------------------------------------------------
-- Insert data für 'Produktkategorie'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Produktkategorie (Produktkategorie) 
VALUES 
  ('Smartphones'),
  ('Laptops'),
  ('Tablets');

-- -----------------------------------------------------
-- Insert data für 'Produkt'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Produkt (Name, Hersteller, Produktnummer, Preis, Produktkategorie_id_Produktkategorie) 
VALUES 
  ('iPhone 15', 'Apple', '123456', 899.99, 1),
  ('Galaxy S24', 'Samsung', '654321', 799.99, 1),
  ('MacBook Air', 'Apple', '123654', 1199.99, 2),
  ('Surface Pro', 'Microsoft', '456123', 999.99, 3);

-- -----------------------------------------------------
-- Insert data für 'Bestellung'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Bestellung (Zahlmethode_id_Zahlmethode, Zeitstempfel, Abgerechnet, Kunde_id_Kunde) 
VALUES 
  (1, '2024-08-01 14:30:00', 'Ja', 1),
  (2, '2024-08-03 10:15:00', 'Nein', 2),
  (3, '2024-08-05 18:45:00', 'Ja', 3);

-- -----------------------------------------------------
-- Insert data für 'Warenkorb'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Warenkorb (Bestellung_id_Bestellung, Produkt_id_Produkt) 
VALUES 
  (1, 1),
  (1, 3),
  (2, 2),
  (3, 4);

-- -----------------------------------------------------
-- Insert data für 'Lager'
-- -----------------------------------------------------
INSERT INTO Techelectronics.Lager (Anzahl, Lagerort, Produkt_id_Produkt) 
VALUES 
  (50, 1, 1),
  (30, 2, 2),
  (15, 3, 3),
  (0, 1, 4);

-- -----------------------------------------------------
-- LOAD DATA für 'Kunde'
-- -----------------------------------------------------
-- Windows Path: C:\ProgramData\MySQL\MySQL Server 8.4\Uploads\

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.4\\Uploads\\Kunde.csv' 
INTO TABLE Techelectronics.Kunde
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
ignore 1 rows
(`Nachname`, `Vorname`, `Strasse`, `Postleitzahl`, `Ort`, `Telefonnummer`, `Handynummer`, `Geburtsdatum`, `E-Mail Adresse`);


-- Reaktiviert den FOREIGN_KEY_CHECKS und SQL_SAFE_UPDATES
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;
