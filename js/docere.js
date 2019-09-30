// Carga los módulos empleados
var http = require('http');
var url = require('url');
var fs = require('fs');
var mysql = require('mysql');
var qs = require('querystring');

//Inicializa variables globales


//Conecta con la base de datos
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "mysqlpass",
    database: 'atenea'
});

con.connect(function(err) {
	if (err) throw err;
	console.log('connected!');
});

//Crea el servidor web en el puerto 8080
http.createServer(function (req, res) {
	
	var q = url.parse(req.url, true);
	
	//muestra el path del archivo solicitado
	console.log('path '+q.pathname);
	
	//si no se ha especificado el archivo, toma index.html por defecto	
	if(q.pathname=='/'){
		q.pathname='/index.html';
	}

	// Actuamos en función del método (POST, GET)
	if (req.method != 'POST') {//Si el método no es POST, devuelve la página solicitada
		console.log('default '+'..' + q.pathname);	
		//lee el archivo especificado	
		fs.readFile('..'+q.pathname, function(err, data) {
			if (err) { // Si no eiste o se produce un error, lo indica
			  res.writeHead(404, {'Content-Type': 'text/html'});
			  res.write(q.pathname+' - error 404 - File not found');
			  res.end();
			}else{ // Si existe lo lee y lo envía
			  res.writeHead(200, {'Content-Type': 'text/html'});
			  res.write(data);
			  res.end();		  
			}
		});
				
	}else{//Si el método es POST, espera a recibir los datos
		//Cuando recibe los datos los convierte en string que usamos como condición de búsqueda
        req.on('data', function(chunk){
//            cond = chunk.toString();
			cond = chunk.toString();
			console.log('la condicion es: '+cond);
        })
		//Cuando termina de recibir los datos los procesa
        req.on('end', function(){
			//decide la acción en funcion de la url
			switch(q.pathname){
				case '/ultimos_cursos':
					ultimos_cursos();
			}
        })	
	}
	
	function ultimos_cursos(cond){
		con.query("SELECT idCurso, titulo, precio, categoria, idioma_curso, imagen, fecha_inclusion FROM tcursos ORDER BY fecha_inclusion DESC LIMIT 5;", function (err, result, fields) {
			if (err) throw err;
			car_curso='';
			for(var i=0; i<result.length; i++){
				car_curso+='<div class="item h-100 col-lg-4 align-self-stretch border boder-primary"><figure class="m-0"><a href="#"><img style ="width:100%" src="'+result[i].imagen+'" alt="Image" class="img-fluid"></a></figure><div class="py-4 px-4"><span class="course-price">'+result[i].precio+'</span><div class="meta"><span class="icon-clock-o"></span>'+result[i].fecha_inclusion+'</div><h3><a href="#" id="link_to_curso">'+result[i].titulo+'</a></h3><p>Lorem ipsum dolor sit amet ipsa nulla adipisicing elit. </p></div><div class="d-flex border-top stats"><div class="py-3 px-4">2,193 students</div><div class="py-3 px-4 w-25 ml-auto border-left"><span class="icon-chat"></span> 2</div></div></div>';
			};
			res.writeHead(200, {'Content-Type': 'text/html', 'charset': 'utf-8'});
			res.write(car_curso);
			res.end();
		})
	}

}).listen(8080); 

