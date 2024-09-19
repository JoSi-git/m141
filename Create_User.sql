/*
    Author: Jonas, Fabian, Bojan
    Date:   05.09.2024
    DB:     Techelectronics
*/

-- -----------------------------------------------------
-- Create a new user for managing the 'Lager' table
-- -----------------------------------------------------
CREATE USER 'lager_manager'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, UPDATE ON Techelectronics.lager TO 'lager_manager'@'localhost';
FLUSH PRIVILEGES;

-- -----------------------------------------------------
-- Create a new Admin user with full privileges on the database
-- -----------------------------------------------------
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Techelectronics.* TO 'admin_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- -----------------------------------------------------
-- Create a new user for managing the 'kunde' table
-- -----------------------------------------------------
CREATE USER 'Kunde_Manager'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON Techelectronics.kunde TO 'Kunde_Manager'@'localhost';
FLUSH PRIVILEGES;
