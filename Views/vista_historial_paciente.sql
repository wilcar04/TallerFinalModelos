

DROP VIEW if exists vista_historial_paciente;
CREATE VIEW vista_historial_paciente AS
SELECT 
	p.id AS "Id del paciente",
	p.nombre AS "Nombre_del_paciente",
    c.sintomas AS "Sintomas",
    c.diagnostico AS "Diagnostico",
	c.tratamiento AS "Tratamiento", 
    m.nombre AS "Medico",
    group_concat(r.medicamento SEPARATOR ', ')  AS "Medicamentos",
    ifnull(group_concat(DISTINCT h.enfermedad SEPARATOR ', '), "no hay enfermedades") AS "Enfermedades diagnosticadas"
FROM 
	pacientes p
JOIN
	consultas c ON p.id = c.paciente_id
JOIN
	medicos m ON c.medico_id = m.id
    
LEFT JOIN
	recetas r ON c.id = r.consulta_id
LEFT JOIN
	historial_enfermedades h ON p.id = h.paciente_id
GROUP BY
	c.id    
;

SELECT * FROM vista_historial_paciente WHERE Nombre_del_paciente = "Juan";

	