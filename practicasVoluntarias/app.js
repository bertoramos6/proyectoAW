"use strict";
const express = require('express');
const path = require('path');
const morgan = require("morgan");
const multer = require('multer');
const DAODestino = require("./database/DAODestino");  
const DAOReserva = require("./database/DAOReserva");  
const daoReserva = new DAOReserva();
const daoDestino = new DAODestino();
const app = express();

const storage = multer.memoryStorage(); // Almacenar los datos en memoria en lugar de en archivos
const upload = multer({ storage: storage });

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//middleware de registro de peticiones morgan
app.use(morgan("dev"));

// Ficheros estáticos
app.use(express.static(path.join(__dirname, 'public'))); 

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
      //Si no existe el destino URL va a el middleware de rutas no encontrada
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

//Se llama desde el cliente a /form
app.post("/form",upload.none(),function(request, response,next){
  //Parseamos para que en el DAO no de error
  const requestData = JSON.parse(JSON.stringify(request.body));
  daoDestino.buscarDestino(requestData.dest, (err, dest) => {
    if (err) {
      next(err);
    } else {  
        requestData.destId = dest.id;
        daoReserva.insertarReserva(requestData, (err, resv) => {
          if (err) 
            next(err);
        });
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
    console.error(err);
  } else {
    console.log("Servidor corriendo en el puerto 3000");
  }
});

