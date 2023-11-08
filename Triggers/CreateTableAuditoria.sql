use salud_db;

SELECT * FROM auditoria;

DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabla VARCHAR(50) NOT NULL,
    accion ENUM('Inserción', 'Eliminación', 'Modificación') NOT NULL,
    usuario VARCHAR(50),
    paciente VARCHAR(50),
    medico VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
