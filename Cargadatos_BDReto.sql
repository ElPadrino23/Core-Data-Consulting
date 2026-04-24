--  CARGA DE DATOS


--  1. sofom
INSERT INTO sofom (id_sofom, nombre, rfc, dns_exclusivo, fecha_registro, activa)
VALUES
(1, 'SVA LAW SOFOM E.N.R.', 'SVA900101AB1', 'sva.law', DATE '2026-03-25', TRUE);


--  2. sucursal
INSERT INTO sucursal (id_sucursal, id_sofom, nombre_sucursal, tipo, activa)
VALUES
(1,  1, 'Sucursal Querétaro Centro',   'MATRIZ',   TRUE),
(2,  1, 'Sucursal Juriquilla',          'REGIONAL', TRUE),
(3,  1, 'Sucursal Centro Sur',          'AGENCIA',  TRUE),
(4,  1, 'Sucursal Antea',               'AGENCIA',  TRUE),
(5,  1, 'Sucursal Corregidora',         'REGIONAL', TRUE),
(6,  1, 'Sucursal Reforma',             'REGIONAL', TRUE),
(7,  1, 'Sucursal Polanco',             'AGENCIA',  TRUE),
(8,  1, 'Sucursal Coyoacán',            'AGENCIA',  TRUE),
(9,  1, 'Sucursal Santa Fe',            'REGIONAL', TRUE),
(10, 1, 'Portal Digital Nacional',      'DIGITAL',  TRUE);


--  3. rol
INSERT INTO rol (id_rol, nombre_rol, descripcion, permisos_json)
VALUES
(1, 'Administrador',
 'Usuario con control total de configuración, usuarios y reglas del sistema.',
 '{"usuarios": true, "clientes": true, "documentos": true, "operaciones": true, "alertas": true, "reportes": true, "auditoria": true, "configuracion": true}'),
(2, 'Oficial de Cumplimiento',
 'Usuario responsable de revisar alertas, validar expedientes y generar reportes regulatorios.',
 '{"usuarios": false, "clientes": true, "documentos": true, "operaciones": true, "alertas": true, "reportes": true, "auditoria": true, "configuracion": false}'),
(3, 'Analista',
 'Usuario operativo que registra clientes, contratos y operaciones.',
 '{"usuarios": false, "clientes": true, "documentos": true, "operaciones": true, "alertas": false, "reportes": false, "auditoria": false, "configuracion": false}'),
(4, 'Auditor',
 'Usuario de solo lectura con acceso a trazabilidad, clientes, operaciones y reportes sin permiso de modificación.',
 '{"usuarios": false, "clientes": true, "documentos": true, "operaciones": true, "alertas": true, "reportes": true, "auditoria": true, "configuracion": false, "solo_lectura": true}'),
(5, 'Capturista Operativo',
 'Usuario que apoya con carga de expedientes KYC y carga de transacciones provenientes de API o CSV.',
 '{"usuarios": false, "clientes": true, "documentos": true, "operaciones": true, "alertas": false, "reportes": false, "auditoria": false, "configuracion": false}');


--  4. tipo_documento
INSERT INTO tipo_documento (id_tipo_doc, id_sofom, nombre_tipo, descripcion, obligatorio)
VALUES
(1,  1, 'Identificación oficial',        'INE o pasaporte vigente para validar identidad.',                          TRUE),
(2,  1, 'Comprobante de domicilio',       'Recibo de servicio o estado de cuenta con antigüedad no mayor a 3 meses.',TRUE),
(3,  1, 'Constancia de situación fiscal', 'Documento fiscal emitido por el SAT con RFC y homoclave.',                TRUE),
(4,  1, 'CURP',                           'Clave Única de Registro de Población del cliente persona física.',         FALSE),
(5,  1, 'Acta constitutiva',              'Documento notariado de constitución para clientes persona moral.',         FALSE),
(6,  1, 'Poder notarial',                 'Documento para acreditar facultades del representante legal.',             FALSE),
(7,  1, 'Estado de cuenta bancario',      'Últimos 3 estados de cuenta para validar cuenta y domicilio.',            FALSE),
(8,  1, 'Opinión de cumplimiento SAT',    'Opinión positiva o vigente emitida por el SAT.',                          FALSE),
(9,  1, 'Contrato firmado',               'Contrato principal firmado por el cliente y la SOFOM.',                   FALSE),
(10, 1, 'Formato KYC',                    'Formato interno de conocimiento del cliente llenado al momento del alta.', TRUE);


--  5. usuario
INSERT INTO usuario (id_usuario, nombre, apellido, email, id_rol, fecha_alta, activo)
VALUES
(1,  'Mariana',   'Salgado Vázquez',     'mariana.salgado@sva.law',     1, '2026-03-25 08:00:00-06', TRUE),
(2,  'Ricardo',   'Mendoza Pedraza',     'ricardo.mendoza@sva.law',     2, '2026-03-25 08:10:00-06', TRUE),
(3,  'Paola',     'Vega Contreras',      'paola.vega@sva.law',          2, '2026-03-25 08:20:00-06', TRUE),
(4,  'Javier',    'Téllez Domínguez',    'javier.tellez@sva.law',       2, '2026-03-25 08:30:00-06', TRUE),
(5,  'Andrea',    'Luna Espinoza',       'andrea.luna@sva.law',         3, '2026-03-25 08:40:00-06', TRUE),
(6,  'Carlos',    'Ortega Salinas',      'carlos.ortega@sva.law',       3, '2026-03-25 08:50:00-06', TRUE),
(7,  'Diana',     'Paredes Montoya',     'diana.paredes@sva.law',       3, '2026-03-25 09:00:00-06', TRUE),
(8,  'Fernando',  'Ríos Castellanos',    'fernando.rios@sva.law',       3, '2026-03-25 09:10:00-06', TRUE),
(9,  'Gabriela',  'Nava Guerrero',       'gabriela.nava@sva.law',       3, '2026-03-25 09:20:00-06', TRUE),
(10, 'Héctor',    'Campos Ibáñez',       'hector.campos@sva.law',       3, '2026-03-25 09:30:00-06', TRUE),
(11, 'Ivanna',    'Solís Bracamontes',   'ivanna.solis@sva.law',        3, '2026-03-25 09:40:00-06', TRUE),
(12, 'José',      'Miranda Villanueva',  'jose.miranda@sva.law',        3, '2026-03-25 09:50:00-06', TRUE),
(13, 'Karen',     'Zamora Fuentes',      'karen.zamora@sva.law',        4, '2026-03-25 10:00:00-06', TRUE),
(14, 'Luis',      'Bautista Treviño',    'luis.bautista@sva.law',       4, '2026-03-25 10:10:00-06', TRUE),
(15, 'Mónica',    'Trejo Alvarado',      'monica.trejo@sva.law',        4, '2026-03-25 10:20:00-06', TRUE),
(16, 'Néstor',    'Beltrán Esquivel',    'nestor.beltran@sva.law',      4, '2026-03-25 10:30:00-06', TRUE),
(17, 'Olga',      'Fuentes Herrera',     'olga.fuentes@sva.law',        5, '2026-03-25 10:40:00-06', TRUE),
(18, 'Pablo',     'Serrano Mendizábal',  'pablo.serrano@sva.law',       5, '2026-03-25 10:50:00-06', TRUE),
(19, 'Renata',    'Mejía Castillo',      'renata.mejia@sva.law',        5, '2026-03-25 11:00:00-06', TRUE),
(20, 'Sergio',    'Castañeda Lozano',    'sergio.castaneda@sva.law',    5, '2026-03-25 11:10:00-06', TRUE);


--  6. cliente
INSERT INTO cliente (id_cliente, nombre_razon_social, tipo_persona, rfc, curp, nacionalidad, es_pep, estatus, id_analista, fecha_alta)
VALUES
(1,  'Juan Manuel García López',                                'FISICA', 'GALJ850315Q12', 'GALJ850315HDFLRN08', 'Mexicana', FALSE, 'ACTIVO',   5,  '2026-04-01 09:00:00-06'),
(2,  'María Fernanda Torres Ruiz',                              'FISICA', 'TORM900822K45', 'TORM900822MQTRRZ04', 'Mexicana', FALSE, 'ACTIVO',   6,  '2026-04-01 09:10:00-06'),
(3,  'Alberto Sánchez Vera',                                    'FISICA', 'SAVA881201P31', 'SAVA881201HDFNLR07', 'Mexicana', TRUE,  'ACTIVO',   7,  '2026-04-01 09:20:00-06'),
(4,  'Lucía Hernández Mejía',                                   'FISICA', 'HEML920714A77', 'HEML920714MQTRCC06', 'Mexicana', FALSE, 'ACTIVO',   8,  '2026-04-01 09:30:00-06'),
(5,  'Carlos Eduardo Flores Díaz',                              'FISICA', 'FODC870511C90', 'FODC870511HQTLZR02', 'Mexicana', FALSE, 'ACTIVO',   9,  '2026-04-01 09:40:00-06'),
(6,  'Gabriela Pérez Navarro',                                  'FISICA', 'PENG930902D61', 'PENG930902MDFRVB03', 'Mexicana', FALSE, 'ACTIVO',   10, '2026-04-01 09:50:00-06'),
(7,  'Hugo Ramírez Molina',                                     'FISICA', 'RAMH860118L15', 'RAMH860118HQTMGL09', 'Mexicana', FALSE, 'ACTIVO',   11, '2026-04-01 10:00:00-06'),
(8,  'Valeria Castillo Reyes',                                  'FISICA', 'CARV950623M84', 'CARV950623MQTSYL05', 'Mexicana', FALSE, 'ACTIVO',   12, '2026-04-01 10:10:00-06'),
(9,  'Distribuciones del Bajío S.A. de C.V.',                   'MORAL',  'DBA1203148J2',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   5,  '2026-04-01 10:20:00-06'),
(10, 'Servicios Financieros Queretanos S.A.P.I. de C.V.',       'MORAL',  'SFQ140928TR6',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   6,  '2026-04-01 10:30:00-06'),
(11, 'Comercializadora Centro Histórico S. de R.L. de C.V.',    'MORAL',  'CCH160505NX1',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   7,  '2026-04-01 10:40:00-06'),
(12, 'Tecnologías Urbanas de México S.A. de C.V.',              'MORAL',  'TUM180901PU4',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   8,  '2026-04-01 10:50:00-06'),
(13, 'Inmobiliaria Corregidora S.A. de C.V.',                   'MORAL',  'ICO1502129L8',  NULL,                 'Mexicana', TRUE,  'ACTIVO',   9,  '2026-04-01 11:00:00-06'),
(14, 'Consultoría Jurídica Metropolitana S.C.',                 'MORAL',  'CJM171103B20',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   10, '2026-04-01 11:10:00-06'),
(15, 'Pedro Antonio Morales Cruz',                              'FISICA', 'MOCP840430R66', 'MOCP840430HDFRRL01', 'Mexicana', FALSE, 'ACTIVO',   11, '2026-04-01 11:20:00-06'),
(16, 'Sofía Guadalupe León Pérez',                              'FISICA', 'LEPS970112U71', 'LEPS970112MQTNRF00', 'Mexicana', FALSE, 'ACTIVO',   12, '2026-04-01 11:30:00-06'),
(17, 'Miguel Ángel Cortés Salinas',                             'FISICA', 'COSM890707H54', 'COSM890707HDFRLG04', 'Mexicana', FALSE, 'INACTIVO', 5,  '2026-04-01 11:40:00-06'),
(18, 'Grupo Logístico Capital S.A. de C.V.',                    'MORAL',  'GLC190321FZ5',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   6,  '2026-04-01 11:50:00-06'),
(19, 'Ana Karen Domínguez Soto',                                'FISICA', 'DOSA910215N83', 'DOSA910215MQTMNT02', 'Mexicana', FALSE, 'BLOQUEADO',7,  '2026-04-01 12:00:00-06'),
(20, 'Operadora Comercial Alameda S.A. de C.V.',                'MORAL',  'OCA200610GK7',  NULL,                 'Mexicana', FALSE, 'ACTIVO',   8,  '2026-04-01 12:10:00-06');


--  7. domicilio
INSERT INTO domicilio (id_domicilio, id_cliente, calle, colonia, ciudad, estado, pais, tipo_domicilio, id_sucursal)
VALUES
(1,  1,  'Av. Constituyentes 120',        'Centro',               'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 1),
(2,  2,  'Calle Hidalgo 45',              'Arquitos',             'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 1),
(3,  3,  'Blvd. Bernardo Quintana 560',   'Carretas',             'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 2),
(4,  4,  'Av. Universidad 310',           'Centro',               'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 3),
(5,  5,  'Calle 5 de Mayo 178',           'El Pueblito',          'Corregidora',      'Querétaro',        'México', 'PARTICULAR', 5),
(6,  6,  'Av. Zaragoza 990',              'Centro Histórico',     'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 1),
(7,  7,  'Paseo de la República 1420',    'Juriquilla',           'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 2),
(8,  8,  'Camino Real 88',                'Milenio III',          'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 4),
(9,  9,  'Av. Tecnológico 245',           'Centro Sur',           'Querétaro',        'Querétaro',        'México', 'COMERCIAL',  3),
(10, 10, 'Av. Paseo Constituyentes 890',  'El Jacal',             'Querétaro',        'Querétaro',        'México', 'COMERCIAL',  5),
(11, 11, 'República de Uruguay 41',       'Centro',               'Cuauhtémoc',       'Ciudad de México', 'México', 'COMERCIAL',  6),
(12, 12, 'Av. Santa Fe 410',              'Santa Fe',             'Álvaro Obregón',   'Ciudad de México', 'México', 'COMERCIAL',  9),
(13, 13, 'Av. Insurgentes Sur 1210',      'Del Valle',            'Benito Juárez',    'Ciudad de México', 'México', 'FISCAL',     6),
(14, 14, 'Av. Universidad 1500',          'Coyoacán',             'Coyoacán',         'Ciudad de México', 'México', 'COMERCIAL',  8),
(15, 15, 'Calle Madero 64',               'Centro',               'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 1),
(16, 16, 'Av. Pie de la Cuesta 240',      'Desarrollo San Pablo', 'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 3),
(17, 17, 'Calle Allende 39',              'San Francisquito',     'Querétaro',        'Querétaro',        'México', 'PARTICULAR', 1),
(18, 18, 'Calz. de Tlalpan 820',          'Portales',             'Benito Juárez',    'Ciudad de México', 'México', 'COMERCIAL',  8),
(19, 19, 'Av. Candiles 515',              'Candiles',             'Corregidora',      'Querétaro',        'México', 'PARTICULAR', 5),
(20, 20, 'Av. Juárez 205',                'Centro',               'Cuauhtémoc',       'Ciudad de México', 'México', 'COMERCIAL',  7);


--  8. documento
INSERT INTO documento (id_documento, id_cliente, id_tipo_doc, ruta_archivo, estatus, id_validador, fecha_carga)
VALUES
(1,  1,  1,  '/docs/clientes/1/ine_garcia_lopez.pdf',              'APROBADO',  3, '2026-04-02 09:00:00-06'),
(2,  1,  2,  '/docs/clientes/1/compdomicilio_garcia_lopez.pdf',    'APROBADO',  3, '2026-04-02 09:30:00-06'),
(3,  2,  1,  '/docs/clientes/2/ine_torres_ruiz.pdf',               'APROBADO',  4, '2026-04-02 10:00:00-06'),
(4,  2,  2,  '/docs/clientes/2/compdomicilio_torres_ruiz.pdf',     'APROBADO',  4, '2026-04-02 10:30:00-06'),
(5,  3,  1,  '/docs/clientes/3/ine_sanchez_vera.pdf',              'APROBADO',  2, '2026-04-02 11:00:00-06'),
(6,  3,  10, '/docs/clientes/3/kyc_sanchez_vera.pdf',              'APROBADO',  2, '2026-04-02 11:30:00-06'),
(7,  4,  1,  '/docs/clientes/4/ine_hernandez_mejia.pdf',           'RECHAZADO', 3, '2026-04-02 12:00:00-06'),
(8,  4,  2,  '/docs/clientes/4/compdomicilio_hernandez_mejia.pdf', 'PENDIENTE', 3, '2026-04-02 12:30:00-06'),
(9,  5,  1,  '/docs/clientes/5/ine_flores_diaz.pdf',               'APROBADO',  4, '2026-04-02 13:00:00-06'),
(10, 5,  2,  '/docs/clientes/5/compdomicilio_flores_diaz.pdf',     'APROBADO',  4, '2026-04-02 13:30:00-06'),
(11, 6,  1,  '/docs/clientes/6/ine_perez_navarro.pdf',             'APROBADO',  2, '2026-04-03 09:00:00-06'),
(12, 6,  2,  '/docs/clientes/6/compdomicilio_perez_navarro.pdf',   'APROBADO',  2, '2026-04-03 09:30:00-06'),
(13, 7,  1,  '/docs/clientes/7/ine_ramirez_molina.pdf',            'APROBADO',  3, '2026-04-03 10:00:00-06'),
(14, 7,  2,  '/docs/clientes/7/compdomicilio_ramirez_molina.pdf',  'VENCIDO',   3, '2026-04-03 10:30:00-06'),
(15, 8,  1,  '/docs/clientes/8/ine_castillo_reyes.pdf',            'APROBADO',  4, '2026-04-03 11:00:00-06'),
(16, 8,  2,  '/docs/clientes/8/compdomicilio_castillo_reyes.pdf',  'APROBADO',  4, '2026-04-03 11:30:00-06'),
(17, 9,  5,  '/docs/clientes/9/acta_distribuciones_bajio.pdf',     'APROBADO',  2, '2026-04-03 12:00:00-06'),
(18, 9,  6,  '/docs/clientes/9/poder_distribuciones_bajio.pdf',    'APROBADO',  2, '2026-04-03 12:30:00-06'),
(19, 10, 5,  '/docs/clientes/10/acta_sfq.pdf',                     'RECHAZADO', 3, '2026-04-03 13:00:00-06'),
(20, 10, 10, '/docs/clientes/10/kyc_sfq.pdf',                      'PENDIENTE', 3, '2026-04-03 13:30:00-06'),
(21, 11, 5,  '/docs/clientes/11/acta_comercializadora.pdf',        'APROBADO',  4, '2026-04-04 09:00:00-06'),
(22, 11, 9,  '/docs/clientes/11/contrato_comercializadora.pdf',    'APROBADO',  4, '2026-04-04 09:30:00-06'),
(23, 12, 5,  '/docs/clientes/12/acta_tecnologias_urbanas.pdf',     'APROBADO',  2, '2026-04-04 10:00:00-06'),
(24, 12, 8,  '/docs/clientes/12/opinion_sat_tecnologias.pdf',      'APROBADO',  2, '2026-04-04 10:30:00-06'),
(25, 13, 5,  '/docs/clientes/13/acta_inmobiliaria_corregidora.pdf','APROBADO',  3, '2026-04-04 11:00:00-06'),
(26, 13, 6,  '/docs/clientes/13/poder_inmobiliaria_corregidora.pdf','APROBADO', 3, '2026-04-04 11:30:00-06'),
(27, 14, 5,  '/docs/clientes/14/acta_consultoria_juridica.pdf',    'APROBADO',  4, '2026-04-04 12:00:00-06'),
(28, 14, 9,  '/docs/clientes/14/contrato_consultoria_juridica.pdf','VENCIDO',   4, '2026-04-04 12:30:00-06'),
(29, 15, 1,  '/docs/clientes/15/ine_morales_cruz.pdf',             'APROBADO',  2, '2026-04-04 13:00:00-06'),
(30, 15, 10, '/docs/clientes/15/kyc_morales_cruz.pdf',             'APROBADO',  2, '2026-04-04 13:30:00-06'),
(31, 16, 1,  '/docs/clientes/16/ine_leon_perez.pdf',               'APROBADO',  3, '2026-04-05 09:00:00-06'),
(32, 16, 2,  '/docs/clientes/16/compdomicilio_leon_perez.pdf',     'APROBADO',  3, '2026-04-05 09:30:00-06'),
(33, 17, 1,  '/docs/clientes/17/ine_cortes_salinas.pdf',           'RECHAZADO', 4, '2026-04-05 10:00:00-06'),
(34, 17, 2,  '/docs/clientes/17/compdomicilio_cortes_salinas.pdf', 'PENDIENTE', 4, '2026-04-05 10:30:00-06'),
(35, 18, 5,  '/docs/clientes/18/acta_grupo_logistico.pdf',         'APROBADO',  2, '2026-04-05 11:00:00-06'),
(36, 18, 8,  '/docs/clientes/18/opinion_sat_grupo_logistico.pdf',  'APROBADO',  2, '2026-04-05 11:30:00-06'),
(37, 19, 1,  '/docs/clientes/19/ine_dominguez_soto.pdf',           'APROBADO',  3, '2026-04-05 12:00:00-06'),
(38, 19, 10, '/docs/clientes/19/kyc_dominguez_soto.pdf',           'APROBADO',  3, '2026-04-05 12:30:00-06'),
(39, 20, 5,  '/docs/clientes/20/acta_operadora_alameda.pdf',       'APROBADO',  4, '2026-04-05 13:00:00-06'),
(40, 20, 9,  '/docs/clientes/20/contrato_operadora_alameda.pdf',   'PENDIENTE', 4, '2026-04-05 13:30:00-06');


--  9. contrato
INSERT INTO contrato (id_contrato, id_cliente, numero_contrato, tipo_producto, fecha_inicio, estatus, id_analista)
VALUES
(1,  1,  'CTR-2026-0001', 'Crédito personal',          '2026-01-05', 'VIGENTE',    5),
(2,  2,  'CTR-2026-0002', 'Crédito pyme',               '2026-01-08', 'VIGENTE',    6),
(3,  3,  'CTR-2026-0003', 'Factoraje',                  '2026-01-10', 'VIGENTE',    7),
(4,  4,  'CTR-2026-0004', 'Arrendamiento financiero',   '2026-01-12', 'VIGENTE',    8),
(5,  5,  'CTR-2026-0005', 'Línea revolvente',           '2026-01-15', 'VIGENTE',    9),
(6,  6,  'CTR-2026-0006', 'Crédito personal',           '2026-01-18', 'VIGENTE',    10),
(7,  7,  'CTR-2026-0007', 'Crédito pyme',               '2026-01-20', 'VIGENTE',    11),
(8,  8,  'CTR-2026-0008', 'Factoraje',                  '2026-01-22', 'VIGENTE',    12),
(9,  9,  'CTR-2026-0009', 'Arrendamiento financiero',   '2026-02-01', 'VIGENTE',    5),
(10, 10, 'CTR-2026-0010', 'Línea revolvente',           '2026-02-05', 'VIGENTE',    6),
(11, 11, 'CTR-2026-0011', 'Crédito pyme',               '2026-02-08', 'VIGENTE',    7),
(12, 12, 'CTR-2026-0012', 'Factoraje',                  '2026-02-12', 'VIGENTE',    8),
(13, 13, 'CTR-2026-0013', 'Arrendamiento financiero',   '2026-02-15', 'VIGENTE',    9),
(14, 14, 'CTR-2026-0014', 'Crédito personal',           '2026-02-18', 'VIGENTE',    10),
(15, 15, 'CTR-2026-0015', 'Línea revolvente',           '2026-02-20', 'VIGENTE',    11),
(16, 16, 'CTR-2026-0016', 'Crédito pyme',               '2026-03-01', 'VIGENTE',    12),
(17, 17, 'CTR-2026-0017', 'Crédito personal',           '2026-03-05', 'SUSPENDIDO', 5),
(18, 18, 'CTR-2026-0018', 'Factoraje',                  '2026-03-08', 'VIGENTE',    6),
(19, 19, 'CTR-2026-0019', 'Línea revolvente',           '2026-03-10', 'SUSPENDIDO', 7),
(20, 20, 'CTR-2026-0020', 'Arrendamiento financiero',   '2026-03-12', 'CANCELADO',  8);


--  10. operacion
INSERT INTO operacion (id_operacion, id_cliente, id_contrato, tipo_operacion, monto, moneda, fecha_operacion, id_analista)
VALUES
(1,  1,  1,  'Disposición',    15000.00,  'MXN', '2026-04-01', 5),
(2,  2,  2,  'Pago',           8500.00,   'MXN', '2026-04-01', 6),
(3,  3,  3,  'Transferencia',  52000.00,  'MXN', '2026-04-01', 7),
(4,  4,  4,  'Disposición',    31000.00,  'MXN', '2026-04-01', 8),
(5,  5,  5,  'Retiro',         22500.00,  'MXN', '2026-04-01', 9),
(6,  6,  6,  'Depósito',       125000.00, 'MXN', '2026-04-02', 10),
(7,  7,  7,  'Pago',           14300.00,  'MXN', '2026-04-02', 11),
(8,  8,  8,  'Transferencia',  37800.00,  'MXN', '2026-04-02', 12),
(9,  9,  9,  'Disposición',    78000.00,  'MXN', '2026-04-02', 5),
(10, 10, 10, 'Retiro',         19600.00,  'MXN', '2026-04-02', 6),
(11, 11, 11, 'Depósito',       43200.00,  'MXN', '2026-04-03', 7),
(12, 12, 12, 'Pago',           61500.00,  'MXN', '2026-04-03', 8),
(13, 13, 13, 'Transferencia',  95000.00,  'MXN', '2026-04-03', 9),
(14, 14, 14, 'Disposición',    125000.00, 'MXN', '2026-04-03', 10),
(15, 15, 15, 'Retiro',         28700.00,  'MXN', '2026-04-03', 11),
(16, 16, 16, 'Depósito',       17400.00,  'MXN', '2026-04-04', 12),
(17, 17, 17, 'Pago',           9800.00,   'MXN', '2026-04-04', 5),
(18, 18, 18, 'Transferencia',  78000.00,  'MXN', '2026-04-04', 6),
(19, 19, 19, 'Disposición',    54000.00,  'MXN', '2026-04-04', 7),
(20, 20, 20, 'Retiro',         33500.00,  'MXN', '2026-04-04', 8),
(21, 1,  1,  'Depósito',       20000.00,  'MXN', '2026-04-05', 5),
(22, 2,  2,  'Transferencia',  125000.00, 'MXN', '2026-04-05', 6),
(23, 3,  3,  'Pago',           47000.00,  'MXN', '2026-04-05', 7),
(24, 4,  4,  'Retiro',         29300.00,  'MXN', '2026-04-05', 8),
(25, 5,  5,  'Disposición',    68000.00,  'MXN', '2026-04-06', 9),
(26, 6,  6,  'Pago',           15800.00,  'MXN', '2026-04-06', 10),
(27, 7,  7,  'Depósito',       41200.00,  'MXN', '2026-04-06', 11),
(28, 8,  8,  'Transferencia',  78000.00,  'MXN', '2026-04-06', 12),
(29, 9,  9,  'Retiro',         55000.00,  'MXN', '2026-04-06', 5),
(30, 10, 10, 'Disposición',    87500.00,  'MXN', '2026-04-07', 6),
(31, 11, 11, 'Pago',           125000.00, 'MXN', '2026-04-07', 7),
(32, 12, 12, 'Depósito',       34600.00,  'MXN', '2026-04-07', 8),
(33, 13, 13, 'Transferencia',  112000.00, 'MXN', '2026-04-07', 9),
(34, 14, 14, 'Retiro',         26800.00,  'MXN', '2026-04-07', 10),
(35, 15, 15, 'Disposición',    49500.00,  'MXN', '2026-04-08', 11),
(36, 16, 16, 'Pago',           18200.00,  'MXN', '2026-04-08', 12),
(37, 17, 17, 'Depósito',       11000.00,  'MXN', '2026-04-08', 5),
(38, 18, 18, 'Transferencia',  93000.00,  'MXN', '2026-04-08', 6),
(39, 19, 19, 'Retiro',         62000.00,  'MXN', '2026-04-08', 7),
(40, 20, 20, 'Disposición',    44800.00,  'MXN', '2026-04-09', 8),
(41, 1,  1,  'Pago',           12500.00,  'MXN', '2026-04-09', 5),
(42, 2,  2,  'Retiro',         31000.00,  'MXN', '2026-04-09', 6),
(43, 3,  3,  'Depósito',       75000.00,  'MXN', '2026-04-09', 7),
(44, 4,  4,  'Transferencia',  57300.00,  'MXN', '2026-04-10', 8),
(45, 5,  5,  'Pago',           125000.00, 'MXN', '2026-04-10', 9),
(46, 6,  6,  'Disposición',    38400.00,  'MXN', '2026-04-10', 10),
(47, 7,  7,  'Retiro',         24700.00,  'MXN', '2026-04-10', 11),
(48, 8,  8,  'Depósito',       66000.00,  'MXN', '2026-04-11', 12),
(49, 9,  9,  'Transferencia',  78000.00,  'MXN', '2026-04-11', 5),
(50, 10, 10, 'Pago',           29100.00,  'MXN', '2026-04-11', 6);


--  11. reporte
INSERT INTO reporte (id_reporte, tipo_reporte, canal_envio, fecha_generacion, estatus_envio, id_oficial, periodo_reportado)
VALUES
(1,  'Reporte de Operaciones Relevantes',       'Portal CNBV', '2026-04-10 08:00:00-06', 'ENVIADO',    2, 'Abril 2026'),
(2,  'Reporte de Operaciones Inusuales',         'XML',         '2026-04-10 09:00:00-06', 'CONFIRMADO', 3, 'Abril 2026'),
(3,  'Reporte de Operaciones Relevantes',       'TXT',         '2026-04-10 10:00:00-06', 'ENVIADO',    4, 'Abril 2026'),
(4,  'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-10 11:00:00-06', 'CONFIRMADO', 2, 'Abril 2026'),
(5,  'Reporte de Operaciones Relevantes',       'XML',         '2026-04-10 12:00:00-06', 'PENDIENTE',  3, 'Abril 2026'),
(6,  'Reporte de Operaciones Inusuales',         'TXT',         '2026-04-11 08:00:00-06', 'ENVIADO',    4, 'Abril 2026'),
(7,  'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-11 09:00:00-06', 'RECHAZADO',  2, 'Abril 2026'),
(8,  'Reporte de Operaciones Relevantes',       'XML',         '2026-04-11 10:00:00-06', 'ENVIADO',    3, 'Abril 2026'),
(9,  'Reporte de Operaciones Inusuales',         'TXT',         '2026-04-11 11:00:00-06', 'CONFIRMADO', 4, 'Abril 2026'),
(10, 'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-11 12:00:00-06', 'ENVIADO',    2, 'Abril 2026'),
(11, 'Reporte de Operaciones Relevantes',       'XML',         '2026-04-12 08:00:00-06', 'PENDIENTE',  3, 'Mayo 2026'),
(12, 'Reporte de Operaciones Inusuales',         'TXT',         '2026-04-12 09:00:00-06', 'CONFIRMADO', 4, 'Mayo 2026'),
(13, 'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-12 10:00:00-06', 'ENVIADO',    2, 'Mayo 2026'),
(14, 'Reporte de Operaciones Relevantes',       'XML',         '2026-04-12 11:00:00-06', 'CONFIRMADO', 3, 'Mayo 2026'),
(15, 'Reporte de Operaciones Inusuales',         'TXT',         '2026-04-12 12:00:00-06', 'ENVIADO',    4, 'Mayo 2026'),
(16, 'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-13 08:00:00-06', 'RECHAZADO',  2, 'Mayo 2026'),
(17, 'Reporte de Operaciones Relevantes',       'XML',         '2026-04-13 09:00:00-06', 'ENVIADO',    3, 'Mayo 2026'),
(18, 'Reporte de Operaciones Inusuales',         'TXT',         '2026-04-13 10:00:00-06', 'CONFIRMADO', 4, 'Mayo 2026'),
(19, 'Reporte de Actividad Sospechosa',         'Portal CNBV', '2026-04-13 11:00:00-06', 'ENVIADO',    2, 'Mayo 2026'),
(20, 'Reporte de Operaciones Relevantes',       'XML',         '2026-04-13 12:00:00-06', 'PENDIENTE',  3, 'Mayo 2026');


--  12. regla_alerta
INSERT INTO regla_alerta (id_regla, nombre_regla, umbral_monto, umbral_frecuencia, activa, id_admin)
VALUES
(1,  'Monto inusual superior a 50,000 MXN',                  50000.00,  NULL, TRUE, 1),
(2,  'Frecuencia alta de depósitos en 30 días',              NULL,       3,    TRUE, 1),
(3,  'Operación en efectivo superior a 100,000 MXN',         100000.00, NULL, TRUE, 1),
(4,  'Cliente PEP con operación mayor a 25,000 MXN',         25000.00,  NULL, TRUE, 1),
(5,  'Retiros consecutivos de alto monto',                   40000.00,  2,    TRUE, 1),
(6,  'Transferencia atípica respecto al historial',          60000.00,  NULL, TRUE, 1),
(7,  'Uso intensivo de línea revolvente',                    30000.00,  4,    TRUE, 1),
(8,  'Operaciones múltiples en un mismo día',                NULL,       5,    TRUE, 1),
(9,  'Cliente bloqueado con intento de movimiento',          1.00,       1,    TRUE, 1),
(10, 'Operación cercana al umbral regulatorio',              49000.00,  NULL, TRUE, 1);


--  13. alerta
INSERT INTO alerta (id_alerta, id_operacion, id_cliente, id_regla, tipo_alerta, estatus, fecha_generacion, id_oficial, id_reporte)
VALUES
(1,  1,  1,  1,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:01:00-06', 2, 1),
(2,  2,  2,  2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:02:00-06', 3, 2),
(3,  3,  3,  4,  'Monitoreo PEP',        'EN_REVISION', '2026-04-12 10:03:00-06', 4, 3),
(4,  4,  4,  1,  'Operación inusual',    'CERRADA',     '2026-04-12 10:04:00-06', 2, 4),
(5,  5,  5,  5,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:05:00-06', 3, 5),
(6,  6,  6,  3,  'Operación relevante',  'EN_REVISION', '2026-04-12 10:06:00-06', 4, 6),
(7,  7,  7,  2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:07:00-06', 2, 7),
(8,  8,  8,  6,  'Operación inusual',    'CERRADA',     '2026-04-12 10:08:00-06', 3, 8),
(9,  9,  9,  1,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:09:00-06', 4, 9),
(10, 10, 10, 7,  'Operación inusual',    'ESCALADA',    '2026-04-12 10:10:00-06', 2, 10),
(11, 11, 11, 2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:11:00-06', 3, 11),
(12, 12, 12, 6,  'Operación inusual',    'EN_REVISION', '2026-04-12 10:12:00-06', 4, 12),
(13, 13, 13, 4,  'Monitoreo PEP',        'EN_REVISION', '2026-04-12 10:13:00-06', 2, 13),
(14, 14, 14, 3,  'Operación relevante',  'CERRADA',     '2026-04-12 10:14:00-06', 3, 14),
(15, 15, 15, 5,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:15:00-06', 4, 15),
(16, 16, 16, 2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:16:00-06', 2, 16),
(17, 17, 17, 1,  'Operación inusual',    'CERRADA',     '2026-04-12 10:17:00-06', 3, 17),
(18, 18, 18, 6,  'Operación inusual',    'ESCALADA',    '2026-04-12 10:18:00-06', 4, 18),
(19, 19, 19, 9,  'Cliente bloqueado',    'EN_REVISION', '2026-04-12 10:19:00-06', 2, 19),
(20, 20, 20, 7,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:20:00-06', 3, 20),
(21, 21, 1,  2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:21:00-06', 4, NULL),
(22, 22, 2,  3,  'Operación relevante',  'EN_REVISION', '2026-04-12 10:22:00-06', 2, NULL),
(23, 23, 3,  4,  'Monitoreo PEP',        'ABIERTA',     '2026-04-12 10:23:00-06', 3, NULL),
(24, 24, 4,  5,  'Operación inusual',    'CERRADA',     '2026-04-12 10:24:00-06', 4, NULL),
(25, 25, 5,  1,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:25:00-06', 2, NULL),
(26, 26, 6,  8,  'Operación inusual',    'ESCALADA',    '2026-04-12 10:26:00-06', 3, NULL),
(27, 27, 7,  2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:27:00-06', 4, NULL),
(28, 28, 8,  6,  'Operación inusual',    'EN_REVISION', '2026-04-12 10:28:00-06', 2, NULL),
(29, 29, 9,  1,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:29:00-06', 3, NULL),
(30, 30, 10, 1,  'Operación inusual',    'ESCALADA',    '2026-04-12 10:30:00-06', 4, NULL),
(31, 31, 11, 3,  'Operación relevante',  'EN_REVISION', '2026-04-12 10:31:00-06', 2, NULL),
(32, 32, 12, 2,  'Operación inusual',    'CERRADA',     '2026-04-12 10:32:00-06', 3, NULL),
(33, 33, 13, 4,  'Monitoreo PEP',        'ABIERTA',     '2026-04-12 10:33:00-06', 4, NULL),
(34, 34, 14, 6,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:34:00-06', 2, NULL),
(35, 35, 15, 10, 'Operación inusual',    'EN_REVISION', '2026-04-12 10:35:00-06', 3, NULL),
(36, 36, 16, 2,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:36:00-06', 4, NULL),
(37, 37, 17, 5,  'Operación inusual',    'CERRADA',     '2026-04-12 10:37:00-06', 2, NULL),
(38, 38, 18, 6,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:38:00-06', 3, NULL),
(39, 39, 19, 9,  'Cliente bloqueado',    'ESCALADA',    '2026-04-12 10:39:00-06', 4, NULL),
(40, 40, 20, 7,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:40:00-06', 2, NULL),
(41, 41, 1,  2,  'Operación inusual',    'CERRADA',     '2026-04-12 10:41:00-06', 3, NULL),
(42, 42, 2,  5,  'Operación inusual',    'EN_REVISION', '2026-04-12 10:42:00-06', 4, NULL),
(43, 43, 3,  4,  'Monitoreo PEP',        'ABIERTA',     '2026-04-12 10:43:00-06', 2, NULL),
(44, 44, 4,  6,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:44:00-06', 3, NULL),
(45, 45, 5,  3,  'Operación relevante',  'ESCALADA',    '2026-04-12 10:45:00-06', 4, NULL),
(46, 46, 6,  1,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:46:00-06', 2, NULL),
(47, 47, 7,  8,  'Operación inusual',    'EN_REVISION', '2026-04-12 10:47:00-06', 3, NULL),
(48, 48, 8,  2,  'Operación inusual',    'CERRADA',     '2026-04-12 10:48:00-06', 4, NULL),
(49, 49, 9,  6,  'Operación inusual',    'ABIERTA',     '2026-04-12 10:49:00-06', 2, NULL),
(50, 50, 10, 10, 'Operación inusual',    'EN_REVISION', '2026-04-12 10:50:00-06', 3, NULL);


--  14. perfil_riesgo
INSERT INTO perfil_riesgo (id_perfil, id_cliente, nivel_riesgo, score, fecha_calculo, id_oficial)
VALUES
(1,  1,  'MEDIO',    54.20, '2026-04-13 09:00:00-06', 2),
(2,  2,  'BAJO',     32.40, '2026-04-13 09:05:00-06', 2),
(3,  3,  'MUY_ALTO', 95.00, '2026-04-13 09:10:00-06', 3),
(4,  4,  'MEDIO',    51.80, '2026-04-13 09:15:00-06', 3),
(5,  5,  'MEDIO',    48.30, '2026-04-13 09:20:00-06', 4),
(6,  6,  'BAJO',     35.70, '2026-04-13 09:25:00-06', 4),
(7,  7,  'MEDIO',    57.10, '2026-04-13 09:30:00-06', 2),
(8,  8,  'BAJO',     39.50, '2026-04-13 09:35:00-06', 2),
(9,  9,  'MEDIO',    59.40, '2026-04-13 09:40:00-06', 3),
(10, 10, 'MEDIO',    61.20, '2026-04-13 09:45:00-06', 3),
(11, 11, 'MEDIO',    58.60, '2026-04-13 09:50:00-06', 4),
(12, 12, 'MEDIO',    63.10, '2026-04-13 09:55:00-06', 4),
(13, 13, 'MUY_ALTO', 96.50, '2026-04-13 10:00:00-06', 2),
(14, 14, 'MEDIO',    60.80, '2026-04-13 10:05:00-06', 2),
(15, 15, 'BAJO',     41.90, '2026-04-13 10:10:00-06', 3),
(16, 16, 'BAJO',     37.20, '2026-04-13 10:15:00-06', 3),
(17, 17, 'ALTO',     74.00, '2026-04-13 10:20:00-06', 4),
(18, 18, 'MEDIO',    64.70, '2026-04-13 10:25:00-06', 4),
(19, 19, 'MUY_ALTO', 98.00, '2026-04-13 10:30:00-06', 2),
(20, 20, 'MEDIO',    62.50, '2026-04-13 10:35:00-06', 2);


--  15. reporte_interno
INSERT INTO reporte_interno (id_reporte_int, id_cliente, descripcion, es_anonimo, estatus, fecha_reporte, id_reportante)
VALUES
(1,  1,  'El cliente realizó tres disposiciones en menos de 48 horas por montos acumulados superiores a 45,000 MXN sin justificación documentada.',                                         FALSE, 'ABIERTO',     '2026-04-14 08:00:00-06', 17),
(2,  2,  'Se detectó una transferencia hacia cuenta no registrada en el expediente por 125,000 MXN; el cliente no respondió la solicitud de aclaración en el plazo establecido.',           FALSE, 'EN_PROCESO',  '2026-04-14 09:00:00-06', 18),
(3,  3,  'Cliente identificado como PEP presentó operación por 52,000 MXN sin acreditar origen de recursos. Se activa protocolo de debida diligencia reforzada.',                          FALSE, 'EN_PROCESO',  '2026-04-14 10:00:00-06', 19),
(4,  4,  'Comprobante de domicilio presentado fue rechazado por estar vencido. El cliente no ha entregado documento actualizado en los últimos 15 días hábiles.',                           FALSE, 'ABIERTO',     '2026-04-14 11:00:00-06', 20),
(5,  5,  'Se registraron cinco retiros parciales en el mismo día laboral, todos por debajo del umbral de reporte individual, lo que sugiere posible fraccionamiento.',                      FALSE, 'CERRADO',     '2026-04-14 12:00:00-06', 17),
(6,  6,  'Depósito de 125,000 MXN en efectivo sin respaldo documental del origen. El expediente del cliente no cuenta con declaración de patrimonio actualizada.',                         FALSE, 'EN_PROCESO',  '2026-04-15 08:00:00-06', 18),
(7,  7,  'El comprobante de domicilio registrado en el expediente está vencido desde hace más de 90 días. Se generó notificación automática sin respuesta del cliente.',                   FALSE, 'ARCHIVADO',   '2026-04-15 09:00:00-06', 19),
(8,  8,  'Transferencia de 78,000 MXN hacia entidad no identificada en historial habitual. El analista responsable solicitó aclaración al cliente sin obtener respuesta.',                 FALSE, 'ABIERTO',     '2026-04-15 10:00:00-06', 20),
(9,  9,  'La razón social de la empresa no coincide con el RFC registrado en la constancia de situación fiscal. Se requiere corrección antes de continuar operaciones.',                   FALSE, 'EN_PROCESO',  '2026-04-15 11:00:00-06', 17),
(10, 10, 'El cliente presentó estado de cuenta de institución no reconocida por el sistema. Se envió solicitud al área de validación documental para dictamen.',                           FALSE, 'CERRADO',     '2026-04-15 12:00:00-06', 18),
(11, 11, 'Se identificó que la cuenta bancaria del cliente tiene restricciones por parte del SAT. Las operaciones activas están siendo revisadas por el oficial de cumplimiento.',          FALSE, 'ABIERTO',     '2026-04-16 08:00:00-06', 19),
(12, 12, 'El contrato de arrendamiento financiero registra tres meses sin pago y sin comunicación formal del cliente. El expediente fue escalado al área jurídica.',                       FALSE, 'ARCHIVADO',   '2026-04-16 09:00:00-06', 20),
(13, 13, 'Empresa con representante legal identificado como PEP realizó transferencia interna por 95,000 MXN. Se activa revisión conforme al artículo 17 de la LFPIORPI.',                 FALSE, 'EN_PROCESO',  '2026-04-16 10:00:00-06', 17),
(14, 14, 'Disposición de 125,000 MXN realizada fuera del horario habitual del cliente. El sistema generó la alerta de forma automática y fue asignada al oficial de turno.',               FALSE, 'CERRADO',     '2026-04-16 11:00:00-06', 18),
(15, 15, 'Patrón de retiros semanales que acumulan 49,500 MXN en un período de 18 días. Los montos individuales son inferiores al umbral, pero el comportamiento es atípico.',             FALSE, 'ABIERTO',     '2026-04-16 12:00:00-06', 19),
(16, 16, 'Primera operación del cliente fue un depósito fuera del rango estimado en el perfil de riesgo inicial. Se solicita actualización del perfil por parte del oficial.',             FALSE, 'ABIERTO',     '2026-04-17 08:00:00-06', 20),
(17, 17, 'Contrato en estatus SUSPENDIDO registra intento de operación. El sistema lo bloqueó automáticamente y generó aviso al área de cumplimiento.',                                    FALSE, 'CERRADO',     '2026-04-17 09:00:00-06', 17),
(18, 18, 'Transferencia de 93,000 MXN a cuenta en el extranjero sin declaración de origen de recursos internacionales. El expediente carece del formulario FAIS correspondiente.',        FALSE, 'EN_PROCESO',  '2026-04-17 10:00:00-06', 18),
(19, 19, 'Cliente con estatus BLOQUEADO intentó iniciar una operación de retiro. El sistema denegó la transacción y generó alerta de tipo 9 de forma automática.',                        FALSE, 'ABIERTO',     '2026-04-17 11:00:00-06', 19),
(20, 20, 'Primer contrato cancelado del cliente registra un saldo pendiente de liquidación. El área contable fue notificada para iniciar proceso de recuperación.',                        FALSE, 'ABIERTO',     '2026-04-17 12:00:00-06', 20),
(21, 1,  'Reporte anónimo sobre posibles operaciones realizadas en nombre de terceros no identificados en el expediente del cliente.',                                                       TRUE,  'ABIERTO',     '2026-04-18 08:00:00-06', NULL),
(22, 2,  'El cliente solicitó modificación del número de cuenta destino para transferencias recurrentes sin presentar justificación escrita.',                                              FALSE, 'EN_PROCESO',  '2026-04-18 09:00:00-06', 17),
(23, 3,  'Segunda alerta generada sobre el cliente PEP en un período menor a 30 días. El oficial de cumplimiento escaló el caso al comité de riesgos para resolución.',                   FALSE, 'EN_PROCESO',  '2026-04-18 10:00:00-06', 18),
(24, 4,  'Se detectó inconsistencia entre el domicilio fiscal del cliente y el domicilio registrado en el expediente KYC. Se solicitó actualización formal de datos.',                     FALSE, 'CERRADO',     '2026-04-18 11:00:00-06', 19),
(25, 5,  'El cliente realizó tres disposiciones en días consecutivos con montos que acumulan 115,500 MXN. El comportamiento no corresponde al perfil de riesgo asignado.',                 FALSE, 'ABIERTO',     '2026-04-18 12:00:00-06', 20),
(26, 6,  'Reporte anónimo sobre vinculación del cliente con empresa señalada en listas de vigilancia internacionales. Se inició verificación en listas OFAC y ONU.',                       TRUE,  'EN_PROCESO',  '2026-04-19 08:00:00-06', NULL),
(27, 7,  'El expediente del cliente presenta dos documentos con firmas que no coinciden con la identificación oficial registrada. El caso fue remitido al área de validación.',            FALSE, 'ABIERTO',     '2026-04-19 09:00:00-06', 17),
(28, 8,  'Depósito de 66,000 MXN seguido de retiro por el mismo monto el día hábil siguiente. El patrón sugiere posible tránsito de recursos sin origen justificado.',                   FALSE, 'EN_PROCESO',  '2026-04-19 10:00:00-06', 18),
(29, 9,  'La razón social fue modificada recientemente sin actualización del acta constitutiva en el expediente. Las operaciones activas están en revisión hasta regularizar el caso.',    FALSE, 'ABIERTO',     '2026-04-19 11:00:00-06', 19),
(30, 10, 'El representante legal de la empresa realizó operaciones desde una dirección IP ubicada fuera del país sin notificación previa al área de cumplimiento.',                        FALSE, 'CERRADO',     '2026-04-19 12:00:00-06', 20),
(31, 11, 'Se reporta cambio de titular de cuenta bancaria registrada en el expediente sin que el cliente haya notificado formalmente a la SOFOM.',                                         FALSE, 'ABIERTO',     '2026-04-20 08:00:00-06', 17),
(32, 12, 'El cliente presentó opinión de cumplimiento del SAT con estatus negativo. Las operaciones de factoraje quedaron suspendidas preventivamente hasta regularización.',              FALSE, 'EN_PROCESO',  '2026-04-20 09:00:00-06', 18),
(33, 13, 'Empresa con participación de PEP como accionista registra movimiento de 112,000 MXN. El comité de riesgos fue notificado y se espera resolución en cinco días hábiles.',        FALSE, 'EN_PROCESO',  '2026-04-20 10:00:00-06', 19),
(34, 14, 'Contrato firmado entregado por el cliente presenta fecha que no coincide con la fecha de alta en el sistema. Se detectó la inconsistencia durante revisión documental.',         FALSE, 'CERRADO',     '2026-04-20 11:00:00-06', 20),
(35, 15, 'El cliente reportó pérdida de identificación oficial y solicitó actualización del expediente. El área de analistas validó la sustitución con acta de denuncia adjunta.',        FALSE, 'ARCHIVADO',   '2026-04-20 12:00:00-06', 17),
(36, 16, 'Primera operación del cliente generó alerta automática por monto superior al estimado en el formato KYC. El perfil de riesgo fue actualizado de BAJO a MEDIO.',                 FALSE, 'CERRADO',     '2026-04-21 08:00:00-06', 18),
(37, 17, 'El cliente con contrato SUSPENDIDO solicitó reactivación sin presentar la documentación requerida por el área jurídica. La solicitud fue rechazada.',                           FALSE, 'ABIERTO',     '2026-04-21 09:00:00-06', 19),
(38, 18, 'Reporte anónimo sobre posible uso del contrato de factoraje para transferencia de recursos de origen ilícito. El caso fue turnado al oficial de cumplimiento de guardia.',       TRUE,  'EN_PROCESO',  '2026-04-21 10:00:00-06', NULL),
(39, 19, 'El sistema detectó que el cliente bloqueado intentó acceder al portal digital desde un dispositivo no registrado. El acceso fue denegado y se generó bitácora de seguridad.',   FALSE, 'CERRADO',     '2026-04-21 11:00:00-06', 20),
(40, 20, 'El contrato cancelado del cliente registra cláusula de penalización no cobrada. El área financiera solicitó apertura de expediente para recuperación del adeudo.',              FALSE, 'ABIERTO',     '2026-04-21 12:00:00-06', 17),
(41, 1,  'Revisión periódica del expediente detectó que el formato KYC del cliente no ha sido actualizado en más de seis meses. Se generó aviso de vencimiento próximo.',                 FALSE, 'ABIERTO',     '2026-04-22 08:00:00-06', 18),
(42, 2,  'El cliente realizó una disposición de crédito pyme sin acreditar el destino de los recursos conforme al contrato. Se solicitó comprobación en un plazo de diez días hábiles.',  FALSE, 'EN_PROCESO',  '2026-04-22 09:00:00-06', 19),
(43, 3,  'Tercer evento de monitoreo PEP en el mes. El oficial de cumplimiento presentó el caso ante el comité directivo para evaluación de continuidad de la relación comercial.',        FALSE, 'EN_PROCESO',  '2026-04-22 10:00:00-06', 20),
(44, 4,  'El domicilio declarado por el cliente en el formato KYC fue verificado y no corresponde al registrado en la identificación oficial. Se inició proceso de corrección.',           FALSE, 'ABIERTO',     '2026-04-22 11:00:00-06', 17),
(45, 5,  'Se identificó un quinto pago atípico en el período mensual, todos por montos inferiores al umbral individual. El patrón acumulado supera el límite de alerta establecido.',     FALSE, 'EN_PROCESO',  '2026-04-22 12:00:00-06', 18),
(46, 6,  'Segundo reporte del cliente en el mes por operaciones en efectivo de alto monto. El expediente fue marcado para revisión trimestral anticipada por el área de cumplimiento.',    FALSE, 'EN_PROCESO',  '2026-04-23 08:00:00-06', 19),
(47, 7,  'Documentos del cliente muestran fecha de emisión incompatible con la fecha de apertura del expediente. El analista solicitó aclaración formal por escrito.',                    FALSE, 'ABIERTO',     '2026-04-23 09:00:00-06', 20),
(48, 8,  'El patrón de depósito y retiro inmediato se repitió por tercera ocasión en el mes. El oficial de cumplimiento determinó escalar el caso a nivel de reporte regulatorio.',        FALSE, 'EN_PROCESO',  '2026-04-23 10:00:00-06', 17),
(49, 9,  'Reporte anónimo sobre posible uso de la empresa como fachada para operaciones de terceros no identificados. Se solicitó auditoría interna del expediente completo.',             TRUE,  'ABIERTO',     '2026-04-23 11:00:00-06', NULL),
(50, 10, 'El representante legal presentó poder notarial con vigencia vencida. Todas las operaciones en curso fueron suspendidas preventivamente hasta presentar documento actualizado.',   FALSE, 'ABIERTO',     '2026-04-23 12:00:00-06', 18);


--  16. historial_cambios
INSERT INTO historial_cambios (id_historial, id_usuario, accion, entidad_afectada, fecha_hora, ip_address, campo_modificado, valor_anterior, valor_nuevo)
VALUES
(1,  1,  'INSERT', 'usuario',          '2026-03-25 08:00:00-06', '192.168.1.10', NULL,              NULL,           NULL),
(2,  1,  'INSERT', 'rol',              '2026-03-25 08:05:00-06', '192.168.1.10', NULL,              NULL,           NULL),
(3,  1,  'INSERT', 'tipo_documento',   '2026-03-25 08:10:00-06', '192.168.1.10', NULL,              NULL,           NULL),
(4,  1,  'INSERT', 'regla_alerta',     '2026-03-25 08:15:00-06', '192.168.1.10', NULL,              NULL,           NULL),
(5,  2,  'LOGIN',  NULL,               '2026-04-01 08:58:00-06', '10.0.0.21',    NULL,              NULL,           NULL),
(6,  5,  'INSERT', 'cliente',          '2026-04-01 09:00:00-06', '10.0.0.25',    NULL,              NULL,           NULL),
(7,  6,  'INSERT', 'cliente',          '2026-04-01 09:10:00-06', '10.0.0.26',    NULL,              NULL,           NULL),
(8,  7,  'INSERT', 'cliente',          '2026-04-01 09:20:00-06', '10.0.0.27',    NULL,              NULL,           NULL),
(9,  3,  'INSERT', 'documento',        '2026-04-02 09:00:00-06', '10.0.0.22',    NULL,              NULL,           NULL),
(10, 3,  'UPDATE', 'documento',        '2026-04-02 11:30:00-06', '10.0.0.22',    'estatus',         'PENDIENTE',    'APROBADO'),
(11, 4,  'UPDATE', 'documento',        '2026-04-02 12:10:00-06', '10.0.0.23',    'estatus',         'PENDIENTE',    'RECHAZADO'),
(12, 5,  'INSERT', 'contrato',         '2026-04-03 09:00:00-06', '10.0.0.25',    NULL,              NULL,           NULL),
(13, 6,  'INSERT', 'contrato',         '2026-04-03 09:15:00-06', '10.0.0.26',    NULL,              NULL,           NULL),
(14, 5,  'INSERT', 'operacion',        '2026-04-04 09:00:00-06', '10.0.0.25',    NULL,              NULL,           NULL),
(15, 6,  'INSERT', 'operacion',        '2026-04-04 09:10:00-06', '10.0.0.26',    NULL,              NULL,           NULL),
(16, 2,  'INSERT', 'alerta',           '2026-04-12 10:06:00-06', '10.0.1.5',     NULL,              NULL,           NULL),
(17, 3,  'UPDATE', 'alerta',           '2026-04-12 14:30:00-06', '10.0.1.6',     'estatus',         'ABIERTA',      'EN_REVISION'),
(18, 4,  'UPDATE', 'alerta',           '2026-04-12 16:00:00-06', '10.0.1.7',     'estatus',         'EN_REVISION',  'CERRADA'),
(19, 2,  'INSERT', 'reporte',          '2026-04-13 08:00:00-06', '10.0.1.5',     NULL,              NULL,           NULL),
(20, 3,  'UPDATE', 'reporte',          '2026-04-13 10:00:00-06', '10.0.1.6',     'estatus_envio',   'PENDIENTE',    'ENVIADO'),
(21, 1,  'UPDATE', 'cliente',          '2026-04-13 11:00:00-06', '192.168.1.10', 'estatus',         'ACTIVO',       'BLOQUEADO'),
(22, 1,  'UPDATE', 'regla_alerta',     '2026-04-13 11:30:00-06', '192.168.1.10', 'activa',          'TRUE',         'FALSE'),
(23, 2,  'INSERT', 'perfil_riesgo',    '2026-04-13 12:00:00-06', '10.0.1.5',     NULL,              NULL,           NULL),
(24, 3,  'UPDATE', 'perfil_riesgo',    '2026-04-13 12:30:00-06', '10.0.1.6',     'nivel_riesgo',    'BAJO',         'MEDIO'),
(25, 17, 'INSERT', 'reporte_interno',  '2026-04-14 08:00:00-06', '10.0.2.17',    NULL,              NULL,           NULL),
(26, 18, 'UPDATE', 'reporte_interno',  '2026-04-14 10:00:00-06', '10.0.2.18',    'estatus',         'ABIERTO',      'EN_PROCESO'),
(27, 4,  'EXPORT', 'reporte',          '2026-04-14 11:00:00-06', '10.0.1.7',     NULL,              NULL,           NULL),
(28, 13, 'LOGIN',  NULL,               '2026-04-15 09:00:00-06', '10.0.3.13',    NULL,              NULL,           NULL),
(29, 14, 'LOGOUT', NULL,               '2026-04-15 11:00:00-06', '10.0.3.14',    NULL,              NULL,           NULL),
(30, 5,  'UPDATE', 'contrato',         '2026-04-15 12:00:00-06', '10.0.0.25',    'estatus',         'VIGENTE',      'SUSPENDIDO'),
(31, 6,  'UPDATE', 'operacion',        '2026-04-16 09:00:00-06', '10.0.0.26',    'monto',           '50000.00',     '125000.00'),
(32, 7,  'UPDATE', 'cliente',          '2026-04-16 10:00:00-06', '10.0.0.27',    'estatus',         'ACTIVO',       'INACTIVO'),
(33, 8,  'INSERT', 'domicilio',        '2026-04-16 11:00:00-06', '10.0.0.28',    NULL,              NULL,           NULL),
(34, 9,  'UPDATE', 'documento',        '2026-04-17 09:00:00-06', '10.0.0.29',    'estatus',         'PENDIENTE',    'APROBADO'),
(35, 10, 'UPDATE', 'documento',        '2026-04-17 10:00:00-06', '10.0.0.30',    'ruta_archivo',    '/docs/v1/doc_14.pdf', '/docs/v2/doc_14_corregido.pdf'),
(36, 11, 'INSERT', 'operacion',        '2026-04-18 09:00:00-06', '10.0.0.31',    NULL,              NULL,           NULL),
(37, 12, 'UPDATE', 'perfil_riesgo',    '2026-04-18 10:00:00-06', '10.0.0.32',    'score',           '48.30',        '63.10'),
(38, 2,  'UPDATE', 'alerta',           '2026-04-19 08:30:00-06', '10.0.1.5',     'estatus',         'ABIERTA',      'ESCALADA'),
(39, 3,  'EXPORT', 'historial_cambios','2026-04-19 09:00:00-06', '10.0.1.6',     NULL,              NULL,           NULL),
(40, 4,  'UPDATE', 'reporte',          '2026-04-19 10:00:00-06', '10.0.1.7',     'estatus_envio',   'ENVIADO',      'RECHAZADO'),
(41, 1,  'DELETE', 'documento',        '2026-04-20 08:00:00-06', '192.168.1.10', NULL,              '/docs/temp/borrador_doc.pdf', NULL),
(42, 5,  'LOGIN',  NULL,               '2026-04-20 09:00:00-06', '10.0.0.25',    NULL,              NULL,           NULL),
(43, 6,  'INSERT', 'reporte_interno',  '2026-04-20 10:00:00-06', '10.0.0.26',    NULL,              NULL,           NULL),
(44, 7,  'UPDATE', 'contrato',         '2026-04-21 09:00:00-06', '10.0.0.27',    'estatus',         'VIGENTE',      'CANCELADO'),
(45, 8,  'LOGOUT', NULL,               '2026-04-21 10:00:00-06', '10.0.0.28',    NULL,              NULL,           NULL),
(46, 9,  'INSERT', 'alerta',           '2026-04-21 11:00:00-06', '10.0.0.29',    NULL,              NULL,           NULL),
(47, 10, 'UPDATE', 'cliente',          '2026-04-22 09:00:00-06', '10.0.0.30',    'es_pep',          'FALSE',        'TRUE'),
(48, 11, 'UPDATE', 'perfil_riesgo',    '2026-04-22 10:00:00-06', '10.0.0.31',    'nivel_riesgo',    'MEDIO',        'ALTO'),
(49, 12, 'EXPORT', 'reporte',          '2026-04-23 09:00:00-06', '10.0.0.32',    NULL,              NULL,           NULL),
(50, 2,  'LOGIN',  NULL,               '2026-04-24 08:00:00-06', '10.0.1.5',     NULL,              NULL,           NULL);