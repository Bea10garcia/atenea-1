var mysql = require('mysql');
var express = require('express');
var app = express();

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

//Conecta con la base de datos
var con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "1234",
	database : 'atenea'
});


con.connect(function(err) {
	if (err) throw err;
	console.log('connected!');
});


app.post('/inputbuscador', function (req, res) {
    
    
  con.query("SELECT descripcion FROM atenea.tcursos;", function (err, result, fields) {
      
       res.send(JSON.stringify(result));
      

  });
});


app.post('/inputCat', function (req, res) {
    
    
    con.query("SELECT * FROM atenea.tcategorias;", function (err, result, fields) {
        
         res.send(JSON.stringify(result));
        

    });
});

app.post('/inputProf', function (req, res) {
    var id = req.body;
    console.log(id)
    con.query("SELECT apellidos, nombre FROM atenea.tusuarios WHERE rol=3;", function (err, result, fields) {
        
         res.send(JSON.stringify(result));
        

    });
});

app.post('/inputurl', function (req, res) {
    
    
  con.query("SELECT url FROM atenea.tvideos;", function (err, result, fields) {
      
       res.send(JSON.stringify(result));
      

  });
});

app.use(express.static('./..'));


app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});

// JavaScript Document