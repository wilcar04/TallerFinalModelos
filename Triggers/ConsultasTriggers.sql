DROP TRIGGER IF EXISTS auditoria_consultas_insert;
CREATE TRIGGER auditoria_consultas_insert
AFTER INSERT ON consultas
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente, medico)
VALUES ('consultas', 'Inserción', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = NEW.paciente_id limit 1), (SELECT nombre FROM medicos WHERE id = NEW.medico_id limit 1));

DROP TRIGGER IF EXISTS auditoria_consultas_delete;
CREATE TRIGGER auditoria_consultas_delete
AFTER DELETE ON consultas
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente, medico)
VALUES ('consultas', 'Eliminación', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = OLD.paciente_id limit 1), (SELECT nombre FROM medicos WHERE id = OLD.medico_id limit 1));

-- Trigger para modificaciones en la tabla consultas
DROP TRIGGER IF EXISTS auditoria_consultas_update;
CREATE TRIGGER auditoria_consultas_update
AFTER UPDATE ON consultas
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente, medico)
VALUES ('consultas', 'Modificación', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = NEW.paciente_id limit 1), (SELECT nombre FROM medicos WHERE id = NEW.medico_id limit 1));

INSERT INTO `salud_db`.`consultas`
(`paciente_id`,`medico_id`,`fecha_consulta`,`sintomas`,`diagnostico`,`tratamiento`)
VALUES
(1, 2, '2023-11-10', 'fiebre', 'dengue', 'descanso');

UPDATE consultas SET sintomas= "tos" WHERE id= 22;

DELETE from consultas where id = 22;

SELECT * FROM auditoria;
