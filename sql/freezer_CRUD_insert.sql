SELECT 
    po.id_polozky,
    po.nazev,
    po.datum_expirace,
    po.pocet_kusu,
    ka.nazev AS kategorie
FROM polozka AS po
INNER JOIN kategorie AS ka 
    ON ka.id_kategorie = po.id_kategorie;


INSERT INTO polozka (nazev, datum_expirace, pocet_kusu, id_kategorie)
VALUES ('Těstoviny', DATE('2026-06-20'), 3, 5);


UPDATE polozka
SET pocet_kusu = pocet_kusu + 5
WHERE id_polozky = 1;


UPDATE polozka
SET datum_expirace = DATE('2026-04-01')
WHERE id_polozky = 2;


DELETE FROM polozka
WHERE id_polozky = 15;


SELECT 
    po.nazev,
    po.datum_expirace,
    ka.nazev AS kategorie
FROM polozka po
JOIN kategorie ka 
    ON po.id_kategorie = ka.id_kategorie
WHERE po.datum_expirace <= CURRENT_DATE + INTERVAL 30 DAY;


SELECT 
    SUM(pocet_kusu) AS celkem_kusu
FROM polozka;


SELECT 
    ka.nazev AS kategorie,
    COUNT(po.id_polozky) AS pocet_polozek
FROM kategorie ka
LEFT JOIN polozka po 
    ON ka.id_kategorie = po.id_kategorie
GROUP BY ka.nazev;


SELECT nazev, datum_expirace
FROM polozka
ORDER BY datum_expirace ASC
LIMIT 1;


SELECT nazev, datum_expirace
FROM polozka
ORDER BY datum_expirace DESC
LIMIT 1;


SELECT DISTINCT
    nazev,
    datum_expirace,
    pocet_kusu
FROM polozka
WHERE datum_expirace <= CURRENT_DATE + INTERVAL 14 DAY
   OR pocet_kusu < 2;
