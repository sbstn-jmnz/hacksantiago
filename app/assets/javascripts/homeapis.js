$(document).ready(function (){
    $("#btn382").click(function(){        
        /* set no cache */
        $.ajaxSetup({ cache: false });
 
        $.getJSON("http://api.recursos.datos.gob.cl/datastreams/invoke/OPERA-DEL-EN-MILLO-DE?auth_key=339b2a5b8afaac19c267185ae19e85d76f9e975e", function(data){ 
            var html = [];
 
            /* loop through array */
            $.each(data, function(index, d){            
                html.push("Manufacturer : ", d.Manufacturer, ", ",
                          "Sold : ", d.Sold, ", ", 
                          "Month : ", d.Month, "<br>");
            });
 
 
            $("#div381").html(html.join('')).css("background-color", "orange");
        }).error(function(jqXHR, textStatus, errorThrown){ /* assign handler */
            /* alert(jqXHR.responseText) */
            alert("error occurred!");
        });
    });
});