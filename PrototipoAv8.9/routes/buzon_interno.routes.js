// routes/buzon_interno.routes.js
// RF-17 registrar reporte interno el Oficial + Analista
//RF 18 actualizar estatus solo Oficial de Cumplimiento

const express        = require('express');
const router         = express.Router();
const controller     = require('../controllers/buzon_interno.controller');
const { verificarRol } = require('../middleware/auth');

// Ver lista ambos roles
router.get('/lista',    controller.Lista);

// Registrar reporte ambos roles canal confidencial
//el registro de los reportes anonimos, aunque deberia ser automatico y que el oficial
//avance en el estado de esos de si se investiga 
router.get('/agregar',  controller.VistaAgregar);
router.post('/agregar', controller.Agregar);

// Actualizar estatus/responsable solo Oficial de Cumplimiento
router.post('/actualizar', verificarRol('Oficial de Cumplimiento'), controller.Actualizar);

module.exports = router;
