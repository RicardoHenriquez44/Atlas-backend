const { Pool } = require("pg");
require("dotenv").config();

// Se elimina el string hardcodeado para evitar la exposición de credenciales
const connectionString = process.env.DATABASE_URL;

const pool = new Pool({ connectionString });

module.exports = { pool };