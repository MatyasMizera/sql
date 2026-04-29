CREATE DATABASE IF NOT EXISTS cert_db;
USE cert_db;

CREATE TABLE clients (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(40) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    birthdate DATE NOT NULL,
    street VARCHAR(40) NOT NULL,
    housenum VARCHAR(10),
    postal VARCHAR(5),
    city VARCHAR(40),
    username VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE certificates (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clients_id INT UNSIGNED NOT NULL,
    certkey VARCHAR(16) NOT NULL UNIQUE,
    FOREIGN KEY (clients_id) REFERENCES clients(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO clients 
(firstname, lastname, birthdate, street, housenum, postal, city, username, password, email, phone)
VALUES
('Jan', 'Novák', '1990-05-12', 'Hlavní', '12', '11000', 'Praha', 'jnovak', 'pass123', 'jan.novak@email.cz', '777123456'),
('Petra', 'Svobodová', '1985-09-23', 'Dlouhá', '45', '60200', 'Brno', 'psvobodova', 'pass123', 'petra@email.cz', '777654321'),
('Karel', 'Dvořák', '1978-02-01', 'Krátká', '7', '70030', 'Ostrava', 'kdvorak', 'pass123', 'karel@email.cz', '605123789'),
('Lucie', 'Králová', '1995-12-11', 'Javorová', '89', '30100', 'Plzeň', 'lkralova', 'pass123', 'lucie@email.cz', '606987654');

INSERT INTO certificates (clients_id, certkey)
VALUES
(1, 'ABC123XYZ000001'),
(1, 'ABC123XYZ000002'),
(2, 'DEF456UVW000001'),
(3, 'GHI789RST000001'),
(4, 'JKL012MNO000001'),
(4, 'JKL012MNO000002');