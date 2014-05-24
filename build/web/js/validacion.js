function validar(id)
    {
        var elemento = document.getElementById(id);
        var div      = document.getElementById("div"+id);
        if(elemento.checkValidity())
            div.innerHTML = "<div class='fa fa-check'></div>";
        else
            div.innerHTML = "<div class='fa fa-times'></div>";
    }
    
    function sumarize(form)
    {
        var frm = document.getElementById(form);
        var val = true;
        
        for(i= 0; i < frm.elements.length; i++)
        {
            if(frm.elements[i].type == "text" || frm.elements[i].type == "textarea")
            {
                //Si no esta validado
                if(!frm.elements[i].checkValidity())
                {
                    frm.elements[i].title = "Por favor ingrese la informacion de este campo";
                    val = false;
                    break;
                }
            }
        }
        return val;
    }

