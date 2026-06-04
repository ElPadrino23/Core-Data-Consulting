// middleware/auth.js
//No moverle son los roles
//Autenticacion y control de acceso por rol (RBAC)
// verificarSesion bloquea las rutas si no hay 1 sesion activa
//verificarRol:    bloquea rutas si el rol del usuario no esta permitido
function verificarSesion(req, res, next) {
    if (req.session && req.session.usuario) {
        return next();
    }
    res.redirect('/login?mensaje=Debes iniciar sesion para continuar.');
}

// Uso para poder verificarRol('Oficial de Cumplimiento', 'Analista')
function verificarRol(...roles) {
    return function(req, res, next) {
        if (!req.session || !req.session.usuario) {
            return res.redirect('/login?mensaje=Debes iniciar sesion para continuar.');
        }
        if (roles.includes(req.session.usuario.rol)) {
            return next();
        }
        // Redirigir segun el rol para que no se muestre 1pantalla en blanco
        //esto despues puede ser un test
        const rol = req.session.usuario.rol;
        if (rol === 'Cliente') return res.redirect('/portal/mi-expediente?mensaje=Sin acceso.');
        res.redirect('/dashboard?mensaje=No tienes permiso para acceder a esa seccion.');
    };
}

module.exports = { verificarSesion, verificarRol };
