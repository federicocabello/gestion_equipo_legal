-- MIGRACIÓN DE DOCUMENTOS YA HABERLOS AGREGADO
use suite_dotgital;
update document_revisions SET filename = REPLACE(filename, file_ext, '');
UPDATE document_revisions SET filename = TRIM(filename);
DELETE from document_revisions WHERE filename is null;
select document_revisions.id, cases.case_number, CONCAT(document_revisions.filename,document_revisions.file_ext) AS nombredoc, document_revisions.file_mime_type, users.user_name, document_revisions.date_entered FROM documents_cases JOIN documents ON documents.id=documents_cases.document_id JOIN document_revisions ON document_revisions.id=documents.document_revision_id JOIN cases ON cases.id=documents_cases.case_id JOIN users ON users.id=documents.created_by WHERE document_revisions.deleted = 0 order by document_revisions.date_entered;
use gestion_equipo_legal;
SET SQL_SAFE_UPDATES = 0;
SET SESSION net_read_timeout = 900;
SET SESSION net_write_timeout = 900;
SET SESSION wait_timeout = 900;
SET SESSION interactive_timeout = 900;
SET GLOBAL max_allowed_packet = 1073741824;
SET GLOBAL net_buffer_length = 1048576;
SET SESSION MAX_EXECUTION_TIME=600000;

DROP TABLE IF EXISTS gestion_equipo_legal.documentos_normalizados;

CREATE TABLE gestion_equipo_legal.documentos_normalizados (
    nombre VARCHAR(255) PRIMARY KEY,
    caso VARCHAR(255),
    nombre_final VARCHAR(255),
    tipo VARCHAR(255),
    fecha DATETIME,
    creador VARCHAR(255)
);

INSERT INTO gestion_equipo_legal.documentos_normalizados
SELECT 
    rev.id AS nombre,
    c.case_number AS caso,
    CONCAT(rev.filename, rev.file_ext) AS nombre_final,
    rev.file_mime_type AS tipo,
    rev.date_entered AS fecha,
    u.user_name AS creador
FROM suite_dotgital.document_revisions rev
JOIN suite_dotgital.documents doc ON doc.document_revision_id = rev.id
JOIN suite_dotgital.documents_cases dc ON dc.document_id = doc.id
JOIN suite_dotgital.cases c ON c.id = dc.case_id
JOIN suite_dotgital.users u ON u.id = doc.created_by
WHERE rev.deleted = 0
GROUP BY rev.id;

-- DROP INDEX idx_nombre_documentos ON gestion_equipo_legal.documentos;
CREATE INDEX idx_nombre_documentos ON gestion_equipo_legal.documentos(nombre(191));
-- DROP INDEX idx_nombre_documentos_2 ON gestion_equipo_legal.documentos;

-- BLOQUE 1 - 4000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 1 AND 4000;

-- BLOQUE 4001 - 8000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 4001 AND 8000;

-- BLOQUE 8001 - 12000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 8001 AND 12000;

-- BLOQUE 12001 - 16000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 12001 AND 16000;

-- BLOQUE 16001 - 20000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 16001 AND 20000;

-- BLOQUE 20001 - 24000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 20001 AND 24000;

-- BLOQUE 24001 - 28000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 24001 AND 28000;

-- BLOQUE 28001 - 32000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 28001 AND 32000;

-- BLOQUE 32001 - 36000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 32001 AND 36000;

-- BLOQUE 36001 - 40000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 36001 AND 40000;

-- BLOQUE 40001 - 44000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 40001 AND 44000;

-- BLOQUE 44001 - 48000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 44001 AND 48000;

-- BLOQUE 48001 - 52000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 48001 AND 52000;

-- BLOQUE 52001 - 56000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 52001 AND 56000;

-- BLOQUE 56001 - 60000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 56001 AND 60000;

-- BLOQUE 60001 - 64000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 60001 AND 64000;

-- BLOQUE 64001 - 68000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 64001 AND 68000;

-- BLOQUE 68001 - 72000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 68001 AND 72000;

-- BLOQUE 72001 - 76000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 72001 AND 76000;

-- BLOQUE 76001 - 80000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 76001 AND 80000;

-- BLOQUE 80001 - 84000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 80001 AND 84000;

-- BLOQUE 84001 - 88000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 84001 AND 88000;

-- BLOQUE 88001 - 92000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 88001 AND 92000;

-- BLOQUE 92001 - 96000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 92001 AND 96000;

-- BLOQUE 96001 - 100000
UPDATE gestion_equipo_legal.documentos d
JOIN gestion_equipo_legal.documentos_normalizados dn 
    ON CONVERT(d.nombre USING utf8mb4) COLLATE utf8mb4_general_ci = CONVERT(dn.nombre USING utf8mb4) COLLATE utf8mb4_general_ci
JOIN gestion_equipo_legal.casos c 
    ON c.id = dn.caso
SET 
    d.caso = dn.caso,
    d.nombre = dn.nombre_final,
    d.tipo = dn.tipo,
    d.fecha = dn.fecha,
    d.creador = dn.creador
WHERE d.id BETWEEN 96001 AND 100000;

DELETE FROM documentos WHERE tipo = '';

UPDATE documentos d JOIN casos c ON d.caso = c.id SET d.cliente = c.idcliente;

DROP TABLE IF EXISTS documentos_normalizados