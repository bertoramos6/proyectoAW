"use strict";
const express = require('express');
const path = require('path');
const DAODestino = require("./database/DAODestino")  
const daoDestino = new DAODestino();
const app = express();
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));

//app.use('/', indexRouter);
//app.use('/users', usersRouter);
app.get("/", function(request, response) {
  response.status(200);
  daoDestino.buscarTodosDestinos((err, dest) => {
    if (err) {
        console.error("Error al buscar el usuario:", err);
    } else {
        dest[0].imagen = JSON.parse(dest[0].imagen);
        console.log(dest);
        response.render("index", {destinos : dest});
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
