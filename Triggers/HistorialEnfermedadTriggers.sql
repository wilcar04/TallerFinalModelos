DROP TRIGGER IF EXISTS auditoria_historial_insert;
CREATE TRIGGER auditoria_historial_insert
AFTER INSERT ON historial_enfermedades
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('historial_enfermedades', 'Inserción', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = NEW.paciente_id));

DROP TRIGGER IF EXISTS auditoria_historial_delete;
CREATE TRIGGER auditoria_historial_delete
AFTER DELETE ON historial_enfermedades
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('historial_enfermedades', 'Eliminación', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = OLD.paciente_id));

DROP TRIGGER IF EXISTS auditoria_historial_update;
CREATE TRIGGER auditoria_historial_update
AFTER UPDATE ON historial_enfermedades
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('historial_enfermedades', 'Modificación', CURRENT_USER(), (SELECT nombre FROM pacientes WHERE id = NEW.paciente_id));

INSERT INTO `salud_db`.`historial_enfermedades`
(`paciente_id`,`enfermedad`,`fecha_diagnostico`)
VALUES
(3, 'ela', '2023-10-07');

UPDATE historial_enfermedades SET enfermedad= "hidrocefalia" WHERE id= 9;

DELETE from historial_enfermedades where id = 9;

SELECT * FROM auditoria;
