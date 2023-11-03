
drop procedure if exists CrearMedico;

DELIMITER //

CREATE PROCEDURE CrearMedico(nombre varchar(50), especialidad varchar(50), telefono varchar(15), email varchar(100), contrasena varchar(50))

BEGIN 
	INSERT INTO medicos(`nombre`, `especialidad`, `telefono`, `email`, `password`)
    VALUES (nombre, especialidad, telefono, email, contrasena);
END//

DELIMITER ;

call CrearMedico("Dr. Fernandez","Cardiologia","3165477927","nels21gmail.com","nelson189");

SELECT * FROM medicos;


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
