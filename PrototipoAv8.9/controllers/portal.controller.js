// controllers/portal.controller.js
// Portal del cliente que ahora solo ve su propio expediente, operaciones y contratos

const supabase = require('../config/supabase');

module.exports.MiExpediente = async (req, res) => {
    const idcliente = req.session.usuario.idcliente;
    if (!idcliente) {
        return res.render('./portal/mi_expediente', {
            cliente: null, documentos: [],
            mensaje: 'No se encontró tu expediente vinculado. Contacta a soporte.'
        });
    }
    try {
        const [rc, rd] = await Promise.all([
            supabase.from('cliente').select('*').eq('idcliente', idcliente).single(),
            supabase.from('documentocliente').select('*').eq('idcliente', idcliente)
        ]);
        res.render('./portal/mi_expediente', {
            cliente: rc.data || null, documentos: rd.data || [], mensaje: null
        });
    } catch {
        res.render('./portal/mi_expediente', { cliente: null, documentos: [], mensaje: 'Error al cargar tu expediente. Intenta de nuevo o contacta a soporte' });
    }
};

module.exports.MisOperaciones = async (req, res) => {
    const idcliente = req.session.usuario.idcliente;
    let operaciones = [];
    if (idcliente) {
        const { data } = await supabase.from('operacion').select('*')
            .eq('idcliente', idcliente).order('idoperacion', { ascending: false });
        operaciones = data || [];
    }
    res.render('./portal/mis_operaciones', { operaciones });
};

module.exports.MisContratos = async (req, res) => {
    const idcliente = req.session.usuario.idcliente;
    let contratos = [];
    if (idcliente) {
        const { data } = await supabase.from('contrato').select('*')
            .eq('idcliente', idcliente).order('idcontrato', { ascending: false });
        contratos = data || [];
    }
    res.render('./portal/mis_contratos', { contratos });
};
