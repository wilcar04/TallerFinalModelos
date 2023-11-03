use salud_db;

DELETE FROM recetas WHERE id > 8;
DELETE FROM consultas WHERE id > 4;

DROP procedure if exists CrearConsulta;

DELIMITER //
CREATE PROCEDURE CrearConsulta(id_paciente INT(11), id_medico INT(11), sintomas TEXT, diagnostico TEXT, tratamiento TEXT, 
	lista_medicamentos TEXT, lista_dosis TEXT, lista_indicaciones TEXT)

BEGIN
	DECLARE fecha_actual DATETIME;
    DECLARE valor_medicamentos TEXT;
    DECLARE valor_dosis TEXT;
    DECLARE valor_indicaciones TEXT;
    DECLARE contador INT;
    DECLARE consulta_id INT;
    DECLARE list_length INT;
    
    SET contador = 1;
    SET fecha_actual = NOW();
    
	INSERT INTO `salud_db`.`consultas` (`paciente_id`,`medico_id`,`fecha_consulta`,`sintomas`,`diagnostico`,`tratamiento`)
		VALUES (id_paciente, id_medico, fecha_actual, sintomas, diagnostico, tratamiento);
        
	SET consulta_id = LAST_INSERT_ID();
    SET list_length = (LENGTH(lista_medicamentos) - LENGTH( REPLACE ( lista_medicamentos, ";", "") ) ) / LENGTH(";");
    
	WHILE list_length+1 >= contador DO
		SET valor_medicamentos = REPLACE ( SUBSTRING_INDEX(lista_medicamentos, ';', contador), CONCAT(SUBSTRING_INDEX(lista_medicamentos, ';', contador-1), ";"), "") ;
        SET valor_dosis = REPLACE ( SUBSTRING_INDEX(lista_dosis, ';', contador), CONCAT(SUBSTRING_INDEX(lista_dosis, ';', contador-1), ";"), "") ;
        SET valor_indicaciones = REPLACE ( SUBSTRING_INDEX(lista_indicaciones, ';', contador), CONCAT(SUBSTRING_INDEX(lista_indicaciones, ';', contador-1), ";"), "") ;
        
		INSERT INTO `salud_db`.`recetas`(`consulta_id`,`medicamento`,`dosis`,`indicaciones`)
		VALUES (consulta_id, valor_medicamentos, valor_dosis, valor_indicaciones);
	
        SET contador = contador + 1;
	END WHILE;
    
END//

CALL CrearConsulta(1, 1, 'TOS', 'GRIPA', 'SE DEBE TOMAR IBUPROFENO 200 MG Y ACETAMINOFEN', 'IBUPROFENO;ACETAMINOFEN', '200 MG;100 ML', 'EN LA MAÑANA;EN LA NOCHE');

SELECT * FROM consultas;
SELECT * FROM recetas;

