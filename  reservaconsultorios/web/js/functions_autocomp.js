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
        $(this).on("keyup paste", function()
        {
            clearTimeout(timer);
            timer = setTimeout(fn, ms);
        });
    };
 
    $("input[name=f_psychologist_input_id]").delayPasteKeyUp(function()
    {
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
            				html+='<h6 class="list-group-item-heading">';
            				html+=json.data[datos].nombre+'</h6>';
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
    }, 500);

	$(document).on("click", "a", function()
	{
		$("a").removeClass("active");
		$(this).addClass("active");
	})
});

//al pulsar en los enlaces muestra su información
function info(id,nombre)
{
        //document.getElementById("input_ajax").value = nombre;
	alert("ID: " + id + " Nombre: " + nombre);
}