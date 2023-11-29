"use strict";
const conf = require("./database/configuration")

const express = require('express');
const path = require('path');
const morgan = require("morgan");
const multer = require('multer');
const session = require('express-session');
const mysqlSession = require("express-mysql-session"); 
const bcrypt = require('bcrypt');
const { check, validationResult } = require("express-validator");
const DAODestino = require("./database/DAODestino");  
const DAOReserva = require("./database/DAOReserva");  
const DAOUsuario = require('./database/DAOUsuario')
const daoReserva = new DAOReserva();
const daoDestino = new DAODestino();
const daoUsuario = new DAOUsuario();
const app = express();

const storage = multer.memoryStorage(); // Almacenar los datos en memoria en lugar de en archivos
const upload = multer({ storage: storage });
const MySQLStore = mysqlSession(session);
const sessionStore = new MySQLStore(conf.connection);
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//middleware de registro de peticiones morgan
app.use(morgan("dev"));

app.use(session({
  saveUninitialized: false,
  secret: "foobar34",
  resave: false,
  store: sessionStore
}))

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

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

        let datos = {};
        datos.destinos = dest;

        if(request.session.user !== undefined){
          console.log("Sesion Abierta")
          datos.session = request.session.user.correo;
        }

        console.log(datos)
        response.render("index", {datos});
    }
  });
});

app.post("/login",upload.none(), function(req, res) {
  const { correo, contrasena } = req.body
  daoUsuario.buscarPorEmail(correo, (err, usr) => {
    if (err) {
      next(err);
    } else {  
      if(usr === undefined){
        console.log("Email no existe");
        return;
      }

      bcrypt.compare(contrasena, usr.contraseña, (err, valid) => {
        if (err) {
          next(err);
        } 
        if (valid) {
          req.session.user = { correo, id: usr.id };
          res.redirect("/");
        } else {
          console.log("Contraseña invalida");
          res.status(401).end(); // contraseña invalida
        }
      });
    }
  });    
});

//Ruta de registro
app.get("/registroUsuario", function(req, res, next) {
  res.status(200);
  res.render("registroUsuario", { errores: {} });
});

// Ruta de registro (POST)
app.post("/registroUsuario", upload.none(),function(req, res, next) {
  // Recoger los datos del formulario
  check("nombre", "El nombre es obligatorio").notEmpty();
  check("email", "El email es obligatorio").notEmpty();
  check("email", "El email no es válido").isEmail();
  check("contrasena", "La contraseña es obligatoria").notEmpty();
  check("nombre", "El nombre no puede contener números").matches(/^[a-zA-Z]+$/);
  check("apellidos", "Los apellidos no pueden contener números").matches(/^[a-zA-Z]+$/);
  
  let datos = {};
  datos.nombre = req.body.nombre;
  datos.email = req.body.email;
  datos.contrasena =  bcrypt.hashSync(req.body.contrasena,11); //encriptar contraseña

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    // Si hay errores, renderizamos la vista de registro de nuevo con los errores
    return res.render("registroUsuario", { errores: errors.array() });
  } else {
    daoUsuario.insertarUsuario(datos, (err, usr) => {
      if (err) {
        next(err);
      } else {  
        req.session.user = { email, id: userData.id };
        res.redirect("/");
      }
    });    
  }
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
        if(request.session.user !== undefined){
          console.log("Sesion Abierta")
          dest.session = request.session.user.correo;
        }
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

