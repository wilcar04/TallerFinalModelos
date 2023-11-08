use salud_db;

DELETE FROM historial_enfermedades WHERE id > 5;
drop procedure if exists CrearHistorialEnfermedades;

DELIMITER //
CREATE PROCEDURE CrearHistorialEnfermedades(listaEnfermedades TEXT, idPaciente INT)
BEGIN
	DECLARE contador INT;
    DECLARE fecha_actual date;
    DECLARE list_length INT;
    DECLARE enfermedad VARCHAR(100);
    
    SET fecha_actual = NOW();
    SET list_length = (LENGTH(listaEnfermedades) - LENGTH( REPLACE ( listaEnfermedades, ",", "") ) ) / LENGTH(",");
    
    SET contador = 1;
    
    WHILE list_length + 1 >= contador DO
		SET enfermedad = REPLACE ( SUBSTRING_INDEX(listaEnfermedades, ',', contador), CONCAT(SUBSTRING_INDEX(listaEnfermedades, ',', contador-1), ","), "") ;
        
        INSERT INTO `salud_db`.`historial_enfermedades`
		(`paciente_id`,
		`enfermedad`,
		`fecha_diagnostico`)
		VALUES
		(idPaciente,
		enfermedad,
		fecha_actual);
        
        SET contador = contador + 1;
    END WHILE;
END //

CALL CrearHistorialEnfermedades("Leucemia,Hepatitis,Cáncer", 2);
SELECT * FROM historial_enfermedades;