DROP SCHEMA IF EXISTS carpio_47375;
create schema carpio_47375;
use carpio_47375;


CREATE TABLE IF NOT EXISTS customer (

id_customer INT NOT NULL AUTO_INCREMENT COMMENT  'PRIMARY KEY' ,
rut VARCHAR (12) NOT NULL COMMENT 'CUSTOMER IDENTIFICATION' ,
first_name VARCHAR (25) NOT NULL COMMENT 'CUSTOMER NAME' ,
last_name VARCHAR (25) NOT NULL COMMENT 'CUSTOMER LAST NAME' ,
birthdate DATE NOT NULL COMMENT 'CUSTOMER BIRTHDATE' ,
sex CHAR (1) NOT NULL COMMENT 'CUSTOMER SEX' ,
phone VARCHAR (20) NOT NULL COMMENT 'CUSTOMER PHONE' ,
address VARCHAR (60) NOT NULL COMMENT 'CUSTOMER ADDRESS' , 
PRIMARY KEY (id_customer)  
);


CREATE TABLE IF NOT EXISTS position (

id_position INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' , 
name VARCHAR (25) NOT NULL COMMENT 'POSITION NAME' ,
PRIMARY KEY (id_position) 
); 


CREATE TABLE IF NOT EXISTS worker (

id_worker INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' , 
rut VARCHAR (12) NOT NULL COMMENT 'WORKER IDENTIFICATION' , 
first_name VARCHAR (25) NOT NULL COMMENT 'WORKER NAME' , 
last_name VARCHAR (25) NOT NULL COMMENT 'WORKER LAST NAME' ,
birthdate DATE NOT NULL COMMENT 'WORKER BIRTHDATE' ,
sex CHAR (1) NOT NULL COMMENT 'WORKER SEX' ,
phone VARCHAR (20) NOT NULL COMMENT 'WORKER PHONE' ,
address VARCHAR (60) NOT NULL COMMENT 'CUSTOMER ADDRESS' , 
id_position INT NOT NULL COMMENT 'WORKER POSITION' ,
PRIMARY KEY (id_worker), 

CONSTRAINT position FOREIGN KEY(id_position) REFERENCES position (id_position)
); 


CREATE TABLE IF NOT EXISTS service (

id_service INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' ,
name VARCHAR (50) NOT NULL COMMENT 'NAME SERVICE' ,
cost_service DECIMAL (10,2) NOT NULL COMMENT 'COST OF SERVICE' ,
time_service time NOT NULL COMMENT 'SERVICE_DURATION' ,
PRIMARY KEY (id_service)
);


CREATE TABLE IF NOT EXISTS payment_type (
id_payment_type INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' , 
name VARCHAR (50) NOT NULL COMMENT 'PAYMENT TYPE NAME' ,
PRIMARY KEY (id_payment_type) 
);


CREATE TABLE IF NOT EXISTS payment (

id_payment INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' ,
payment_date DATETIME NOT NULL COMMENT 'PAYMENT DATE AND TIME' ,
id_payment_type INT NOT NULL COMMENT 'PAYMENT TYPE' ,
payment_amount DECIMAL(10,2) NOT NULL COMMENT 'PAYMENT AMOUNT' , 
PRIMARY KEY (id_payment) , 
CONSTRAINT  payment_type FOREIGN KEY(id_payment_type) REFERENCES payment_type (id_payment_type)
); 


CREATE TABLE IF NOT EXISTS appointment (

id_appointment INT NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY KEY' ,  
id_customer INT NOT NULL COMMENT 'CUSTOMER IDENTIFICATION' ,
id_worker INT NOT NULL COMMENT 'WORKER IDENTIFICATION' , 
date_appointment DATE NOT NULL COMMENT 'DATE DENTIFICATION' , 
time_appointment TIME NOT NULL COMMENT 'TIME IDENTIFICATION' ,
id_service INT NOT  NULL COMMENT 'SERVICE IDENTIFICATION' ,
id_payment INT NOT NULL COMMENT 'PAYMENT IDENTIFICATION' ,
cancelled BIT NOT NULL COMMENT 'PAID SERVICE',
completed BIT NOT NULL COMMENT'SERVICE COMPLETED' , 
PRIMARY KEY (id_appointment) , 
CONSTRAINT  appointment FOREIGN KEY(id_customer) REFERENCES customer (id_customer)
); 

ALTER TABLE appointment ADD CONSTRAINT FK_appointment_worker FOREIGN KEY(id_worker) REFERENCES worker (id_worker) ;

ALTER TABLE appointment ADD CONSTRAINT FK_appointment_service FOREIGN KEY(id_service) REFERENCES service (id_service) ;

ALTER TABLE appointment ADD CONSTRAINT FK_appointment_payment FOREIGN KEY(id_payment) REFERENCES payment (id_payment) ;

INSERT INTO customer VALUES (1,'13.938.227-7', 'Benix', 'Aravena', '78-04-21', 'F', '56995937221', 'San Bernardo, RM');
INSERT INTO customer VALUES (2,'26.889.858-1', 'Ericka', 'Herrera', '85-08-15', 'F', '56984150764', 'Santiago Centro, RM');
INSERT INTO customer VALUES (3,'18.097.726-0', 'Romina', 'Neira', '90-02-02', 'F', '56991540141', 'La florida, RM');
INSERT INTO customer VALUES (4,'18.108.934-2', 'Karina', 'Teran', '90-05-21', 'F', '56995424936', 'Vitacura, RM');
INSERT INTO customer VALUES (5,'25.705.371-7', 'Neudys', 'Moreno', '96-07-25', 'F', '56949557462', 'Vitacura, RM');
INSERT INTO customer VALUES (6,'17.491.159-2', 'Scarlet', 'Jaque', '90-12-08', 'F', '56954405151', 'La Florida, RM');
INSERT INTO customer VALUES (7,'27.157.784-2', 'Laura', 'Pereira', '89-11-28', 'F', '56967784887', 'San Miguel, RM');
INSERT INTO customer VALUES (8,'10.156.150-K', 'Nancys', 'Poblete', '70-10-07', 'F', '56976559562', 'La Reina, RM');
INSERT INTO customer VALUES (9,'18.467.451-3', 'Fabiola', 'Alcota', '95-08-28', 'F', '56981947364', 'La Florida, RM');
INSERT INTO customer VALUES (10,'18.175.006-5', 'Joselin', 'Rubio', '92-08-31', 'F', '56954625348', 'Vitacura, RM');
INSERT INTO customer VALUES (11,'26.656.931-9', 'Sandra', 'Bracho', '61-05-06', 'F', '56985325100', 'Independencia, RM');
INSERT INTO customer VALUES (12,'26.928.047-6', 'Dayana', 'Duarte', '92-11-18', 'F', '56936384662', 'Santiago Centro, RM');
INSERT INTO customer VALUES (13,'18.005.488-K', 'Carolina', 'Altuvez', '85-04-04', 'F', '56944536582', 'La Cisterna, RM');
INSERT INTO customer VALUES (14,'23.556.874-k', 'Maria', 'Carpio', '78-05-13', 'F', '56957880452', 'La Dehesa, RM');
INSERT INTO customer VALUES (15,'27.556.874-0', 'Mariam', 'Rodriguez', '78-05-25', 'F', '56957880436', 'Providencia, RM');
INSERT INTO position VALUES (1, 'Manicurista');
INSERT INTO position VALUES (2, 'Podologa');
INSERT INTO position VALUES (3, 'Estilista');
INSERT INTO position VALUES (4, 'Lashista');
INSERT INTO position VALUES (5, 'Cajera');
INSERT INTO worker VALUES (1, '18.256.778-6', 'Angelica', 'Marin', '95-06-21', 'F', '56985635823', 'Vitacura, RM', 1);
INSERT INTO worker VALUES (2, '27.632.792-k', 'Barbara', 'Perez', '93-06-04', 'F', '56996320023', 'Providencia, RM', 3);
INSERT INTO worker VALUES (3, '23.658.776-6', 'Isbelyn', 'Carpio', '94-01-20', 'F', '56921453695', 'San Miguel, RM', 5);
INSERT INTO worker VALUES (4, '28.564.773-6', 'Emily', 'Pichardo', '99-09-04', 'F', '56988523698', 'Lampa, RM', 4);
INSERT INTO worker VALUES (5, '23.568.412-0', 'Alexmary', 'Rodriguez', '95-01-31', 'F', '56985632152', 'Lo Prado, RM', 4);
INSERT INTO worker VALUES (6, '21.586.223-7', 'Sofia', 'Rivera', '93-05-21', 'F', '56932100002', 'Providencia, RM', 5);
INSERT INTO worker VALUES (7, '26.258.471-k', 'Maria', 'Perez', '92-08-15', 'F', '56925100023', 'Vitacura, RM', 3);
INSERT INTO worker VALUES (8, '29.568.223-0', 'Altagracia', 'Suarez', '96-07-06', 'F', '56978965236', 'Vitacura, RM', 2);
INSERT INTO worker VALUES (9, '24.587.663-8', 'Mery', 'Pichardo', '92-05-28', 'F', '56999996325', 'Vitacura, RM', 1);
INSERT INTO worker VALUES (10, '21.365.748-0', 'Stefania', 'Duque', '85-03-21', 'F', '56978452145', 'San Miguel, RM', 4);
INSERT INTO worker VALUES (11, '27.003.562-6', 'Alejandra', 'Diaz', '86-09-21', 'F', '56900032516', 'San Miguel, RM', 1);
INSERT INTO worker VALUES (12, '26.542.223-0', 'Katherine', 'Caceres', '88-12-17', 'F', '56902143285', 'Providencia, RM', 2);
INSERT INTO worker VALUES (13, '18.657.000-4', 'Josefa', 'Franco', '90-12-31', 'F', '56956410000', 'La Reina, RM', 3);
INSERT INTO worker VALUES (14, '18.547.111-6', 'Mariana', 'Ravelo', '97-11-16', 'F', '56930215552', 'La Reina, RM', 2);
INSERT INTO worker VALUES (15, '17.563.660-5', 'Karina', 'Hernandez', '94-01-08', 'F', '56998745632', 'Macul, RM', 5);
INSERT INTO service VALUES (1, 'Manicure Rusa Uñas Cortas', '22000', '2:00:00');
INSERT INTO service VALUES (2,'Manicure Rusa Uñas Medias', '24000', '2:30:00');
INSERT INTO service VALUES (3,'Manicure Rusa Uñas Largas', '26000', '2:30:00');
INSERT INTO service VALUES (4,'Manicure Convencional', '18000', '1:30:00');
INSERT INTO service VALUES (5,'Pedicure Estetico', '21000', '1:30:00');
INSERT INTO service VALUES (6,'Podologia', '25000', '1:50:00');
INSERT INTO service VALUES (7,'Podologia Esmaltado', '30000', '2:00:00');
INSERT INTO service VALUES (8,'Extension de Pestañas Clasicas', '25000', '2:00:00');
INSERT INTO service VALUES (9,'Extension de Pestañas Volumen Ruso', '32000', '2:30:00');
INSERT INTO service VALUES (10,'Brushing', '20000', '1:00:00');
INSERT INTO service VALUES (11,'Brushing+Lavado', '26000', '1:15:00');
INSERT INTO service VALUES (12,'Masaje Capilar', '25000', '1:30:00');
INSERT INTO service VALUES (13,'Masaje Capilar Botox', '30000', '1:30:00');
INSERT INTO service VALUES (14,'Tintura Capilar', '35000', '2:00:00');
INSERT INTO service VALUES (15,'Retiro de Manicure', '5000', '00:30:00');
INSERT INTO payment_type  VALUES (1, 'Efectivo');
INSERT INTO payment_type  VALUES (2,'Tarjeta Debito');
INSERT INTO payment_type  VALUES (3, 'Tarjeta Credito');
INSERT INTO payment_type  VALUES (4, 'Transferencia Bancaria');
INSERT INTO payment_type  VALUES (5, 'Cheque al Dia');
INSERT INTO payment VALUES (1, '23-10-01 8:00:00', 1,'22000');
INSERT INTO payment VALUES (2, '23-10-01 10:00:00', 2,'22000');
INSERT INTO payment VALUES (3, '23-10-01 12:30:00', 3,'26000');
INSERT INTO payment VALUES (4, '23-10-01 14:00:00', 4,'18000');
INSERT INTO payment VALUES (5, '23-10-01 17:00:00', 5,'22000');
INSERT INTO payment VALUES (6, '23-10-02 10:00:00', 1,'30000');
INSERT INTO payment VALUES (7, '23-10-02 14:00:00', 5, '21000');
INSERT INTO payment VALUES (8, '23-10-04 12:00:00', 2, '26000');
INSERT INTO payment VALUES (9, '23-10-04 15:00:00', 3, '30000');
INSERT INTO payment VALUES (10, '23-10-04 18:00:00', 1, '22000');
INSERT INTO payment VALUES (11, '23-10-05 8:00:00', 3, '22000');
INSERT INTO payment VALUES (12, '23-10-05 13:00:00', 4, '25000');
INSERT INTO payment VALUES (13, '23-10-05 17:00:00', 2, '35000');
INSERT INTO payment VALUES (14, '23-10-06 14:00:00', 1, '30000');
INSERT INTO payment VALUES (15, '23-10-06 17:00:00', 3, '26000');
INSERT INTO appointment VALUES (1, 1, 3, '23-09-15', '09:36:00', 1, 1, 0, 1 );
INSERT INTO appointment VALUES (2, 7, 10, '23-09-23', '15:49:15', 11, 5, 0, 1 );
INSERT INTO appointment VALUES (3, 4, 1, '23-09-25', '11:45:05', 11, 5, 0, 1 );
INSERT INTO appointment VALUES (4, 6, 9, '23-09-26', '13:15:50', 7, 6, 0, 1 );
INSERT INTO appointment VALUES (5, 3, 4, '23-09-27', '17:25:40', 10, 2, 0, 1 );
INSERT INTO appointment VALUES (6, 8, 11, '23-09-27', '08:31:08', 5, 13, 0, 1 );
INSERT INTO appointment VALUES (7, 13, 8, '23-09-27', '13:28:36', 13, 4, 0, 1 );
INSERT INTO appointment VALUES (9, 10, 12, '23-09-28', '09:36:00', 3, 12, 0, 1 );
INSERT INTO appointment VALUES (10, 15, 2, '23-09-28', '11:15:50', 8, 3, 0, 1 );
INSERT INTO appointment VALUES (11, 9, 13, '23-09-29', '07:02:01', 14, 15, 0, 1 );
INSERT INTO appointment VALUES (12, 11, 7, '23-09-30', '15:15:50', 4, 11, 0, 1 );
INSERT INTO appointment VALUES (13, 2, 14, '23-09-30', '14:55:50', 15, 8, 0, 1 );
INSERT INTO appointment VALUES (15, 12, 15, '23-09-30', '23:25:50', 9, 7, 0, 1 );

-- VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS VIEWS

-- Nombre y Apellido de las clientas que su direccion sea La Florida

CREATE or replace view carpio_47375.VW_ADDRESS_LA_FLORIDA
as
(
SELECT first_name as "First Name", last_name "Last Name", address as "Address"
FROM carpio_47375.customer
WHERE (address) like 'La Florida%'
);

select * from VW_ADDRESS_LA_FLORIDA;

-- Nombre de las clientas que pagaron con Tarjeta de credito un monto mayor a 20000 

CREATE or replace view carpio_47375.VW_TC
as
(
SELECT cm.first_name as "first name", pm.payment_amount as "Payment Amount", pt.name "Payment Type"
FROM carpio_47375.appointment as ap
INNER JOIN customer as cm ON cm.id_customer = ap.id_customer
INNER JOIN payment as pm ON pm.id_payment = ap.id_payment
INNER JOIN payment_type pt ON pm.id_payment_type = pt.id_payment_type
WHERE pt.id_payment_type = 3 AND pm.payment_amount > 20000
);

select * from VW_TC;

-- Apellido de los Trabajadores que ocupen la posicion de estilista

 
CREATE or replace view carpio_47375.VW_estilistas
as
SELECT pn.name as "position",  wr.last_name as "worker last name"
from carpio_47375.worker as wr
JOIN position as pn ON wr.id_position = pn.id_position
WHERE pn.name = 'Estilista'
;
 
select * from VW_estilistas;

-- Nombre de los servicios completados


CREATE or replace view carpio_47375.VW_SCompleted
as
( select ap.completed, sv.name
from carpio_47375.appointment as ap
JOIN service sv ON sv.id_service = ap.id_service
Where ap.completed = 1
);

select * from VW_SCompleted;

-- Nombre y Apellido de las clientas que Pagaron con Efectivo

CREATE or replace view carpio_47375.VW_EF
as
(
SELECT wk.last_name as "last name", wk.first_name as Name, pt.name as "Payment Type"
FROM carpio_47375.appointment as ap
INNER JOIN worker as wk ON wk.id_worker = ap.id_worker
INNER JOIN payment as pm ON pm.id_payment = ap.id_payment
INNER JOIN payment_type pt ON pm.id_payment_type = pt.id_payment_type
WHERE pt.id_payment_type = 1 
);

select * from VW_EF;


-- FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION 
-- FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION 
-- FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION 
-- FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION 
-- FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION FUNCTION 



/* Monto  de los servicios por dias
Retornar:
1.- Si es > a $100.000 'ALTO'
2.- Si es >= a $75.000 'MEDIO'
3.- Si es < a $75.000 'BAJO'
*/

DROP FUNCTION IF EXISTS FN_Get_revenue ;
DELIMITER // 
CREATE FUNCTION FN_Get_revenue(month_number varchar (50))
RETURNS VARCHAR (50)
DETERMINISTIC 
BEGIN
	DECLARE day_revenue VARCHAR(30) ; 
	SET day_revenue = (
		SELECT (
			CASE 
			WHEN sum(pay.payment_amount) >= 100000 THEN 'HIGH'
			WHEN sum(pay.payment_amount) >= 75000 and sum(pay.payment_amount) < 100000 then 'HALF' 
			else 'LOW'
			END
		) AS revenue
		FROM appointment AS app
		JOIN payment AS pay ON app.id_payment = pay.id_payment
		WHERE pay.payment_date LIKE CONCAT('%', month_number, '%')
    );
	RETURN day_revenue;
END //
DELIMITER ;

SELECT FN_Get_revenue('2023-10-01') AS 'Ganancia X Dia';

-- Si hay clienta agendadas el dia 2023-09-30

DROP FUNCTION IF EXISTS FN_daily_appointment;
DELIMITER //
CREATE FUNCTION FN_daily_appointment(daily_appointment varchar (50))
RETURNS varchar (50)
DETERMINISTIC
BEGIN
	DECLARE daily_reservations varchar (50);
		IF 		( SELECT COUNT(*) 
				FROM appointment 
				WHERE date_appointment = daily_appointment)  >= 1 THEN
		SET  daily_reservations = 'YES';
    ELSE
		SET  daily_reservations = 'NO';
    END IF;

    RETURN  daily_reservations;
END//
DELIMITER ;


SELECT FN_daily_appointment('2023-09-30') AS 'DAILY_APPOINTMENTS';


-- PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE 
-- PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE 
-- PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE 
-- PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE PROCEDURE 

-- CANTIDAD DE CLIENTE QUE CONTENGAN UNA LETRA 


DROP PROCEDURE carpio_47375.SP_letter_customer
DELIMITER // 
	CREATE PROCEDURE carpio_47375.SP_letter_customer (in letra char (1),  
										 out p_number INT)
	BEGIN
		SELECT count(*) into p_number
		FROM customer 
		WHERE first_name like concat('%',letra,'%');
END//
DELIMITER ; 

CALL carpio_47375.SP_letter_customer ('A',@quantity_A);
	select @quantity_A;
    
CALL carpio_47375.SP_letter_customer ('B',@quantity_B);
	select @quantity_B;
    
CALL carpio_47375.SP_letter_customer ('C',@quantity_C);
	select @quantity_C;


-- NOMBRE Y APELLIDO DEL CLIENTE CUYO ID SEA 2

drop procedure carpio_47375.SP_customer
DELIMITER // 
CREATE PROCEDURE carpio_47375.SP_customer (in P_id_customer INT,
								out P_first_name varchar (50),
                                out P_last_name varchar (50))
BEGIN
SELECT first_name, last_name 
INTO P_first_name, P_last_name
FROM carpio_47375.customer
WHERE id_customer = P_id_customer;

END //
DELIMITER ;

CALL carpio_47375.SP_customer (2, @P_first_name, @P_last_name);
select @P_first_name, @P_last_name;


-- PROCEDURE CON INSERT EN LA TABLA customer DESC


DROP PROCEDURE IF EXISTS carpio_47375.SP_InsertCustomer;

DELIMITER //

CREATE PROCEDURE carpio_47375.SP_InsertCustomer(
    IN p_rut VARCHAR(12),
    IN p_first_name VARCHAR(25),
    IN p_last_name VARCHAR(25),
    IN p_birthdate DATE,
    IN p_sex CHAR(1),
    IN p_phone VARCHAR(20),
    IN p_address VARCHAR(60),
    IN p_order_direction VARCHAR(4),
    OUT p_customer_id INT
)
BEGIN
    -- Insertar un nuevo cliente
    INSERT INTO customer (rut, first_name, last_name, birthdate, sex, phone, address)
				  VALUES (p_rut, p_first_name, p_last_name, p_birthdate, p_sex, p_phone, p_address);
    SET p_customer_id = LAST_INSERT_ID();
		SELECT *
		FROM customer
		ORDER BY id_customer DESC -- Puedes cambiar DESC a ASC 
		LIMIT 1;
	END //
DELIMITER ;

SET @customer_id = NULL; -- Inicializar la variable de salida
CALL carpio_47375.SP_InsertCustomer('18.000.248-2', 'Anabel', 'Franco', '1980-02-28', 'F', '56955623285', 'Santiago Centro, RM', 'DESC', @customer_id);
SELECT * FROM CUSTOMER; 

-- PROCEDURE CON INSERT EN LA TABLA POSITION desc

DROP PROCEDURE IF EXISTS carpio_47375.SP_Insert_position;
DELIMITER //
CREATE PROCEDURE carpio_47375.SP_Insert_position(
    IN p_name VARCHAR(25),
	OUT p_position_id INT
)
BEGIN
INSERT INTO position (name) VALUES (p_name);
    SET p_position_id = LAST_INSERT_ID();

SELECT *
FROM position
    ORDER BY id_position DESC
    LIMIT 1; 
END //
DELIMITER ;

SET @p_position_id = NULL;
call carpio_47375.SP_Insert_position ('Masajista',@p_position_id);
SELECT @p_position_id;

-- CREACION DE TABLAS PARA TRIGGERS-- CREACION DE TABLAS PARA TRIGGERS
-- CREACION DE TABLAS PARA TRIGGERS  -- CREACION DE TABLAS PARA TRIGGERS

DROP TABLE IF EXISTS carpio_47375.log_audit_position;
CREATE TABLE IF NOT EXISTS  carpio_47375.log_audit_position
(
id_lod INT AUTO_INCREMENT COMMENT 'PRIMARY KEY',
id_position INT COMMENT 'PRIMARY KEY' , 
name VARCHAR (25) NOT NULL COMMENT 'POSITION NAME' ,
action_name VARCHAR (50) COMMENT 'ACTION NAME',
table_name VARCHAR (50) COMMENT 'TABLE NAME',
user VARCHAR (50) COMMENT 'WHO EXECUTES THE SENTENCE DML',
date_insert DATE COMMENT 'EXACT TIME OF THE SENTENCE', 
PRIMARY KEY (id_lod)
);

-- -------------------------------------------------------------------------

DROP TABLE IF EXISTS carpio_47375.log_historic_position;
CREATE TABLE IF NOT EXISTS carpio_47375.log_historic_position
(
id_lod INT AUTO_INCREMENT COMMENT 'PRIMARY KEY',
action_name VARCHAR (50) COMMENT 'ACTION NAME',
table_name VARCHAR (50) COMMENT 'TABLE NAME',
user VARCHAR (50) COMMENT 'WHO EXECUTES THE SENTENCE DML',
old_name VARCHAR (50) COMMENT 'OLD FIELD',
new_name VARCHAR (50) COMMENT 'NEW FIELD',
date_update_insert DATE COMMENT 'EXACT TIME OF THE SENTENCE', 
PRIMARY KEY (id_lod)
);


-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 
-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 
-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 
-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 
-- TRIGGER TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER  TRIGGER 
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




-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
-- SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS
-- SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS SENTENCIAS


USE mysql ;

-- Crear un Usuario que tenga permiso de solo lectura sobre todas las tablas del esquema Carpio_47375


CREATE USER IF NOT EXISTS 'usuario1'@'localhost' identified by '47375'; -- USER AND PASSWORD CREATION


GRANT SELECT ON  carpio_47375.appointment  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE SCHEME CARPIO_47375 ABOUT THE APPOINTMENTS TABLE
GRANT SELECT ON  carpio_47375.customer TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEMA ON THE CUSTOMER TABLE
GRANT SELECT ON  carpio_47375.log_audit_position  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEME ABOUT THE AUDIT TABLE
GRANT SELECT ON  carpio_47375.log_historic_position  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE SCHEME CARPIO_47375 ABOUT THE HISTORY TABLE
GRANT SELECT ON  carpio_47375.payment  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEMA ON THE PAYMENT TABLE
GRANT SELECT ON  carpio_47375.payment_type  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEMA ON THE PAYMENT_TYPE TABLE
GRANT SELECT ON  carpio_47375.position  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEME ON THE POSITION TABLE
GRANT SELECT ON  carpio_47375.service  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEME ON THE SERVICE TABLE
GRANT SELECT ON  carpio_47375.worker  TO 'usuario1'@'localhost' ; -- READ PERMISSION IN THE CARPIO_47375 SCHEME ON THE WORKER TABLE


-- crear un usuario que tenga permiso de lectura, inserción y modificación sobre todas las tablas del esquema Carpio_47375 (SELECT, INSERT Y UPDATE)

CREATE USER IF NOT EXISTS 'usuario2'@'localhost' identified by '47375' ;  -- USER AND PASSWORD CREATION


GRANT SELECT , INSERT , UPDATE ON carpio_47375.appointment TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE appointment TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.customer TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE CUSTOMER TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.log_audit_position TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE log_audit_position TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.log_historic_position TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE log_historic_position TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.payment TO 'usuario2'@'localhost'  ; -- READ, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE PAYMENT TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.payment_type TO 'usuario2'@'localhost'  ; -- READ, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE PAYMENT_TYPE TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.position TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE POSITION TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.service TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE SERVICE TABLE
GRANT SELECT , INSERT , UPDATE ON carpio_47375.worker TO 'usuario2'@'localhost'  ; -- READING, INSERTION AND MODIFICATION PERMISSION IN THE SCHEME Carpio_47375 ON THE WORKER TABLE

-- ---------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------

/* SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE 
SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL
SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL SUBLENGUAJE TCL*/

-- ELIMINAR ALGUNOS REGISTROS INICIANDO PREVIAMENTE UNA TRANSACCION, EN LA LINEA SIGUIENTE DEJAR COMENTANDO ROLLBACK Y EN LA SIGUIENTE COMMIT
USE carpio_47375;

SET FOREIGN_KEY_CHECKS = 0;
SET @@AUTOCOMMIT = 0;

START TRANSACTION;

	DELETE FROM customer WHERE id_customer IN (1, 3, 5);
-- ROLLBACK
-- COMMIT

-- DATOS IMPORTANTES INSERTAR NUEVAMENTE

/* INSERT INTO customer VALUES (1,'13.938.227-7', 'Benix', 'Aravena', '78-04-21', 'F', '56995937221', 'San Bernardo, RM');
   INSERT INTO customer VALUES (3,'18.097.726-0', 'Romina', 'Neira', '90-02-02', 'F', '56991540141', 'La florida, RM');
   INSERT INTO customer VALUES (5,'25.705.371-7', 'Neudys', 'Moreno', '96-07-25', 'F', '56949557462', 'Vitacura, RM'); */


-- INSERTA 8 REGISTROS INICIANDO UNA TRANSACCION AGREGA UN SAVEPOINT A POSTERIOR DEL REGISTRO #4, AGREGA UNA LINEA COMENTADO DE ELIMINACION DEL SAVEPOINT DE LOS PRIMEROS 4 REGISTROS

	START TRANSACTION;
		INSERT INTO customer VALUES (17,'20.438.527-7', 'Maria', 'Puente', '80-04-02', 'F', '56995935695', 'Macul, RM');
		INSERT INTO customer VALUES (18,'21.095.746-0', 'Andrea', 'Escalona', '95-02-02', 'F', '569915408854', 'La Cisterna, RM');
		INSERT INTO customer VALUES (19,'27.755.371-7', 'Gissel', 'Mendoza', '85-07-21', 'F', '56949555871', 'Vitacura, RM'); 
		INSERT INTO customer VALUES (20,'27.455.527-7', 'Alejandra', 'Pietri', '83-04-25', 'F', '56995935874', 'Macul, RM');
	savepoint SP1;
		INSERT INTO customer VALUES (21,'18.044.746-0', 'Carolina', 'Espinoza', '96-02-03', 'F', '56991540632', 'La Cisterna, RM');
		INSERT INTO customer VALUES (22,'15.700.371-7', 'Fatima', 'Sotero', '95-07-02', 'F', '56949555632', 'Vitacura, RM'); 
		INSERT INTO customer VALUES (23,'18.000.527-7', 'Bernarda', 'Landinez', '89-04-06', 'F', '56995934100', 'Macul, RM');
		INSERT INTO customer VALUES (24,'19.111.746-0', 'Sofia', 'Rivas', '97-02-06', 'F', '56991540563', 'La Cisterna, RM');
	savepoint SP2;
RELEASE savepoint SP1; -- DELETE THE SAVEPOINT
COMMIT;