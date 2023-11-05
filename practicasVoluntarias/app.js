"use strict";
const express = require('express');
const path = require('path');
const morgan = require("morgan");
const DAODestino = require("./database/DAODestino")  
const daoDestino = new DAODestino();
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//middleware de registro de peticiones morgan
app.use(morgan("dev"));

// Ficheros estáticos
app.use(express.static(path.join(__dirname, 'public'))); 

//app.use('/', indexRouter);
//app.use('/users', usersRouter);

//Ruta principal
app.get("/", function(request, response,next) {
  response.status(200);
  daoDestino.buscarTodosDestinos((err, dest) => {
    if (err) {
      next(err);
    } else {
        dest.forEach(d => {
          d.imagen = JSON.parse(d.imagen); //Parseamos bien el JSON
        });
        response.render("index", {destinos : dest});
    }
  });
});

//Parametrico para cada posible destino
app.get("/:dest", function(request, response,next){
  const destino = request.params.dest;
  response.status(200);
  daoDestino.buscarDestino(destino, (err, dest) => {
    if (err) {
      next(err);
    } else {  
      //el destion URL no existe
      if(dest === undefined)
        next();
      else{
        //Parseamos el JSON para que este bien
        dest.imagen = JSON.parse(dest.imagen);
        dest.descripcion = JSON.parse(dest.descripcion);
        response.render("destino", {dest: dest});
      }
    }
  });
});

// Middleware para manejar rutas no encontradas
app.use((request, response, next) => {
  const error = new Error("Página no encontrada");
  error.status = 404;
  next(error);
});


//middleware de errores 
app.use((error, request, response, next) => {
  // Código 500: Internal server error
  response.status(error.status || 500);
  response.render("error", {
    status : error.status,
    mensaje: error.message,
    pila: error.stack
  });
});



app.listen(3000, function(err) {
  if (err) {
    console.log(err);
  } else {
    console.log("Servidor corriendo en el puerto 3000");
  }
});

module.exports = app;
