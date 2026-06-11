# CoreData Consulting — Sistema PLD para SVA LAW

Sistema web de cumplimiento en materia de Prevención de Lavado de Dinero (PLD/FT), desarrollado para SVA LAW.



## Tecnologías utilizadas



* Node.js 18+ / Express
* EJS (vistas)
* Supabase (PostgreSQL)
* RBAC middleware



## Requisitos



* Node.js v18 o superior
* npm v9 o superior
* Cuenta en Supabase (plan gratuito funciona)
* 

## Instalación local



1. Clonar el repositorio:

```
git clone https://github.com/ElPadrino23/Core-Data-Consulting.git
cd Core-Data-Consulting/Prototipo\_Funcional-main
```

2. Instalar dependencias:

```
npm install
```

3. Crear archivo `.env` en la raíz del proyecto con las siguientes variables:

```
SUPABASE\_URL=https://tu-proyecto.supabase.co
SUPABASE\_KEY=tu-anon-key
SESSION\_SECRET=cadena-secreta
PORT=3000
```

4. Iniciar el servidor:

```
node index.js
```

5. Abrir en el navegador:

```
http://localhost:3000/login
```

## Despliegue en Coolify



* **Base Directory:** `/Prototipo\_Funcional-main`
* **Install Command:** `npm install`
* **Start Command:** `node index.js`
* **Puerto:** `3000`
* **Variables de entorno:** agregar `SUPABASE\_URL`, `SUPABASE\_KEY` y `SESSION\_SECRET` en el panel de Environment Variables de Coolify
* Enlace arrojado al despliegue del sistema:



http://z9553xx3agt0w6wvc68unscb.198.211.99.43.sslip.io/login



## Base de datos



PostgreSQL alojado en Supabase. El esquema cuenta con 16 tablas que cubren todos los módulos del sistema. La base de datos ya está provisionada por lo que no se requiere de correr diferentes migraciones adicionales.



## Equipo



* Carlos Arturo Gómez Ayala — A01711027
* Luis Enrique de la Cruz Ambrosio — A01612863
* Luis Fernando Martínez Barragán — A01613426

