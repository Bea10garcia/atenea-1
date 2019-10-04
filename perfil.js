var mysql = require('mysql');
var express = require('express');
var app = express();

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

//Conecta con la base de datos
var con = mysql.createConnection({
    host: "localhost",
    user: "bea",
    password: "1234",
    database: 'atenea'
});


con.connect(function(err) {
    if (err) throw err;
    console.log('connected!');
});

//  CARGAMOS DATOS PERFIL ALUMNO
app.post('/perfil', function(req, res) {
            var id = req.body.idUsuario;
            console.log(id)
            con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
            //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
                res.send(JSON.stringify(result));
                //console.log(result)
            });
        });

//  CARGAMOS DATOS PERFIL PROFE
app.post('/perfilProfe', function(req, res) {
            var id = req.body.idUsuario;
            console.log(id)
            con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password, datosAcademicos FROM tusuarios WHERE idUsuario=5", function(err, result, fields) {
            //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
                res.send(JSON.stringify(result));
                //console.log(result)
            });
        });

//  CARGAMOS DATOS PERFIL EMPRESA
app.post('/perfilEmpresa', function(req, res) {
            var id = req.body.idUsuario;
            console.log(id)
            con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, cif, password FROM tusuarios WHERE idUsuario=8", function(err, result, fields) {
            //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
                res.send(JSON.stringify(result));
                //console.log(result)
            });
        });

            /*
function datosUsuario(cond) {
    var datos = qs.parse(cond);
    con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion FROM tusuarios WHERE tusuarios.idUsuario= 1", function(err, result, fields) {
        if (err) throw err;
        rta = JSON.stringify(result);
        res.send(rta);
    });
}
*/

            app.use(express.static('html'));

            app.listen(8080, function() {
                console.log('Example app listening on port 8080!');
            });