"use strict";
const db = require("./configuration"); // conexion BBDD

class DAOComentario{
    pool;

    constructor(){
        this.pool = db.getPool();
    }

    buscarTodosComentarios(callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `SELECT * FROM comentarios`,
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

    insertarComentario(reserva,callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `INSERT INTO comentario (destino_id, id_usuario, nombre_usuario, comentario, fecha_comentario)
                    VALUES (?,?,?,?,?)`,
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


    terminarConexion(callback){
        this.pool.end();
    }
}

module.exports = DAOComentario;