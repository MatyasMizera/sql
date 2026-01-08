CREATE TABLE IF NOT EXISTS kategorie (
    id_kategorie INT AUTO_INCREMENT NOT NULL,
    nazev VARCHAR(50) NOT NULL,
    CONSTRAINT pk_kategorie PRIMARY KEY (id_kategorie),
    CONSTRAINT uq_kategorie_nazev UNIQUE (nazev)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS polozka (
    id_polozky INT AUTO_INCREMENT NOT NULL,
    nazev VARCHAR(100) NOT NULL,
    datum_expirace DATE NOT NULL,
    pocet_kusu INT NOT NULL,
    id_kategorie INT NOT NULL,

    CONSTRAINT pk_polozka PRIMARY KEY (id_polozky),
    CONSTRAINT fk_kategorie
        FOREIGN KEY (id_kategorie)
        REFERENCES kategorie (id_kategorie)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;
