use salud_db;

DROP VIEW if exists Reporte_Examen;
CREATE VIEW Reporte_Examen AS
select 
	tipo_prueba AS Tipo_examen,
    COUNT(*)/ (SELECT COUNT(*) FROM pruebas_laboratorio) * 100 AS Porcentaje,
    group_concat(laboratorios.nombre SEPARATOR ', ') AS Nombre_de_laboratorio
    
FROM
	pruebas_laboratorio

JOIN 
	laboratorios ON pruebas_laboratorio.laboratorio_id = laboratorios.id
    
GROUP BY
	tipo_prueba
ORDER BY
	porcentaje DESC;
    
SELECT * FROM Reporte_Examen;