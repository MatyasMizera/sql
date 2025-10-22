CREATE TABLE hockeyPlayer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL
);

DELIMITER $$

CREATE PROCEDURE insert_player(
    IN v_fname VARCHAR(30),
    IN v_lname VARCHAR(50),
    IN v_team VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Vkládání hráče se nezdařilo.' AS stav;
    END;

    START TRANSACTION;
        INSERT INTO hockeyPlayer (fname, lname, team)
        VALUES (v_fname, v_lname, v_team);
    COMMIT;
END $$

DELIMITER ;

CALL insert_player('David', 'Pastrňák', 'Boston Bruins');
-- Záznam se vloží úspěšně.

CALL insert_player('Pavel', 'Zacha', NULL);
-- Dojde k chybě kvůli hodnotě NULL ve sloupci team.
-- Transakce se vrátí zpět a vypíše se zpráva "Vkládání hráče se nezdařilo."
