//Autenticacion hasta el momento de creacion con 3 roles:
//  Oficial de Cumplimiento, Analista, Cliente

const modelLogin = require('../models/login.model');
const supabase   = require('../config/supabase');

// Usuarios demo hardcoded para pruebas
const usuariosDemo = {
    'demo@sofom.mx': {
        nombre: 'Usuario Demo', correo: 'demo@sofom.mx',
        password: 'demo123', rol: 'Oficial de Cumplimiento', idcliente: null
    },
    'analista@sofom.mx': {
        nombre: 'Carlos Analista', correo: 'analista@sofom.mx',
        password: 'analista123', rol: 'Analista', idcliente: null
    },
    'juan.perez@email.com': {
        nombre: 'Juan Perez', correo: 'juan.perez@email.com',
        password: 'cliente123', rol: 'Cliente', idcliente: null
    }
};

module.exports.VistaLogin = async (req, res) => {
    if (req.session && req.session.usuario) {
        if (req.session.usuario.rol === 'Cliente') return res.redirect('/portal/mi-expediente');
        return res.redirect('/dashboard');
    }
    res.render('./login/login', {
        usuarioDemo: { correo: 'demo@sofom.mx', password: 'demo123' },
        mensaje: req.query.mensaje || null
    });
};

module.exports.ProcesarLogin = async (req, res) => {
    const { correo, password } = req.body;

    // 1. Revisar los usuarios demo de los roles
    const demo = usuariosDemo[correo];
    if (demo && demo.password === password) {
        req.session.usuario = {
            id: 0, nombre: demo.nombre, correo: demo.correo,
            rol: demo.rol, idcliente: demo.idcliente
        };
        if (demo.rol === 'Cliente') return res.redirect('/portal/mi-expediente');
        return res.redirect('/dashboard');
    }

    // 2.Validar con la BDSupabase
    try {
        const usuario = await modelLogin.ValidarCredenciales(correo, password);
        if (!usuario) {
            return res.redirect('/login?mensaje=Credenciales incorrectas. Por favor inténtelo de nuevo.');
        }

        let idcliente = null;
        if (usuario.rol === 'Cliente') {
            const { data } = await supabase
                .from('cliente').select('idcliente')
                .eq('correoelectronico', correo).limit(1);
            if (data && data.length > 0) idcliente = data[0].idcliente;
        }

        req.session.usuario = {
            id: usuario.id, nombre: usuario.nombre,
            correo: usuario.correo, rol: usuario.rol, idcliente
        };

        if (usuario.rol === 'Cliente') return res.redirect('/portal/mi-expediente');
        return res.redirect('/dashboard');

    } catch (error) {
        res.redirect('/login?mensaje=No fue posible conectar con la base de datos. Usa el acceso rapido o algún otro. Contacta a soporte.');
    }
};

module.exports.Logout = async (req, res) => {
    req.session.destroy(() => res.redirect('/login'));
};

module.exports.VistaRegistro  = async (req, res) => res.redirect('/login');
module.exports.ProcesarRegistro = async (req, res) => res.redirect('/login');
