use salud_db;


drop procedure if exists CrearPaciente;

DELIMITER //

CREATE PROCEDURE CrearPaciente(nombre varchar(50), apellido varchar(50) , fecha_nacimiento DATE, genero VARCHAR(10), direccion VARCHAR(100), telefono varchar(15))

BEGIN 
	INSERT INTO pacientes(`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`direccion`,`telefono`)
    VALUES (nombre, apellido, fecha_nacimiento, genero, direccion, telefono);
END//

DELIMITER ;


call CrearPaciente("william","carreño","2003-10-03","masculino","los molinos", "3105443212");


SELECT * FROM pacientes;
