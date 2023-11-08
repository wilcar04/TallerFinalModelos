DROP TRIGGER IF EXISTS auditoria_pacientes_insert;
CREATE TRIGGER auditoria_pacientes_insert
AFTER INSERT ON pacientes
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('pacientes', 'Inserción', CURRENT_USER(), NEW.nombre);

DROP TRIGGER IF EXISTS auditoria_pacientes_delete;
CREATE TRIGGER auditoria_pacientes_delete
AFTER DELETE ON pacientes
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('pacientes', 'Eliminación', CURRENT_USER(), OLD.nombre);

DROP TRIGGER IF EXISTS auditoria_pacientes_update;
CREATE TRIGGER auditoria_pacientes_update
AFTER UPDATE ON pacientes
FOR EACH ROW
INSERT INTO auditoria (tabla, accion, usuario, paciente)
VALUES ('pacientes', 'Modificación', CURRENT_USER(), NEW.nombre);

INSERT INTO `salud_db`.`pacientes`
(`nombre`,`apellido`,`fecha_nacimiento`,`genero`,`direccion`,`telefono`)
VALUES
("Catalina","Sanchez","1999-09-19","Femenino","Calle 90 #45-87","345678898");

UPDATE pacientes SET nombre= "Juana" WHERE id= 22;

DELETE from pacientes where id = 22;

SELECT * FROM auditoria;
