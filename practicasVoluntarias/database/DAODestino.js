"use strict";
const db = require("./configuration"); // Info de la conexion con la BBDD

class DAODestino {
    pool;

    constructor() {
        this.pool = db.getPool();
    }

    buscarTodosDestinos(callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `SELECT nombre,imagen,precio FROM destinos`,
                    function(err, rows){
                        connection.release();
                        if(err){
                            callback(err, null);
                        }
                        else{
                            let data = JSON.parse(JSON.stringify(rows));
                            callback(null, data); //devolvemos todo
                        }
                    }
                )
            }
        });
    }

    buscarDestino(str, callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `SELECT * FROM destinos WHERE nombre = ?`,
                    [str],
                    function(err, rows){
                        connection.release();
                        if(err){
                            callback(err, null);
                        }
                        else{
                            let data = JSON.parse(JSON.stringify(rows));
                            callback(null, data[0]); //devolvemos solo uno
                        }
                    }
                )
            }
        });
    }

    terminarConexion(callback) {
        this.pool.end();
    }
}

module.exports = DAODestino;