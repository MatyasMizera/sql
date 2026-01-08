INSERT INTO kategorie (nazev)
SELECT 'Maso' UNION ALL
SELECT 'Hotová jídla' UNION ALL
SELECT 'Ryby' UNION ALL
SELECT 'Zelenina' UNION ALL
SELECT 'Přílohy' UNION ALL
SELECT 'Ovoce' UNION ALL
SELECT 'Dezerty' UNION ALL
SELECT 'Polotovary';


INSERT INTO polozka (nazev, datum_expirace, pocet_kusu, id_kategorie)
SELECT 'Kuřecí prsa', DATE('2026-03-15'), 4, 1 UNION ALL
SELECT 'Hovězí guláš', DATE('2026-01-20'), 2, 2 UNION ALL
SELECT 'Losos filet', DATE('2026-02-10'), 3, 3 UNION ALL
SELECT 'Mražený špenát', DATE('2026-06-01'), 5, 4 UNION ALL
SELECT 'Hranolky', DATE('2026-05-12'), 2, 5 UNION ALL
SELECT 'Jahody', DATE('2026-04-30'), 3, 6 UNION ALL
SELECT 'Borůvky', DATE('2026-04-18'), 2, 6 UNION ALL
SELECT 'Pizza Margherita', DATE('2026-02-28'), 1, 2 UNION ALL
SELECT 'Vepřová panenka', DATE('2026-03-05'), 2, 1 UNION ALL
SELECT 'Zeleninová směs', DATE('2026-07-10'), 4, 4 UNION ALL
SELECT 'Knedlíky', DATE('2026-08-01'), 2, 5 UNION ALL
SELECT 'Vanilková zmrzlina', DATE('2026-09-15'), 1, 7 UNION ALL
SELECT 'Rybí prsty', DATE('2026-01-30'), 3, 3 UNION ALL
SELECT 'Maliny', DATE('2026-04-25'), 2, 6 UNION ALL
SELECT 'Kuřecí vývar', DATE('2026-02-05'), 4, 8;
