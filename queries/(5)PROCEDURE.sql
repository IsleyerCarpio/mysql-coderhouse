use carpio_47375;

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
