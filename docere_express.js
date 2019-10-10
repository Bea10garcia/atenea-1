const PORT = process.env.PORT || 8080; // constante para nuestro puerto
var mysql = require('mysql');
var express = require('express'); //importamos servidor de express
var app = express();
var crypto = require('crypto');

// INICIO parte 1 subir archivos
const path = require('path'); //dependencia path para trabajar con las ruta a la hora de enviar el archivo
const multer = require('multer'); // biblioteca que ayuda a gestionar el formato del archivo para poder trabajar con el format-data, en el body del objeto request habilitará la propiedad file y poder manipularla

var storage = multer.diskStorage({
    destination: (req, file, cb) => { //cb es el callback, usamos la función arrow
        cb(null, './subidas') //el primer parámetro de callbacj es null y luego la ruta de nuestra carpeta donde se subirán los archivos
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname * '-' * Date.now() * path.extname(file.originalname));
    }
});

const upload = multer({ storage });
// FIN parte 1 subir archivos

/*
// para permitir que el cliente envíe datos
var body_parser   = require('body-parser');
app.use(body_parser()) //Express 4

// para que el cliente nos envíe archivos
var multipart = require('connect-multiparty');
app.use(multipart()) //Express 4
 */

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

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


// INICIO para averiguar por consola de cmd qué hash es cada contraseña
var crypto = require('crypto');

var mykey = crypto.createCipher('aes-128-cbc', 'mypassword');
var mystr = mykey.update('Aidi1234', 'utf8', 'hex')
mystr += mykey.final('hex');

console.log(mystr);
// FIN contraseña

// INICIO parte 2 subir archivos

app.get('/', (req, res) => {
    return res.send('Esta es la home');
});

app.post('/subir', upload.single('file'), (req, res) => {
    console.log('La ruta de subida es $){req.hostname}/${req.file.path}');
    return res.send(req.file);
});

//app.listen(PORT, ()=> console.log('El servidor está en el puerto:'));

// FIN parte 2 subir archivos

//  CARGAMOS DATOS PERFIL ALUMNO
app.post('/perfil', function(req, res) {
    var id = req.body.idUsuario;
    console.log(id);
    con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password, datosAcademicos, foto FROM tusuarios WHERE idUsuario='" + id + "'", function(err, result, fields) {
        //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
        res.send(JSON.stringify(result));
        console.log(result)
    });
});

//  CARGAMOS DATOS PERFIL PROFE
app.post('/perfilProfe', function(req, res) {
    var id = req.body.idUsuario;
    console.log(id);
    con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password, datosAcademicos, foto FROM tusuarios WHERE idUsuario='" + id + "'", function(err, result, fields) {
        //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
        res.send(JSON.stringify(result));
        console.log(result);
    });
});

//  CARGAMOS DATOS PERFIL EMPRESA
app.post('/perfilEmpresa', function(req, res) {
    var id = req.body.idUsuario;
    console.log(id)
    con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, cif, foto, password, datosAcademicos FROM tusuarios WHERE idUsuario='" + id + "'", function(err, result, fields) {
        //con.query("SELECT alias, nombre, apellidos, fechaNacimiento, email, telefono, datosFacturacion, password FROM tusuarios WHERE idUsuario=2", function(err, result, fields) {
        res.send(JSON.stringify(result));
        //console.log(result)
    });
});

//  CARGAMOS LICENCIAS EMPRESA
app.post('/numeroLicencia', function(req, res) {
    var id = req.body;
    console.log(id)
    con.query("SELECT licencia FROM licencias WHERE idEmpresa='" + id + "'", function(err, result, fields) {
        res.send(JSON.stringify(result));
        console.log(result)
    });
});

/*
// SUBIR ARCHIVOS CON EXPRESS.JS
app.post('/upload', function(req, res) {
   //El modulo 'fs' (File System) que provee Nodejs nos permite manejar los archivos
   var fs = require('fs')

   var path = req.files.archivo.path
   var newPath = 'carpetaArchivos'

   var is = fs.createReadStream(path)
   var os = fs.createWriteStream(newPath)

   is.pipe(os)

   is.on('end', function() {
      //eliminamos el archivo temporal
      fs.unlinkSync(path)
   })
   res.send('¡archivo subido!')
})
*/
// EDITAMOS DATOS PERFIL

app.post('/editarUsuario', function(req, res) {
    var body = req.body;
    console.log("body=" + body.idUsuario + " - " + body.alias);
    var id = body.idUsuario;
    // para encriptar la nueva contraseña que edite el usuario
    pass_noencriptada = body.password;
    var mykey = crypto.createCipher('aes-128-cbc', 'mypassword');
    var pass_encriptada = mykey.update(pass_noencriptada, 'utf8', 'hex');
    pass_encriptada += mykey.final('hex');
    console.log(pass_noencriptada);
    console.log(pass_encriptada);
    var sql = "UPDATE tusuarios SET alias ='" + body.alias + "', nombre = '" + body.nombre + "', fechaNacimiento = '" + body.nacimiento + "', email = '" + body.email + "', telefono = '" + body.telefono + "', datosFacturacion = '" + body.facturacion + "', password = '" + pass_encriptada + "', cif = '" + body.cif + "', datosAcademicos = '" + body.bio + "' WHERE idUsuario=" + id;
    console.log('-----------' + sql);
    con.query(sql, function(err, result, fields) {
        if (err) throw err;
        console.log("editando alumno" + result);
        res.send('¡Información actualizada con éxito!');
    })
});

//COGER ULTIMOS 5 CURSOS
app.post('/ultimos_cursos', function(req, res) {

    con.query("SELECT idCurso, titulo, precio, categoria, idioma_curso, imagen, fecha_inclusion FROM tcursos ORDER BY fecha_inclusion DESC LIMIT 5;", function(err, result, fields) {
        if (err) throw err;
        car_curso = '';
        for (var i = 0; i < result.length; i++) {
            car_curso += '<div class="ficha_curso item h-100 col-lg-12 align-self-stretch border boder-primary"><div class="pt-3"><figure class="m-0"><a href="#"><img style ="height:25vh; overflow:hidden" src="' + result[i].imagen + '" alt="Image" class=" img-fluid"></a></figure></div><div class="py-4 px-4"><span class="course-price">' + result[i].precio + '</span><div class="meta"><span class="icon-clock-o"></span>' + result[i].fecha_inclusion + '</div><h3><a href="#" id="link_to_curso">' + result[i].titulo + '</a></h3><p>Lorem ipsum dolor sit amet ipsa nulla adipisicing elit. </p></div><div class="d-flex border-top stats"><div class="py-3 px-4">2,193 students</div><div class="py-3 px-4 w-25 ml-auto border-left"><span class="icon-chat"></span> 2</div></div></div>';
        };
        res.send(car_curso);
    })

});

app.post('/random_profes', function(req, res) {
    con.query("SELECT * FROM atenea.tUsuarios WHERE rol = 3", function(err, result, fields) {
        console.log(result.length);
        if (err) throw err;

        profesores = '';
        for (var i = 0; i < 3; i++) {
            console.log("hola!!!")
            profesores += '<div class="col-md-6 col-lg-4"><div class="profe_ficha text-center"><img id="foto_profe_1" src="' + result[i].foto + '" alt="Image" class="img-fluid w-50 rounded-circle mx-auto mb-4"><div class="py-2"><h3 class="nombre">' + result[i].nombre + ' ' + result[i].apellidos + '</h3> <p class="posicion">' + result[i].email + '</p><p class="bio">' + result[i].datosAcademicos + '</p></div></div></div>';

        };
        res.send(profesores);
        console.log(profesores);
        //res.end();
    })
});

app.post('/crear_usuario', function(req, res) {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    var datos = req.body;
    var alias = datos.falias;
    console.log(alias);
    /*ANTES DE ENVIAR NADA ENCRIPTAMOS CONTRASEÑA, ACCEDIENDO A SU VALOR*/
    pass_noencriptada = datos.fpassword;
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
        res.send('¡Información actualizada con éxito!');
    });

});

//CARGAR CATEGORIAS PARA LA CREACION DE CURSOS
app.post('/cargar_categorias', function(req, res) {
    con.query("SELECT * FROM atenea.tcategorias;", function(err, result, fields) {
        if (err) throw err;
        todascategorias = '<option>Selecciona una</option>';
        for (var i = 0; i < result.length; i++) {
            //console.log('meto categoria' + result[i].categoria);
            todascategorias += '<option id="' + result[i].idtcategorias + '">' + result[i].categoria + '</option>';

        };

        res.send(todascategorias);
        //console.log(todascategorias)

    })
});
//CARGAR CATEGORIAS PARA LA PAGINA DE FILTROS
app.post('/filtros_cargar_categorias', function(req, res) {
    con.query("SELECT * FROM atenea.tcategorias;", function(err, result, fields) {
        if (err) throw err;
        todascategorias = '';
        for (var i = 0; i < result.length; i++) {
            console.log('meto categoria' + result[i].categoria);
            todascategorias += '<input type="checkbox" name="categoria_' + result[i].idtcategorias + '" value="' + result[i].idtcategorias + '"> ' + result[i].categoria + '<br>';

        };

        res.send(todascategorias);
        //console.log(todascategorias)

    })
});

//CARGAR IDIOMAS PARA LA CREACION DE CURSOS
app.post('/cargar_idiomas', function(req, res) {
    con.query("SELECT * FROM atenea.tidiomas;", function(err, result, fields) {
        if (err) throw err;
        todosidiomas = '<option>Selecciona uno</option>';
        for (var i = 0; i < result.length; i++) {
            //console.log('meto idiomas' + result[i].idioma);
            todosidiomas += '<option id="' + result[i].ididiomas + '">' + result[i].idioma + '</option>';

        };
        res.send(todosidiomas);
        //console.log(todosidiomas);
    })
});

//CARGAR IDIOMAS PARA LA PAGINA DE FILTROS
app.post('/filtros_cargar_idiomas', function(req, res) {
    console.log('hola');
    con.query("SELECT * FROM atenea.tidiomas;", function(err, result, fields) {
        if (err) throw err;
        todosidiomas = '';
        for (var i = 0; i < result.length; i++) {
            //console.log('meto idiomas' + result[i].idioma);
            todosidiomas += '<input type="checkbox" name="idioma_' + result[i].ididiomas + '" value="' + result[i].ididiomas + '"> ' + result[i].idioma + '<br>';

        };
        res.send(todosidiomas);
        //console.log(todosidiomas);
    })
});
//CARGAR PRFESORES PARA LOS CURSOS
app.post('/filtros_cargar_profesores', function(req, res) {
    console.log('hola');
    con.query("SELECT idUsuario, nombre, apellidos FROM atenea.tUsuarios WHERE rol='3' AND validado = '1';", function(err, result, fields) {
        if (err) throw err;
        todosprofes = '';
        for (var i = 0; i < result.length; i++) {
            //console.log('meto idiomas' + result[i].idioma);
            todosprofes += '<input type="checkbox" name="prof_' + result[i].idUsuario + '" value=" ' + result[i].idUsuario + '">' + result[i].nombre + ' ' + result[i].apellidos + '<br>';
        };
        res.send(todosprofes);
        console.log(todosprofes);
    })
});

//CREAR CURSO
app.post('/crear_curso', function(req, res) {
    /*SACO FECHA PARA FECHA INCLUSION*/
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    var datos = req.body;
    console.log(datos)

    con.query("INSERT INTO tcursos (titulo, categoria, precio, idioma_curso, fecha_inclusion, descripcion, validado, idProfe, imagen) VALUES ('" + datos.ftitulo + "','" + datos.fidcategoria + "','" + datos.fprecio + "','" + datos.fididioma + "','" + today + "','" + datos.fdescripcion + "','0', '" + parseInt(datos.id) + "', 'img/curso_20.jpg');", function(err, result, fields) {
        if (err) throw err;
        var idnuevocurso = result.insertId;
        console.log(idnuevocurso);
        /*COMO LOS VIDEOS VAN EN OTRA TABLA, HAY QUE HACER UN BUCLE POR TODOS LOS VIDEOS PARA PODER METERLO*/
        console.log(datos.video.length);
        for (var i = 0; i < datos.video.length; i++) {
            var numeroleccion = i + 1;
            con.query("INSERT INTO tvideos(idcurso, url,leccion) VALUES('" + idnuevocurso + "','" + datos.video[i] + "','" + numeroleccion + "')", function(err, result, fields) {
                if (err) throw err;
            })
        }
        res.send();
    });
});

//LOG IN

app.post('/log_in', function(req, res) {

    var datos = req.body;
    var email = datos.login_email;
    con.query("SELECT validado FROM atenea.tUsuarios WHERE email= '" + email + "';", function(err, result, fields) {
    	if (err) throw err;
        console.log('El valor de validado es ' + result[0].validado);
        if (result[0].validado == 0) {
            res.send('no_validado');
        } else {
            var pass_noencriptada = datos.login_pass;
            var mykey = crypto.createCipher('aes-128-cbc', 'mypassword');
            var pass_encriptada = mykey.update(pass_noencriptada, 'utf8', 'hex');
            pass_encriptada += mykey.final('hex');
            con.query("SELECT idUsuario, rol, password FROM atenea.tUsuarios WHERE email = '" + email + "' AND password= '" + pass_encriptada + "';", function(err, result, fields) {
                if (result.length == 0) {
                    res.send('pass_invalida');
                } else {
                    var id = result[0].idUsuario;
                    var rol = result[0].rol;
                    console.log('!!!!!!!!!!!el ID es' + result[0].idUsuario);
                    console.log('!!!!!!!!!!!el ROL es' + result[0].rol);
                    var data = { 'idUsuario': id, 'rol': rol };
                    res.send(data);


                }

            });
        }

    });
});

//CARGA CURSOS EN PAGINA DE BUSQUEDA
app.post('/cargar_cursos', function(req, res) {
    //DEPENDE DE SI HACEMOS LA LLAMADA cargar_curso con filtros o no, entonces habrá dos opciones:
    var datos = req.body;
    console.log('cargando todos cursos');
    //console.log(datos.valor);
    var sentencia = "SELECT c.idCurso, c.titulo, c.precio, c.imagen, c.descripcion, v.url FROM atenea.tcursos c INNER JOIN tvideos v ON c.idCurso = v.idcurso WHERE " + datos.valor + " AND validado = '1' AND v.leccion='1';";
    console.log(sentencia);

    con.query(sentencia, function(err, result, fields) {
        if (err) throw err;
        todoscursos = '';
        for (var i = 0; i < result.length; i++) {
            //console.log('meto curso' + result[i].titulo);
            todoscursos += '<div class="ficha_curso p-2 col-lg-4 col-md-6 col-sm-12"><div class="border m-1"><div class="item align-self-stretch  p-3"><figure class="m-0" style="height:25vh; overflow:hidden"><a ><img src="' + result[i].imagen + '" alt="Image" class=" img-fluid" style="object-fit: cover"></a></figure></div><div class="px-3 row"><div style="height:10vh; text-align: center;" class="overflow-auto col-12">' + result[i].titulo + '</div></div><div class="px-3 row" style="text-align: center;"><div class="col-12 course-price">' + result[i].precio + ' €</div></div><div class="d-flex justify-content-center m-2"><button type="button" class="boton_curso btn btn-success"  data-toggle="modal" data-video = "' + result[i].url + '" data-precio = "' + result[i].precio + '" data-titulo= "' + result[i].titulo + '" data-descripcion= "' + result[i].descripcion + '" id="curso_' + result[i].idCurso + '">Más Info</button></div></div></div>';
        };
        res.send(todoscursos);
        console.log("ENVIO LOS CURSOS");
    })
});

//CARGA CURSOS EN PAGINA DE BUSQUEDA FILTANDO POR PALABRA
app.post('/filtrar_por_palabra', function(req, res) {
    var datos = req.body;
    console.log(datos.valor);
    var sentencia = "SELECT c.idCurso, c.titulo, c.precio, c.imagen, c.descripcion, v.url FROM atenea.tcursos c INNER JOIN tvideos v ON c.idCurso = v.idcurso WHERE titulo LIKE '%" + datos.valor + "%' AND validado = '1' AND v.leccion='1';";
    console.log(sentencia);
    con.query(sentencia, function(err, result, fields) {
        if (err) throw err;
        if (result.length == 0) {
            res.send('no_hay_cursos');
        } else {
            cursos_filtrados = '';
            for (var i = 0; i < result.length; i++) {
                cursos_filtrados += '<div class="ficha_curso p-2 col-lg-4 col-md-6 col-sm-12"><div class="border m-1"><div class="item align-self-stretch  p-3"><figure class="m-0" style="height:25vh; overflow:hidden"><a ><img src="' + result[i].imagen + '" alt="Image" class=" img-fluid" style="object-fit: cover"></a></figure></div><div class="px-3 row"><div style="height:10vh; text-align: center;" class="overflow-auto col-12">' + result[i].titulo + '</div></div><div class="px-3 row" style="text-align: center;"><div class="col-12 course-price">' + result[i].precio + ' €</div></div><div class="d-flex justify-content-center m-2"><button type="button" class="boton_curso btn btn-success"  data-toggle="modal" data-video = "' + result[i].url + '" data-precio = "' + result[i].precio + '" data-titulo= "' + result[i].titulo + '" data-descripcion= "' + result[i].descripcion + '" id="curso_' + result[i].idCurso + '">Más Info</button></div></div></div>';
            };
            res.send(cursos_filtrados);
        }
    })
});
//CARGAR LOS VIDEOS DE LOS CURSOS EN LOS QUE ESTA EL USUARIO
app.post('/cargar_videos_usuario', function(req, res) {
    var datos = req.body;

    var idusuario = datos.idusuario;
    console.log('ESTOY CARGANDO LOS VIDEOS DE LOS CURSOS DEL USUARIO ' + idusuario);
    var sentencia = "SELECT cu.tcursos_idCurso, v.leccion, v.url ,cu.avance, c.titulo, c.idCurso, c.descripcion FROM tusers_has_tcourses cu INNER JOIN tvideos v ON v.idcurso = cu.tcursos_idCurso INNER JOIN tcursos c ON c.idCurso= cu.tcursos_idCurso WHERE tusuarios_idUsuario = " + idusuario + " AND v.leccion = cu.idUltimoVideo ORDER BY cu.alta;"
    console.log(sentencia);
    con.query(sentencia, function(err, result, fields) {
    	if (err) throw err;
        carrousel_curso = '';
        for (var i = 0; i < result.length; i++) {
            carrousel_curso += '<div class="carousel-item ' + (i == 0 ? 'active"' : '"') + '><iframe class="embed-responsive-item" title="video' + result[i].leccion + '" style="width:100%" type="text/html" width="640" height="385" src="' + result[i].url + '" frameborder="0" allowfullscreen></iframe><h3>' + result[i].titulo + '</h3><div class="progress"><div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div></div><button type="button" data-leccion="' + result[i].leccion + '"  data-titulocurso="' + result[i].titulo + '" data-idcurso="' + result[i].idCurso + '" data-url="' + result[i].url + '" class="boton_continuar_leccion btn btn-warning btn-lg" style="margin: 20px">Continuar lección ' + result[i].leccion + '</button></div>'
        }
        carrousel_curso += '</div>';

        res.send(carrousel_curso);
    })
});

//CARGAR LOS VIDEOS DE LOS CURSOS EN LOS QUE ESTA EL USUARIO
app.post('/cargar_videos_clase', function(req, res) {
    console.log('ME METO');
    var datos = req.body;
    console.log(datos);
    var leccion = datos.leccion;
    var idcurso = datos.idcurso;
    console.log('ESTOY CARGANDO LOS VIDEOS DEL CURSO ID ' + idcurso);
    var sentencia = "SELECT leccion, url FROM tvideos WHERE idcurso = " + idcurso + ";";
    console.log(sentencia);
    con.query(sentencia, function(err, result, fields) {
    	if (err) throw err;
        carrousel_videos = '';
        for (var i = 0; i < result.length; i++) {
            leccion_escogida = result[i].leccion;
            carrousel_videos += '<div class="carousel-item ' + (leccion == leccion_escogida ? 'active"' : '"') + '" data-leccion = "' + leccion_escogida + '" ><iframe class="embed-responsive-item" data-leccion = "' + leccion_escogida + '" title="vídeo arameo" style="width:100%" type="text/html" width="640" height="385" src="' + result[i].url + '" frameborder="1" allowfullscreen></iframe><div><h5>Leccion ' + leccion_escogida + '</h5></div></div>'
        }
        res.send(carrousel_videos);
    })
});



//COMPRAMOS UN CURSO
app.post('/comprar_curso', function(req, res) {
    console.log('compro un curso sin licencia');
    console.log(datos);
    var datos = req.body;
    var idcurso = datos.idcurso;
    var idusuario = datos.idusuario;
    var idlicencia = datos.idlicencia;
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = mm + '/' + dd + '/' + yyyy;
    sentencia = "INSERT INTO tusers_has_tcourses (tusuarios_idUsuario, tcursos_IdCurso, alta, avance, idUltimoVideo, idLicencia) VALUES (" + idusuario + "," + idcurso + ",'" + today + "','0',1," + idlicencia + ");";
    console.log(sentencia);
    con.query(sentencia, function(err, result, fields) {
    	if (err) throw err;
        console.log('EL USUARIO ' + idusuario + ' COMPRA EL CURSO ' + idcurso)
        res.send();
    })
});
//COMPRAR CURSO CON LICENCIAS

app.post('/comprar_curso_licencia', function(req, res) {
    console.log('compro un curso con licencia');
    var datos = req.body;
    console.log(datos);
    var idcurso = datos.idcurso;
    var idusuario = datos.idusuario;
    var licencia = datos.licencia;
    licencia = licencia.substring(1, licencia.length);
    //PRIMERO COMPROBAMOS SI ESE CURSO TIENE LICENCIAS COMPRADAS
    con.query("SELECT c.idCurso, c.titulo, l.licencia, l.nroLicencias, l.idEmpresa, l.idLicencia FROM tcursos c INNER JOIN tlicencias l ON l.idCurso=c.idCurso WHERE c.idCurso=" + idcurso + ";", function(err, result, fileds) {
        if (err) throw err;

        if (result) {
            var licencia_encontrada = 0;
            var nuevoNumLicencias = 0;
            var idlicencia = '';
            for (var i = 0; i < result.length; i++) {
                var licencia_comprobar = result[i].licencia;
                if (licencia_comprobar == licencia || result[i].nroLicencias > 0) {
                    licencia_encontrada = 1;
                    nuevoNumLicencias = result[i].nroLicencias - 1;
                    idlicencia = result[i].idLicencia.toString();
                } else {
                    licencia_encontrada = 0;
                }
            }

            if (licencia_encontrada == 1) {
                con.query("UPDATE tlicencias SET nroLicencias =" + nuevoNumLicencias + " WHERE idLicencia='" + idlicencia + "'", function(err, result) {
                    console.log("el nuevo num licencias es " + nuevoNumLicencias)
                    res.send(idlicencia);
                })
            } else {
                res.send('licencia_incorrecta');
            }
        } else {
            res.send('no_contratado');
        }
    });
    //SEGUNDO SACAMOS LA LICENCIA PARA COMPRARLO

});
//CARGAR CURSOS CONTRATADOS
app.post('/cargar_cursos_contratados', function(req, res) {
    var idEmpresa = req.body.idUsuario;


    con.query("SELECT c.idCurso, c.titulo, l.nroLicencias, l.licencia, l.idLicencia FROM tlicencias l INNER JOIN tcursos c ON l.idCurso = c.idCurso WHERE idEmpresa = " + idEmpresa + ";", function(err, result, fields) {
    	if (err) throw err;
        var cursos_contratados = '';
        for (var i = 0; i < result.length; i++) {
            var idcurso = result[i].idCurso;
            var target = 'collapse' + i;
            cursos_contratados += '<div class="div_lista_cursos row justify-content-left mt-2 border p-1"><div class="col-7 mt-2" style="display: inline-block;"><h5>' + result[i].titulo + '</h5></div><div class="col-3 mt-2"><h6>' + result[i].nroLicencias + ' Licencias</h6></div><div class="col-2"><button class="ver_empleados btn btn-secondary sm" type="button" data-toggle="collapse" data-target="#' + target + '" data-licencia= "' + result[i].idLicencia + '" aria-expanded="false" >Empleados</button></div></div><div class="collapse border container" id="' + target + '"><div class="div_empleados row justify-content-left ml-10 align-items-center p-1"><h7>Licencia número ' + result[i].licencia + '</h7></div></div>'
        }
        console.log(cursos_contratados)

        res.send(cursos_contratados);
    });


});

//CARGO LOS EMPLEADOS AL CLICKAR SOBRE EL BOTON
app.post('/cargar_empleados', function(req, res) {

    var idLicencia = req.body.idLicencia;
    console.log('cargo empleados con la licencia id ' + idLicencia);
    con.query("SELECT cu.idUltimoVideo, u.nombre, u. apellidos FROM atenea.tlicencias l INNER JOIN tusers_has_tcourses cu ON l.idLicencia=cu.idLicencia INNER JOIN tUsuarios u ON cu.tusuarios_idUsuario=u.idUsuario WHERE l.idLicencia=" + idLicencia + ";", function(err, result, fields) {
        if (err) throw err;
        console.log(result);
        var empleados = '';
        if (result.length == 0) {
            empleados = '<div class="div_empleados row justify-content-left ml-10 align-items-center p-1"><div class="col-6 "><h6>Ningún empleado se ha dado de alta en este curso</h6></div></div>'
        } else {
            for (var i = 0; i < result.length; i++) {
                empleados += '<div class="div_empleados row justify-content-left ml-10 align-items-center p-1"><div class="col-6 "><h6>' + result[i].nombre + ' ' + result[i].apellidos + '</h6></div><div class="col-4"><h7>Lección ' + result[i].idUltimoVideo + '</h7></div></div>'
            };
        }
        console.log(empleados);
        res.send(empleados);

    })
});

//EMPRESA COMPRA CURSO

app.post('/empresa_compra_curso', function(req, res) {
    var datos = req.body;
    console.log(datos);
    var idusuario = datos.idusuario;
    var idcurso = datos.idcurso;
    var numlicenc = datos.numlicenc;
    var codigolic = datos.codigolic;
    var sentencia = "INSERT INTO tlicencias (idCurso, idEmpresa, nroLicencias,licencia ) VALUES (" + idcurso + ", " + idusuario + ", " + numlicenc + ", '" + codigolic + "');";
    console.log(sentencia);
    con.query(sentencia, function(err, result) {
    	if (err) throw err;
        res.send();
    })
})

//CARGA DATOS DEL PROFE DEL CURSO

app.post('/cargar_datos_profe', function(req, res) {
    console.log('CARGO LOS DATOS DEL PROFESOR')
    var datos = req.body;

    var idcurso = datos.idcurso;
    con.query("SELECT u.nombre, u.apellidos, u.datosAcademicos, u.email, u.foto, c.descripcion FROM tUsuarios u INNER JOIN tcursos c ON c.idCurso = " + idcurso + " AND u.idUsuario=c.idProfe;", function(err, result, fields) {
    	if (err) throw err;
        console.log(result);
        res.send(JSON.stringify(result));

    })
})

//COMPROBAR SI HAS ACABDO CURSO 

app.use(express.static('html'));

app.post('/comprobar_fin_curso', function(req, res) {
    console.log('COMPROBAMOS EL FINAL')
    var datos = req.body;
    var leccion = datos.leccion;
    var idcurso = datos.idcurso;
    con.query("SELECT * FROM tvideos WHERE idcurso=" + idcurso + " AND leccion =" + leccion + ";", function(err, result, fields) {
        console.log(result);
        if (result.length == 0) {
            res.send('acabaste el curso')
        } else(res.send())

    })
})

//ACTUALIZAR LECCION 
app.post('/actualizar_leccion', function(req, res) {
    console.log('COMPROBAMOS EL FINAL')
    var datos = req.body;
    console.log(datos);
    var leccion = datos.leccion;
    var idcurso = datos.idcurso;
    var idUsuario = datos.idUsuario;
    con.query("UPDATE tusers_has_tcourses SET idUltimoVideo = " + leccion + " WHERE tusuarios_idUsuario= " + idUsuario + " AND tcursos_IdCurso = " + idcurso + "", function(err, result, fields) {
        console.log(result);
        res.send();

    })
})

//VALIDADOOOOOR
//CARGAR CURSOS A VALIDAR
app.post('/cargar_cursos_avalidar', function(req, res) {
    con.query("SELECT c.idCurso, c.titulo, t.categoria, c.descripcion FROM tcursos c INNER JOIN tcategorias t ON c.categoria=t.idtcategorias WHERE validado = '0';", function(err, result, fields) {
    	if (err) throw err;
        var cursos_avalidar = '';
        for (var i = 0; i < result.length; i++) {
            var target = 'collapse' + result[i].idCurso;
            cursos_avalidar += '<div class="div_lista_cursos row justify-content-left mt-2 border p-1"><div class="col-7 mt-2" style="display: inline-block;"><h5>' + result[i].titulo + '</h5></div><div class="col-3 mt-2" style="display: inline-block;"><h6>' + result[i].categoria + '</h6></div><div class="col-2"><button class="ver_curso btn btn-secondary sm" type="button" data-toggle="collapse" data-target="#' + target + '" data-idcurso=' + result[i].idCurso + '  aria-expanded="false" >Ver más</button></div></div><div class="border container collapse" id="' + target + '"><div class="div_infocurso row justify-content-left ml-10 align-items-center p-1"><div id="' + result[i].idCurso + '" class="div_videos col-9"><h7>' + result[i].descripcion + '</h7></div><div class="col-3"><button class="boton_validar_curso btn btn-secondary sm" type="button" data-idcurso=' + result[i].idCurso + '>Validar</button></div></div></div></div>'
        }
        console.log(cursos_avalidar)

        res.send(cursos_avalidar);
    });


});

//VALIDADOR VE VIDEOS DEL CURSO 
app.post('/validador_vevideos', function(req, res) {
	var idcurso = req.body.idcurso;
	con.query("SELECT url, leccion FROM tvideos WHERE idcurso ="+idcurso+" ",function(err,result,fields){
		if (err) throw err;
		var lista_videos = '<ul class="list-group">'
		for (var i = 0; i < result.length; i++) {
			lista_videos+='<li class="list-group-item">Leccion '+result[i].leccion+' <a href="'+result[i].url+'">Ver video</a></li>'
		}
		lista_videos+='</ul>';
		console.log(lista_videos);
		res.send(lista_videos);
	})
})

//CARGAR USUARIOS A VALIDAR
app.post('/cargar_usuarios_avalidar', function(req, res) {
    con.query("SELECT u.idUsuario, u.nombre, u.apellidos, u.datosAcademicos, r.rol FROM tUsuarios u INNER JOIN troles r ON r.idRol=u.rol WHERE validado = '0';", function(err, result, fields) {
    	if (err) throw err;
        var usuarios_avalidar = '';
        if (result) {
            for (var i = 0; i < result.length; i++) {
                var target = 'collapse' + result[i].idUsuario;
                usuarios_avalidar += '<div class="div_lista_cursos row justify-content-left mt-2 border p-1"><div class="col-7 mt-2" style="display: inline-block;"><h5>' + result[i].nombre + ' ' + result[i].apellidos + '</h5></div><div class="col-3 mt-2" style="display: inline-block;"><h6>' + result[i].rol + '</h6></div><div class="col-2"><button class="ver_curso btn btn-secondary sm" type="button" data-toggle="collapse" data-target="#' + target + '"  aria-expanded="false" >Ver más</button></div></div><div class="border container collapse" id="' + target + '"><div class="div_infocurso row justify-content-left ml-10 align-items-center p-1"><div class="col-9"><h7>' + result[i].datosAcademicos + '</h7></div><div class="col-3"><button class="boton_validar_usuario btn btn-secondary sm" type="button" data-idusuario=' + result[i].idUsuario + '>Validar</button></div></div></div></div>'
            }
            console.log(usuarios_avalidar)

            res.send(usuarios_avalidar);
        } else { res.send(); }
    });
});

//VALIDAR CURSO
app.post('/validar_curso', function(req, res) {
	var idcurso = req.body.idcurso;
	con.query("UPDATE tcursos SET validado='1' WHERE IdCurso = "+idcurso+" ",function(err,result){
		if(err) throw err;
		res.send();

	});
});
//VALIDAR USUARIO
app.post('/validar_usuario', function(req, res) {
	var idusuario = req.body.idusuario;	
	con.query("UPDATE tUsuarios SET validado='1' WHERE idUsuario = "+idusuario+"",function(err,result){
		if(err) throw err;
		res.send();

	});
});

app.use(express.static('html'));




app.listen(8080, function() {
    console.log('Example app listening on port 8080!');
});

// JavaScript Document