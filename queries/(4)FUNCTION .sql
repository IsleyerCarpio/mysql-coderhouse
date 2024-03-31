use carpio_47375;

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
