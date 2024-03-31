Use carpio_47375;

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
use carpio_47375;

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

