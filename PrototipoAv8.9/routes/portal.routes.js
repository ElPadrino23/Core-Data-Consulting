// routes/portal.routes.js
// Rutas exclusivas para el rol del Cliente


const express    = require('express');
const router     = express.Router();
const controller = require('../controllers/portal.controller');

router.get('/mi-expediente',   controller.MiExpediente);
router.get('/mis-operaciones', controller.MisOperaciones);
router.get('/mis-contratos',   controller.MisContratos);

module.exports = router;
