use salud_db;

DROP FUNCTION IF EXISTS NombreEnfermedadComun;
DELIMITER //
CREATE FUNCTION NombreEnfermedadComun()
RETURNS VARCHAR(100)
BEGIN
	DECLARE nombre_enfermedad VARCHAR(100);
    
    select enfermedad into nombre_enfermedad
    from historial_enfermedades
    group by enfermedad
    order by COUNT(*) desc limit 1;
    
    RETURN nombre_enfermedad;
END //

DROP FUNCTION IF EXISTS PorcentajeEnfermedadComun;
DELIMITER //

CREATE FUNCTION PorcentajeEnfermedadComun() 
RETURNS FLOAT

BEGIN

    DECLARE porcentaje FLOAT;
    DECLARE contador_enfermedad FLOAT;    #Numero de veces que aparece una enfermedad en la tabla
    DECLARE total_enfermedades FLOAT;

    select COUNT(*) into total_enfermedades
    from historial_enfermedades;
    
    select COUNT(*) into contador_enfermedad
    from historial_enfermedades
    group by enfermedad
    order by COUNT(*) desc limit 1;
    
    SET porcentaje = (contador_enfermedad / total_enfermedades) * 100;
    
    RETURN porcentaje;

END //

SELECT NombreEnfermedadComun(), PorcentajeEnfermedadComun();