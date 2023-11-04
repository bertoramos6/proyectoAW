"use strict";
const express = require('express');
const path = require('path');
const DAODestino = require("./database/DAODestino")  
const daoDestino = new DAODestino();
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.static(path.join(__dirname, 'public'))); // Ficheros estáticos

//app.use('/', indexRouter);
//app.use('/users', usersRouter);

//Ruta principal
app.get("/", function(request, response) {
  response.status(200);
  daoDestino.buscarTodosDestinos((err, dest) => {
    if (err) {
        console.error("Error al buscar el usuario:", err);
    } else {
        dest.forEach(d => {
          d.imagen = JSON.parse(d.imagen); //Parseamos bien el JSON
        });
        response.render("index", {destinos : dest});
    }
  });
});

//Parametrico para cada posible destino
app.get("/:dest", function(request, response){
  const destino = request.params.dest;
  response.status(200);
  daoDestino.buscarDestino(destino, (err, dest) => {
    if (err) {
      console.error("Error al buscar el usuario:", err);
    } else {
      //Parseamos el JSON para que este bien
      dest.imagen = JSON.parse(dest.imagen);
      dest.descripcion = JSON.parse(dest.descripcion);
      response.render("destino", {dest: dest});
    }
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
