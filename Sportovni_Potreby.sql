CREATE DATABASE IF NOT EXISTS SportovniPotreby;
USE SportovniPotreby;

CREATE TABLE IF NOT EXISTS Kategorie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Vyrobce (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS SportovniPotreba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(255) NOT NULL,
    popis TEXT,
    kategorie_id INT,
    vyrobce_id INT,
    FOREIGN KEY (kategorie_id) REFERENCES Kategorie(id),
    FOREIGN KEY (vyrobce_id) REFERENCES Vyrobce(id)
);

CREATE TABLE IF NOT EXISTS SkladovaEvidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sportovni_potreba_id INT,
    mnozstvi INT NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (sportovni_potreba_id) REFERENCES SportovniPotreba(id)
);

DELIMITER $$

CREATE PROCEDURE VlozSportovniPotrebu(
    IN nazev_potreby VARCHAR(255),
    IN popis_potreby TEXT,
    IN kategorie_id INT,
    IN vyrobce_id INT,
    IN mnozstvi INT,
    IN cena DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;

    INSERT INTO SportovniPotreba (nazev, popis, kategorie_id, vyrobce_id)
    VALUES (nazev_potreby, popis_potreby, kategorie_id, vyrobce_id);

    DECLARE sportovni_potreba_id INT;
    SET sportovni_potreba_id = LAST_INSERT_ID();

    INSERT INTO SkladovaEvidence (sportovni_potreba_id, mnozstvi, cena)
    VALUES (sportovni_potreba_id, mnozstvi, cena);

    COMMIT;
END $$

DELIMITER ;
