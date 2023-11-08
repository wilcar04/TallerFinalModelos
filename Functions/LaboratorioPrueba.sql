use salud_db;

DROP FUNCTION IF EXISTS LaboratorioPrueba;
DELIMITER //
CREATE FUNCTION LaboratorioPrueba(paciente_id INT) 
RETURNS VARCHAR(100)
BEGIN
    DECLARE nombre_laboratorio VARCHAR(100);
    
    select l.nombre INTO nombre_laboratorio
    from pruebas_laboratorio pl
    inner join laboratorios l ON pl.laboratorio_id = l.id
    where pl.paciente_id = paciente_id
    order by pl.fecha_prueba DESC limit 1;
    
    return nombre_laboratorio;
END //

DELIMITER ;

SELECT LaboratorioPrueba(2);

