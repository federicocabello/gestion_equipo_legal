-- BLOQUE DE BENEFICIARIOS
use suite_dotgital;
INSERT INTO gestion_equipo_legal.beneficiarios (
    nombre, telefono1, telefono2, pertenecetel2, domicilio, ciudad, cp, relacion, cliente
)
SELECT
    CONCAT(TRIM(d_ben_beneficiary.first_name), ' ', TRIM(d_ben_beneficiary.last_name)),
    d_ben_beneficiary.phone_mobile,
    d_ben_beneficiary.phone_home,
    cases.case_number,
    d_ben_beneficiary.primary_address_street,
    d_ben_beneficiary.primary_address_city,
    d_ben_beneficiary.primary_address_postalcode,
    cases_cstm.beneficiary_relationship_c,
    '1'
FROM 
    suite_dotgital.cases_d_ben_beneficiary_1_c
JOIN 
    suite_dotgital.d_ben_beneficiary 
    ON d_ben_beneficiary.id = cases_d_ben_beneficiary_1_c.cases_d_ben_beneficiary_1d_ben_beneficiary_idb
JOIN 
    suite_dotgital.cases 
    ON cases.id = cases_d_ben_beneficiary_1_c.cases_d_ben_beneficiary_1cases_ida
JOIN 
    suite_dotgital.cases_cstm 
    ON cases_cstm.case_number_custom_c = cases.case_number;
use gestion_equipo_legal;
update beneficiarios SET nombre = UPPER(TRIM(nombre));
delete from beneficiarios where nombre = '' and id != 0;
DELETE FROM beneficiarios WHERE nombre = 'Cruz';
DELETE FROM beneficiarios WHERE nombre = 'Test Beneficiary';
DELETE FROM beneficiarios WHERE nombre = '1 1';
DELETE FROM beneficiarios WHERE nombre = '123123 123123';
DELETE FROM beneficiarios WHERE nombre = '231231 123123';
DELETE FROM beneficiarios WHERE nombre = '333333 33333';
DELETE FROM beneficiarios WHERE nombre = 'ahora si sr';
DELETE FROM beneficiarios WHERE nombre = 'anoter asdasd';
DELETE FROM beneficiarios WHERE nombre = 'Another Beneficiary TEST';
DELETE FROM beneficiarios WHERE nombre = 'another TEST';
DELETE FROM beneficiarios WHERE nombre = 'asads asfasfa';
DELETE FROM beneficiarios WHERE nombre = 'ascaasda asdasda';
DELETE FROM beneficiarios WHERE nombre = 'ascas ascasa';
DELETE FROM beneficiarios WHERE nombre = 'asdasd asdasd';
DELETE FROM beneficiarios WHERE nombre = 'asdasd dasdasd';
DELETE FROM beneficiarios WHERE nombre = 'asfdad asdasd';
DELETE FROM beneficiarios WHERE nombre = 'asxasxasxas asxasx';
DELETE FROM beneficiarios WHERE nombre = 'csdczdczsda scacads';
DELETE FROM beneficiarios WHERE nombre = 'fdafdad dasdas';
DELETE FROM beneficiarios WHERE nombre = 'Mrcel test';
DELETE FROM beneficiarios WHERE nombre = 'New pa';
DELETE FROM beneficiarios WHERE nombre = 'new related';
DELETE FROM beneficiarios WHERE nombre = 'new TEST';
DELETE FROM beneficiarios WHERE nombre = 'Nievo asdas';
DELETE FROM beneficiarios WHERE nombre = 'ONE MNORe';
DELETE FROM beneficiarios WHERE nombre = 'one more one more';
DELETE FROM beneficiarios WHERE nombre = 'qew qwe';
DELETE FROM beneficiarios WHERE nombre = 'qwdqwd qwdqwd';
DELETE FROM beneficiarios WHERE nombre = 'qwdqwdqdqw dqwdqwd';
DELETE FROM beneficiarios WHERE nombre = 'qwe qwe';
DELETE FROM beneficiarios WHERE nombre = 'qwe qwe';
DELETE FROM beneficiarios WHERE nombre = 'sdfsdf sdfdf';
DELETE FROM beneficiarios WHERE nombre = 'TAST TAST';
DELETE FROM beneficiarios WHERE nombre = 'TEST TEST';
DELETE FROM beneficiarios WHERE nombre = 'TEST TEST';
DELETE FROM beneficiarios WHERE nombre = 'TESTI TESTI';
DELETE FROM beneficiarios WHERE nombre = 'TIST TIST';
DELETE FROM beneficiarios WHERE nombre = 'TIST TIST';
DELETE FROM beneficiarios WHERE nombre = 'TOST TOST';
DELETE FROM beneficiarios WHERE nombre = 'TUST TUST';
DELETE FROM beneficiarios WHERE nombre = 'wer wer';
DELETE FROM beneficiarios WHERE nombre = 'www wwww';
DELETE FROM beneficiarios WHERE nombre = 'Marcel beneficiary';
DELETE FROM beneficiarios WHERE nombre = 'Marcel beneficiary test';
delete from beneficiarios where id IN (7, 228, 229, 1, 151, 165);
UPDATE beneficiarios b JOIN casos c ON b.pertenecetel2 = c.id SET b.cliente = c.idcliente;
UPDATE beneficiarios SET cliente = 1, pertenecetel2 = '' WHERE id = 0;
SET FOREIGN_KEY_CHECKS = 0;
delete from beneficiarios WHERE cliente = 1 AND pertenecetel2 != 10941 AND pertenecetel2 != 12751 AND pertenecetel2 != 11838;
SET FOREIGN_KEY_CHECKS = 1;
UPDATE beneficiarios SET telefono1 = REGEXP_REPLACE(telefono1, '[^0-9]', '');
UPDATE beneficiarios SET telefono2 = REGEXP_REPLACE(telefono2, '[^0-9]', '');
UPDATE beneficiarios SET cp = REGEXP_REPLACE(cp, '[^0-9]', '');
UPDATE beneficiarios SET pertenecetel2 = '';
UPDATE beneficiarios SET domicilio = UPPER(TRIM(domicilio));
UPDATE beneficiarios SET ciudad = UPPER(TRIM(ciudad));
UPDATE beneficiarios SET email = UPPER(TRIM(email));
UPDATE beneficiarios SET relacion = UPPER(TRIM(relacion));