// Configuración de conexión a Supabase
// Las credenciales se leen de variables de entorno — nunca hardcodeadas en el código

const { createClient } = require('@supabase/supabase-js');

const supabaseUrl  = process.env.SUPABASE_URL;
const supabaseAnonKey = process.env.SUPABASE_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
    throw new Error('Faltan variables de entorno: SUPABASE_URL y SUPABASE_KEY son requeridas');
}

const supabase = createClient(supabaseUrl, supabaseAnonKey);

module.exports = supabase;
