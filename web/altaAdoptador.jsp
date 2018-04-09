<%-- 
    Document   : altaAdoptador
    Created on : 09-abr-2018, 18:42:00
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Alta Perro</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
        <ul>
            <li><a href="listaPerros.jsp">Perros</a></li>
            <li><a href="listaAdoptador.jsp">Familias</a></li>
            <li><a href="https://es-es.facebook.com/ADOPTA-EN-ESPA%C3%91A-311579258852821/">Contacto</a></li>
        </ul>

        <h1>Alta Adoptador</h1>
        <fieldset>
            <form method="get" action="ServletAltaAdoptador">
                <label>   Nombre: </label><br>
                <input type="text" name="nombre"><br>
                <label>  DNI: </label><br>
                <input type="text" name="dni"><br>
                <label>  Jardin: </label><br>
                <select name="jardin">
                    <option value="s">Si</option>
                    <option value="n">No</option>
                </select><br>
                <label>  Hijos: </label><br>
                <select name="hijo">
                    <option value="s">Si</option>
                    <option value="n">No</option>
                </select><br>
                <label>  Otros Perros: </label><br>
                <input type="text" name="otrosperros"><br>
                <input type="submit" value="Acptar">
                <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>





    </body>
</html>

</html>
