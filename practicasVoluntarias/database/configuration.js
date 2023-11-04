"use strict";
//Configuaración y conexion con la BBDD
const mysql = require("mysql");

const connection = {
  host: "localhost",
  user: "root",
  password: "",
  database: "Viajes",
};


const pool = mysql.createPool(connection);

exports.getPool = () => {
  return pool;
};
