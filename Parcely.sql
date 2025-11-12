CREATE DATABASE parcely_db;
USE parcely_db;

CREATE TABLE owners (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(100)
);

CREATE TABLE plots (
 id INT AUTO_INCREMENT PRIMARY KEY,
 owner_id INT NOT NULL,
 area DECIMAL(10,2) NOT NULL,
 kind ENUM('stavebni','zpf','mixed') NOT NULL,
 note VARCHAR(255),
 FOREIGN KEY (owner_id) REFERENCES owners(id)
);

INSERT INTO owners (name,email) VALUES
('Jan Novák','jan@email.cz'),
('Petr Svoboda','petr@email.cz');

INSERT INTO plots (owner_id,area,kind,note) VALUES
(1,550.75,'stavebni','Rodinný dům'),
(1,1200.00,'zpf','Zahrada'),
(2,800.50,'mixed','Pozemek s chatou');

CREATE ROLE parcely_role;
GRANT SELECT,INSERT,UPDATE,DELETE ON parcely_db.* TO parcely_role;

CREATE USER 'uzivatel_parcely'@'localhost' IDENTIFIED BY 'heslo123';
GRANT parcely_role TO 'uzivatel_parcely'@'localhost';
SET DEFAULT ROLE parcely_role TO 'uzivatel_parcely'@'localhost';
