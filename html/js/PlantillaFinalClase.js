//función jquery para cambiar el css cuando se enciende el botón modo nocturno de la clase

$('#nightMode').on('change', function() {
    $('#nightMode').checked = false;
    if (this.checked) {
        $('body').addClass('night');
        $("#logoAtenea").attr("src", "../img/atenealogoNocturno.png");
    } else {
        $('body').removeClass('night');
        $("#logoAtenea").attr("src", "../img/atenealogo.png");
    }
});

//necesito que tenga función toggle

/*function cambioLogo() {
  if (document.getElementById("logoAtenea").src != "atenealogoNocturno.png") {
        document.getElementById("logoAtenea").src = "atenealogo.png";
    } else {
        document.getElementById("logoAtenea").src = "atenealogoNocturno.png";
    }
}*/

/*
//entiendo que falla ya que llamo a la función desde el botón toggle y no desde la propia imagen 
function cambioLogo() {
  var image = document.getElementById('logoAtenea').src = "atenealogo.png";
  if (image.src.match("atenealogo")) {
    document.getElementById("logoAtenea").src = "atenealogo.png";
    //image.src = "atenealogo.png";
  } else {
    document.getElementById("logoAtenea").src = "atenealogoNocturno.png";
    //image.src = "atenealogoNocturno.png";
  }
}
*/

 //no funciona ninguna de estas maneras para cambiar el logo

//function cambioLogo() {
    //var atenea = src="atenealogoNocturno.png";
    /*$("#nightMode").click(function(){
        console.log("pppp>2");
        if($("#logoAtenea").attr("src") == "atenealogo.png"){
            $("#logoAtenea").attr("src", "atenealogoNocturno.png");
        }else{
            $("#logoAtenea").attr("src", "atenealogo.png");
        }
    });*/
//}

/*

function cambioLogo() {
    $("#logoAtenea").src = "atenealogoNocturno.png";
}

function cambioLogo() {
  document.getElementById("logoAtenea").src = "atenealogoNocturno.png";
}

$('#modoNocturno').click(function(){
   $('#logoAtenea').toggle();
 });
*/


/*
$('#nightMode').on('change', function() {
    if (this.checked) {
        $('body,accordionExample').addClass('night');
    } else {
        $('body,accordionExample').removeClass('night');
    }
});
 */

/*
esta no funciona
$('#nightMode').click(function() {
    $('body').toggleClass('body.night');
});
esta tampoco
$(document).ready(function() {
    $('nightMode').click(function(){
        if ($('body').hasClass('night')) {
            $('body').removeClass('night').addClass('white');
        }
        else {
            $('body').removeClass('white').addClass('night');
        }
    });
});
*/