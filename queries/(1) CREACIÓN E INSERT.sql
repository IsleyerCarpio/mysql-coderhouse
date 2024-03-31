DROP SCHEMA IF EXISTS carpio_47375;
create schema carpio_47375;
use carpio_47375;

-- CREACION DE TABLAS PARA TRIGGERS (LOG) 

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

--  ----------------------------------------

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
