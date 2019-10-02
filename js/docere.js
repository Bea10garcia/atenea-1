// Carga los módulos empleados
var http = require('http');
var url = require('url');
var fs = require('fs');
var mysql = require('mysql');
var qs = require('querystring');
var crypto = require('crypto');

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
http.createServer(function(req, res) {

    var q = url.parse(req.url, true);

    //muestra el path del archivo solicitado
    console.log('path ' + q.pathname);

    //si no se ha especificado el archivo, toma index.html por defecto	
    if (q.pathname == '/') {
        q.pathname = '/index.html';
    }

    // Actuamos en función del método (POST, GET)
    if (req.method != 'POST') { //Si el método no es POST, devuelve la página solicitada
        console.log('default ' + '..' + q.pathname);
        //lee el archivo especificado	
        fs.readFile('..' + q.pathname, function(err, data) {
            if (err) { // Si no eiste o se produce un error, lo indica
                res.writeHead(404, { 'Content-Type': 'text/html' });
                res.write(q.pathname + ' - error 404 - File not found');
                res.end();
            } else { // Si existe lo lee y lo envía
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.write(data);
                res.end();
            }
        });

    } else { //Si el método es POST, espera a recibir los datos
        //Cuando recibe los datos los convierte en string que usamos como condición de búsqueda
        req.on('data', function(chunk) {
            //            cond = chunk.toString();
            cond = chunk.toString();
            console.log('la condicion es: ' + cond);
        })
        //Cuando termina de recibir los datos los procesa
        req.on('end', function() {
            //decide la acción en funcion de la url
            switch (q.pathname) {
                case '/ultimos_cursos':
                    ultimos_cursos();
                    break;
                case '/random_profes':
                    random_profes();
                    break;
                case '/crear_usuario':
                    console.log('voy a crear el alumno ' + cond);
                    crear_usuario(cond);
                    break;
                case '/cargar_categorias':
                    console.log('cargo categorias');
                    cargar_categorias();
                    break;
                case '/cargar_idiomas':
                    console.log('cargo idiomas');
                    cargar_idiomas();
                    break;
                case '/crear_curso':
                    crear_curso(cond);
                    break;
            }
        })
    }

    function random_profes(cond) {
        con.query("SELECT * FROM atenea.tUsuarios WHERE rol = 3", function(err, result, fields) {
            console.log(result.length);
            if (err) throw err;

            profesores = '';
            for (var i = 0; i < 3; i++) {
                console.log("hola!!!")
                profesores += '<div class="col-md-6 col-lg-4"><div class="profe_ficha text-center"><img id="foto_profe_1" src="' + result[i].foto + '" alt="Image" class="img-fluid w-50 rounded-circle mx-auto mb-4"><div class="py-2"><h3 class="nombre">' + result[i].nombre + ' ' + result[i].apellidos + '</h3> <p class="posicion">' + result[i].email + '</p><p class="bio">' + result[i].datosAcademicos + '</p></div></div></div>';

            };

            res.writeHead(200, { 'Content-Type': 'text/html', 'charset': 'utf-8' });


            res.end(profesores);
            console.log(profesores);
            //res.end();
        })
    }

    function crear_curso(cond) {
    	/*SACO FECHA PARA FECHA INCLUSION*/
    	var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();

        today = mm + '/' + dd + '/' + yyyy;
        var datos = qs.parse(cond);

        con.query("INSERT INTO tcursos (titulo, categoria, precio, idioma_curso, fecha_inclusion, descripcion, validado) VALUES ('" + datos.ftitulo + "','" + datos.fidcategoria + "','" + datos.fprecio + "','" + datos.fididioma + "','" + today + "','" + datos.fdescripcion + "','0');", function(err, result, fields) {
            if (err) throw err;
            var idnuevocurso=result.insertId;
            console.log(idnuevocurso);
            /*COMO LOS VIDEOS VAN EN OTRA TABLA, HAY QUE HACER UN BUCLE POR TODOS LOS VIDEOS PARA PODER METERLO*/
	        console.log(datos.video.length);
	        for (var i = 0; i < datos.video.length; i++) {
                var numeroleccion= i+1;
	        	con.query("INSERT INTO tvideos(idcurso, url,leccion) VALUES('"+idnuevocurso+"','" + datos.video[i] + "','"+numeroleccion+"')", function(err, result, fields) {
                    if (err) throw err;
                })
	        }
            res.end();

        	});
    };

    function crear_usuario(cond) {

    	/*SACO FECHA PARA FECHA INCLUSION*/
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();

        today = mm + '/' + dd + '/' + yyyy;
        var datos = qs.parse(cond);
        var alias = datos.falias;
        console.log(alias);
        /*ANTES DE ENVIAR NADA ENCRIPTAMOS CONTRASEÑA, ACCEDIENDO A SU VALOR*/
        pass_noencriptada= datos.fpassword;
        var mykey = crypto.createCipher('aes-128-cbc', 'mypassword');
        var pass_encriptada = mykey.update(pass_noencriptada, 'utf8', 'hex');
        pass_encriptada += mykey.final('hex');
        console.log(pass_noencriptada);
        console.log(pass_encriptada);
        /*con.query("SELECT * FROM atenea.tUsuarios WHERE alias = '" + alias + "';", function(err, result, fields) {
            if (err) throw err;
            if (result.length > 0) {
                console.log("Mierda");

                res.end('alias_existente');

            }
        });*/
        
        con.query("INSERT INTO tusuarios (rol, alias, nombre , apellidos ,  fechaNacimiento, email, telefono , datosFacturacion, password, datosAcademicos, validado ,fechaInscripcion) VALUES ('" + datos.frol + "','" + datos.falias + "','" + datos.fnombre + "', '" + datos.fapellidos + "', '" + datos.ffechaNacimiento + "','" + datos.femail + "', '" + datos.ftelefono + "', '" + datos.fdatosFacturacion + "', '" + pass_encriptada + "', '" + datos.fdatosAcademicos + "', '0' , '" + today + "')", function(err, result, fields) {
            if (err) throw err;
            console.log("metiendo alumno");
            //Devuelve la respusta (toda la tabla o los datos de un alumno
            res.writeHead(200, { 'Content-Type': 'text/html', 'charset': 'utf-8' });
            res.write('¡Información actualizada con éxito!');
            res.end();
        });
        
    }

    function ultimos_cursos(cond) {
        con.query("SELECT idCurso, titulo, precio, categoria, idioma_curso, imagen, fecha_inclusion FROM tcursos ORDER BY fecha_inclusion DESC LIMIT 5;", function(err, result, fields) {
            if (err) throw err;
            car_curso = '';
            for (var i = 0; i < result.length; i++) {
                car_curso += '<div class="item h-100 col-lg-4 align-self-stretch border boder-primary"><figure class="m-0"><a href="#"><img style ="width:100%" src="' + result[i].imagen + '" alt="Image" class="img-fluid"></a></figure><div class="py-4 px-4"><span class="course-price">' + result[i].precio + '</span><div class="meta"><span class="icon-clock-o"></span>' + result[i].fecha_inclusion + '</div><h3><a href="#" id="link_to_curso">' + result[i].titulo + '</a></h3><p>Lorem ipsum dolor sit amet ipsa nulla adipisicing elit. </p></div><div class="d-flex border-top stats"><div class="py-3 px-4">2,193 students</div><div class="py-3 px-4 w-25 ml-auto border-left"><span class="icon-chat"></span> 2</div></div></div>';
            };
            res.writeHead(200, { 'Content-Type': 'text/html', 'charset': 'utf-8' });
            res.write(car_curso);
            res.end();
        })
    }

    function cargar_categorias(cond) {
        con.query("SELECT * FROM atenea.tcategorias;", function(err, result, fields) {
            if (err) throw err;
            todascategorias = '<option>Selecciona una</option>';
            for (var i = 0; i < result.length; i++) {
                console.log('meto categoria' + result[i].categoria);
                todascategorias += '<option id="' + result[i].idtcategorias + '">' + result[i].categoria + '</option>';

            };
            res.writeHead(200, { 'Content-Type': 'text/html', 'charset': 'utf-8' });
            res.end(todascategorias);
            console.log(todascategorias)

        })
    }

    function cargar_idiomas(cond) {
        con.query("SELECT * FROM atenea.tidiomas;", function(err, result, fields) {
            if (err) throw err;
            todosidiomas = '<option>Selecciona uno</option>';
            for (var i = 0; i < result.length; i++) {
                console.log('meto idiomas' + result[i].idioma);
                todosidiomas += '<option id="' + result[i].ididiomas + '">' + result[i].idioma + '</option>';

            };
            res.writeHead(200, { 'Content-Type': 'text/html', 'charset': 'utf-8' });
            res.end(todosidiomas);
            console.log(todosidiomas)

        })
    }

}).listen(8080);