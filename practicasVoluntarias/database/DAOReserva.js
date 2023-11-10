"use strict";
const db = require("./configuration"); // Info de la conexion con la BBDD

class DAOReserva {
    pool;

    constructor() {
        this.pool = db.getPool();
    }

    insertarReserva(reserva,callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `INSERT INTO reservas (destino_id, nombre_cliente, primer_apll, segundo_apll, correo_cliente, fecha_inicio, fecha_fin)
                    VALUES (?,?,?,?,?,?,?)`,
                    [reserva.destId, reserva.nombre, reserva.primerApellido, reserva.segundoApellido, reserva.emailReserva, reserva.inicio, reserva.fin],
                    function(err, rows){
                        connection.release();
                        if(err){
                            callback(err,null);
                        }
                        else{
                            callback(null,rows.insertId) //devolvemos el id devulto por la BD
                        }
                    }
                )
            }
        });
    }

    //TODO Nos puede servir en un futuro
    buscarPorNombre(str, callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `SELECT * FROM reservas WHERE nombre_cliente = ?`,
                    [str],
                    function(err, rows){
                        connection.release();
                        if(err){
                            callback(err, null);
                        }
                        else{
                            let data = JSON.parse(JSON.stringify(rows));
                            callback(null, data); //devolvemos todas las reservas del cliente
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

module.exports = DAOReserva;