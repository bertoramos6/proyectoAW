"use strict";
const db = require("./configuration"); // conexion BBDD

class DAOComentario{
    pool;

    constructor(){
        this.pool = db.getPool();
    }

    buscarComentariosDestino(destId, callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `SELECT * FROM comentarios WHERE destino_id = ?`, [destId],
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

    insertarComentario(comentario, callback){
        this.pool.getConnection((err, connection) => {
            if (err) {
                callback(err)
            } else {
                connection.query(
                    `INSERT INTO comentarios (destino_id, id_usuario, nombre_usuario, comentario, fecha_comentario)
                    VALUES (?,?,?,?,?)`,
                    [comentario.destId, comentario.idUsuario, comentario.nombreUsuario, comentario.comentario, comentario.fechaComentario],
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