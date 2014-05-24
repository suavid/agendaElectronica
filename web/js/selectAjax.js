
var peticion = false;
var  testPasado = false;

try {
  peticion = new XMLHttpRequest();
  } 
  catch (trymicrosoft) 
  {
    try {
        peticion = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (othermicrosoft) 
  {
        try {
            peticion = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        catch (failed) 
        {
          peticion = false;
        }
  }
}

if (!peticion)
    alert("ERROR AL INICIALIZAR!");


function cargarCombo(url, comboPrincipal, id)
{
   
    var elemento = document.getElementById(id);    
    var valorDepende = document.getElementById(comboPrincipal);
    
    var x = valorDepende.value;
    
    
    var url1 = url + '?Id=' + x;
    elemento.innerHTML = '<img src="../img/5-0.gif" />';
    
    
    peticion.open("GET", url1);

    peticion.onreadystatechange = function() 
                                {
                                    if(peticion.readyState == 4)
                                    {
                                        elemento.innerHTML = peticion.responseText;
                                    }
        
                                 } //fin funcion
    
                                 peticion.send(null);
}
    
function buscarUsuario(url,cajaPrincipal,id, tipo)
{
    var elemento = document.getElementById(id);
    var valorP = document.getElementById(cajaPrincipal);
    var y = valorP.value;
        var url1 = url + "?criterio=" + y + "&tipo=" + tipo;
        elemento.innerHTML = "<i class='fa fa-spinner fa-spin'></i>";
        peticion.open("GET", url1);
        peticion.onreadystatechange = function() 
                                {
                                    if(peticion.readyState == 4)
                                    {
                                        elemento.innerHTML = peticion.responseText;
                                    }
        
                                 } //fin funcion
                                 peticion.send(null);
}

function buscarFiador(url,cajaPrincipal,id)
{
    var elemento = document.getElementById(id);
    var valorP = document.getElementById(cajaPrincipal);
    var y = valorP.value;
    var url1 = url + "?criterio=" + y;
    peticion.open("GET", url1);
    peticion.onreadystatechange = function() 
                                {
                                    if(peticion.readyState == 4)
                                    {
                                        elemento.innerHTML = peticion.responseText;
                                    }
        
                                 } //fin funcion
                                 peticion.send(null);
}



function buscarPrestamos(url,cajaPrincipal,id, tipo)
{
    var elemento = document.getElementById(id);
    var valorP = document.getElementById(cajaPrincipal);
    
    var y = valorP.value;
    if ( y != "")
    {
        var url1 = url + "&criterio=" + y + "&tipo=" + tipo;
        elemento.innerHTML = "<i class='fa fa-spinner fa-spin'></i>";
        peticion.open("GET", url1);
        peticion.onreadystatechange = function() 
                                    {   if(peticion.readyState == 4)
                                        {
                                            elemento.innerHTML = peticion.responseText;
                                        }
                                     } //fin funcion
                                     peticion.send(null);
    }
    else 
    {
            elemento.innerHTML = "";
    }
}


