-- BLOQUE ACTUALIZACIONES
use suite_dotgital;
UPDATE aop_case_updates SET description = REPLACE(description, '"', '');
UPDATE aop_case_updates SET description = REPLACE(description, '*', '');
UPDATE aop_case_updates SET description = REPLACE(description, '<P>', '');
UPDATE aop_case_updates SET description = REPLACE(description, '<BR />', '');
UPDATE aop_case_updates SET description = REPLACE(description, '</P>', '');
UPDATE aop_case_updates SET description = UPPER(TRIM(description));
DELETE FROM aop_case_updates WHERE description = '';
DELETE FROM aop_case_updates WHERE name = 'this is a test 4';
DELETE FROM aop_case_updates WHERE description IN ('', '.', '<BR />', '123123123', 'notas', 'another note', 'note');
INSERT INTO gestion_equipo_legal.casos_actualizaciones (
    idcaso, creado, actualizacion, agente, esresultado
)
SELECT 
    c.case_number,
    a.date_entered,
    a.description,
    u.user_name,
    '0'
FROM aop_case_updates a
JOIN cases c ON c.id = a.case_id
JOIN users u ON u.id = a.created_by
JOIN gestion_equipo_legal.casos gcaso ON gcaso.id = c.case_number
ORDER BY a.date_entered;
use gestion_equipo_legal;
update casos_actualizaciones SET actualizacion = REPLACE(actualizacion, '<P>', '') WHERE actualizacion LIKE '%<P>%';
update casos_actualizaciones SET actualizacion = REPLACE(actualizacion, '</P>', '') WHERE actualizacion LIKE '%</P>%';
update casos_actualizaciones SET actualizacion = REPLACE(actualizacion, '<BR />', '') WHERE actualizacion LIKE '%<BR />%';