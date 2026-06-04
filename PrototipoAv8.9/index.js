// index.js - CoreData Consulting


const express    = require('express');
const bodyParser = require('body-parser');
const path       = require('path');
const fileUpload = require('express-fileupload');
const session    = require('express-session');

const app = express();

// Middlewares RBAC para accesos y seguridad
const { verificarSesion, verificarRol } = require('./middleware/auth');

// Modelos para el dashboard
const modelClientes    = require('./models/clientes.model');
const modelOperaciones = require('./models/operaciones.model');
const modelAlertas     = require('./models/alertas.model');

app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(session({
    secret: 'coredata-pld-secret-2026',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 1000 * 60 * 60 * 8, httpOnly: true }
}));

app.use(fileUpload());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Exponer usuario y ruta activa a todas las vistas
app.use((req, res, next) => {
    res.locals.currentPath = req.path;
    res.locals.usuario     = req.session.usuario || null;
    next();
});

app.get('/health', (req, res) => res.status(200).json({ status: 'ok' }));

//LOGIN (publico)
const rutasLogin = require('./routes/login.routes');
app.use('/login', rutasLogin);
app.get('/', (req, res) => res.redirect('/login'));

//PORTAL CLIENTE solo Cliente
const rutasPortal = require('./routes/portal.routes');
app.use('/portal', verificarSesion, verificarRol('Cliente'), rutasPortal);

//DASHBOARD del Oficial + Analista
app.get('/dashboard',
    verificarSesion,
    verificarRol('Oficial de Cumplimiento', 'Analista'),
    (req, res) => res.render('dashboard', { mensaje: req.query.mensaje || null })
);

app.get('/api/dashboard',
    verificarSesion,
    verificarRol('Oficial de Cumplimiento', 'Analista'),
    async (req, res) => {
        try {
            const [rc, ro, ra] = await Promise.all([
                modelClientes.ObtenerClientesLista(),
                modelOperaciones.ObtenerOperaciones(),
                modelAlertas.ObtenerAlertas()
            ]);
            const clientes    = rc.clientes    || [];
            const operaciones = ro.operaciones || [];
            const alertas     = ra.alertas     || [];

            res.json({
                totalClientes:          clientes.length,
                totalOperaciones:       operaciones.length,
                totalAlertasPendientes: alertas.filter(a => a.estatus !== 'Resuelta').length,
                totalReportesListos:    0,
                alertasRecientes: alertas.slice(0, 5).map(a => ({
                    descripcion: a.regla || ('Operacion #' + (a.idoperacion || '')),
                    nivel: a.nivel || '', estatus: a.estatus || '', fecha: a.fecha || ''
                })),
                distribucionRiesgo: ['Bajo','Medio','Alto'].map(nivel => ({
                    nivel, cantidad: clientes.filter(c => c.nivelriesgo === nivel).length
                }))
            });
        } catch {
            res.json({ totalClientes:0, totalOperaciones:0, totalAlertasPendientes:0,
                totalReportesListos:0, alertasRecientes:[], distribucionRiesgo:[] });
        }
    }
);

// Al colocar oficial, se entiende que tiene un grado alto de autoridad y de acceso al sistema
//sin embargo tambien el sistema deberia ser accesible a mandos altos del cliente de swa law o administradores.
//

//CLIENTES Oficial + Analista
const rutasClientes = require('./routes/clientes.routes');
app.use('/clientes', verificarSesion, verificarRol('Oficial de Cumplimiento', 'Analista'), rutasClientes);

//OPERACIONES Oficial + Analista
const rutasOperaciones = require('./routes/operaciones.routes');
app.use('/operaciones', verificarSesion, verificarRol('Oficial de Cumplimiento', 'Analista'), rutasOperaciones);

//ALERTAS Oficial + Analista
const rutasAlertas = require('./routes/alertas.routes');
app.use('/alertas', verificarSesion, verificarRol('Oficial de Cumplimiento', 'Analista'), rutasAlertas);

//CONTRATOS Oficial + Analista
const rutasContratos = require('./routes/contratos.routes');
app.use('/contratos', verificarSesion, verificarRol('Oficial de Cumplimiento', 'Analista'), rutasContratos);

//BUZON INTERNO Oficial + Analista
const rutasBuzonInterno = require('./routes/buzon_interno.routes');
app.use('/buzon-interno', verificarSesion, verificarRol('Oficial de Cumplimiento', 'Analista'), rutasBuzonInterno);

// REPORTES solo Oficial
const rutasReportes = require('./routes/reportes.routes');
app.use('/reportes', verificarSesion, verificarRol('Oficial de Cumplimiento'), rutasReportes);

//ADMIN solo Oficial y en teoria admin
const rutasAdmin = require('./routes/admin.routes');
app.use('/admin', verificarSesion, verificarRol('Oficial de Cumplimiento'), rutasAdmin);

//REGLAS solo Oficial, admin o la sofom un mando alto
const rutasReglas = require('./routes/reglas.routes');
app.use('/reglas', verificarSesion, verificarRol('Oficial de Cumplimiento'), rutasReglas);

//HISTORIAL solo Oficial
const rutasHistorial = require('./routes/historial.routes');
app.use('/historial', verificarSesion, verificarRol('Oficial de Cumplimiento'), rutasHistorial);

// Error handler
app.use((error, req, res, next) => {
    console.error(error.message);
    if (req.path.includes('/api/')) {
        return res.status(503).json({ msg: 'Error interno', detalle: error.message });
    }
    next(error);
});

const server = app.listen(3000, () => console.log('-> http://localhost:3000'));
process.on('SIGINT', () => server.close(() => process.exit(0)));
