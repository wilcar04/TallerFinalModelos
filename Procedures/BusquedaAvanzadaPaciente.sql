use salud_db;


drop procedure if exists BusquedaAvanzadaPaciente;

DELIMITER //

CREATE PROCEDURE BusquedaAvanzadaPaciente(identificacion INT(11))

BEGIN 
	SELECT * FROM pacientes p where p.id = identificacion;
END//

DELIMITER ;


call BusquedaAvanzadaPaciente(5);


