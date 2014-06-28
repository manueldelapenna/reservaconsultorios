$(document).ready(function()
{
	/**
    *@desc- retrasa el evento keyup
    *@param fn - function
    *@param ms - milisegundos que queremos retrasar
    */
    $.fn.delayPasteKeyUp = function(fn, ms)
    {
        var timer = 0;
        $(this).on("keyup", function()
        {
            clearTimeout(timer);
            timer = setTimeout(fn, ms);
        });
    };
 
    $("input[name=f_psychologist_input_id]").delayPasteKeyUp(function()
    {
		if ($('#input-ajax').val().length > 0){
			$.ajax({
				type: "POST",
				url: "./autocompletado/app/instancias/autocomplete.php",
				data: "f_psychologist_input_id="+$("input[name=f_psychologist_input_id]").val(),
				success: function(data)
				{
					if(data)
					{	
						
						var json = JSON.parse(data),
							html = '<div class="list-group">';
						if(json.res == 'full')
						{
							for(datos in json.data)
							{
								html+='<a href="#" onclick="info('+json.data[datos].id+',\''+json.data[datos].nombre+'\')" class="list-group-item">';
								html+='<label class="list-group-item-heading">';
								html+=json.data[datos].nombre+'</label>';
								html+='</a>';
							}
						}
						else
						{
							html+='<a href="#" class="list-group-item">';
							html+='<h6 class="list-group-item-heading">No se ha encontrado nada con '+$("input[name=f_psychologist_input_id]").val()+'</h6>';
							html+='</a>';
						}
						html+='</div>';
						$("#busqueda").html("").append(html);
					}
					else{
						html="";
						$("#busqueda").html("").append(html);
					}
				}
			});
		}else{
			html="";
			$("#busqueda").html("").append(html);
		}
    }, 500);

	$(document).on("click", "a", function()
	{
		$("a").removeClass("active");
		$(this).addClass("active");
	})
});

function mostrarFilas() {
	var elementos = document.getElementsByTagName('tr');
    for (i = 0; i< elementos.length; i++) {
        if(navigator.appName.indexOf("Microsoft") > -1){
               var visible = 'block'
        } else {
               var visible = 'table-row';
        }
	elementos[i].style.display = visible;
        }
}
function ocultarFilas(name) {
    var elementos = document.getElementsByTagName('tr');
    for (k = 0; k< elementos.length; k++) {
		if (elementos[k].getAttribute('name') != name && elementos[k].getAttribute('name') != null){
                        //$('#pagar[k]').attr('disabled',true);
			elementos[k].style.display = "none";
                       
		}
    }
}

//al pulsar en los enlaces muestra su información
function info(id,nombre)
{
        //document.getElementById("input_ajax").value = nombre;
	$('#input-ajax').val(nombre);
	html="";
	$("#busqueda").html("").append(html);
	ocultarFilas(id);
        $('#save_button').attr('disabled',false);
        //$('.checks').prop("checked", false);
        //$(".checks:checkbox:checked").removeAttr("checked");
        $(".checks:checkbox:disabled").removeAttr("disabled");
        $("#psicologo").val(id);
}

function calcular_desc()
{
    var actual = parseInt(document.getElementById("descuento").value);
    if (isNaN(actual)){
      alert ("Debe introducir un valor numérico");
    }
    else{
      var total = parseInt(document.getElementById("total").value);
      total = total - actual;
      document.getElementById("total").value = total;
    }  
}