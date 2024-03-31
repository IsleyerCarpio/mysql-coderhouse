use carpio_47375;

-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 


DROP TRIGGER IF EXISTS TRG_log_Audit_position ;
DELIMITER //
CREATE TRIGGER TRG_log_Audit_position AFTER INSERT ON carpio_47375.position
FOR EACH ROW
BEGIN
INSERT INTO log_audit_position (id_position, name, action_name, table_name, user, date_insert)
VALUES (NEW.id_position, NEW.name, 'INSERT', 'position', user(), now()); 
END//
DELIMITER ;

INSERT INTO position (name) VALUES ('Personal de aseo');

SELECT * FROM log_audit_position;
 select * from position;
-- ------------------------------------------------------------------------

DROP TRIGGER IF EXISTS TRG_log_historic_position ;
DELIMITER //
CREATE TRIGGER TRG_log_historic_position BEFORE UPDATE ON carpio_47375.position
FOR EACH ROW
BEGIN
INSERT INTO log_historic_position (action_name, table_name, user,old_name, new_name, date_update_insert)
VALUES ('UPDATE', 'position', user(), OLD.name, NEW.name, now()); 
END//
DELIMITER ;

UPDATE position SET name = 'Terapeuta de Masajes' WHERE id_position =  6;
SELECT * FROM log_historic_position;


