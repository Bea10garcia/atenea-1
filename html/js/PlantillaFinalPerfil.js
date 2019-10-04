$("#botonGuardaCambios").click(function() {
    swal("¡Perfecto!", "Tus cambios se han guardado con éxito", "success");
});

$("#botonEliminar").click(function() {
    swal({
            title: "¿Estás seguro de querer borrar tu cuenta?",
            text: "Confirma tu contraseña:",
            content: {
                element: "input",
                attributes: {
                    placeholder: "Type your password",
                    type: "password",
                },
            },
            dangerMode: true,
            buttons: true,
        })
        .then((willdelete1) => {
            if (willdelete1) {
                //llamada a comprobar password
                // if( password correcta) {`
                swal({
                        title: "¿Estás seguro de querer borrar tu cuenta?",
                        text: "Confirma tu email:",
                        content: {
                            element: "input",
                            attributes: {
                                placeholder: "Type your email",
                                type: "email",
                            },
                        },
                        dangerMode: true,
                        buttons: true,
                    })
                    .then((willdelete2) => {
                        // llamada a comprobar email
                        //  if (email correcto) {
                        //     borrar
                        if (willdelete2) {
                            swal({
                                title: "Tu cuenta ha sido borrada con éxito, esperamos verte de nuevo",
                                icon: "success",
                            });
                        } else {
                            swal({
                                title: "¡Muchas gracias, nos alegramos de que te quedes con nosotros!",
                            });
                        }
                    })
            } else {
                swal({
                    title: "Tu cuenta NO ha sido borrada.",
                    icon: "success",
                });
            }
        });
});

/*
function validarAlias(alias) {
    var regExpAlias = ^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$;
    if (alias.match(regExpAlias)) {
        swal({
            title: "Alias correcto",
            icon: "success",
        });
}
*/

function validarMail(email) {
    var regExpMail = /\w+@\w+\.+[a-z]/;
    if (email.match(regExpMail)) {
        swal("Felicidades", "Email correcto", "success", {
            buttons: false,
            timer: 2000,
        });
    } else {
        swal({
            title: "Email incorrecto",
            icon: "warning",
        });
    }
}


function validarContrasena(password) {
    // coincide con una cadena de 6 o más caracteres que debe tener un dígito y una mayúscula, \d sirve igual que si pones [0-9]
    var regExp = /^(?=.*\d)(?=.*[A-Z])(?!.*[^a-zA-Z0-9@#$^+=])(.{6,})$/;

    //  Comprueba que la pass cumple la expresión regular y que hay pass (para poder cambiar de campo. Si no hay nada escrito, se puede cabiar el foco. Si no, hasta que la pass no este bien construida, no se cambia el foco)
    if (!regExp.test(password) && password.length != 0) {
        swal("Debe contener mínimo 6 caracteres y al menos una letra minúscula, una letra mayúscula y un dígito", "", "warning")
    } else {
        swal("Felicidades", "Contraseña correcta", "success", {
            buttons: false,
            timer: 2000,
        });
    }
}

function validarFacturacion(tarjeta) {
    // en teoría esta regExp permite validar tarjetas visa, mastercard, american express, diners club, discover y jcb
    var regExpFact = /^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/;
    if (!regExpFact.test(tarjeta) && tarjeta.length != 0) {
        swal("Su número de tarjeta es incorrecto", "compruebe antes de continuar", "warning")
    } else {
        swal("Felicidades", "Número de tarjeta correcto", "success", {
            buttons: false,
            timer: 2000,
        });
    }
}

function validarCumple(nacimiento) {
    var regExpCumple = /(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}/;
    if (!regExpCumple.test(nacimiento) && nacimiento.length != 0) {
        swal("dd-mm-aaaa o dd/mm/aaaa", "tiene que tener este patrón", "warning")
    } else {
        swal("Felicidades", "Campo correcto", "success", {
            buttons: false,
            timer: 2000,
        });
    }
}

function validarTelefono(telefono) {
    var regExpTelefono = /[0-9]{3}-[0-9]{3}-[0-9]{3}/;
    if (!regExpTelefono.test(telefono) && telefono.length != 0) {
        swal("Su número de teléfono es incorrecto", "compruebe antes de continuar", "warning")
    } else {
        swal("Felicidades", "Teléfono correcto", "success", {
            buttons: false,
            timer: 2000,
        });

        //swal("Felicidades", "teléfono correcto", "success")
    }
}