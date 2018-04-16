<%-- 
    Document   : listaAdoptadores
    Created on : 03-abr-2018, 19:04:27
    Author     : Corsini
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="adopciones.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <title>Alta Perro</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
        <ul>
            <li><a href="listaPerros.jsp">Perros</a></li>
            <li><a href="listaAdoptador.jsp">Familias</a></li>
            <li><a href="https://es-es.facebook.com/ADOPTA-EN-ESPA%C3%91A-311579258852821/">Contacto</a></li>
        </ul>

        <h1>Alta Perro</h1>
        <fieldset>
            <form method="get" action="ServletAltaPerro">
                <label>   Chip: </label><br>
                <input type="text" name="chip"><br>
                <label>  Nombre:</label><br>
                <input type="text" name="nombre"><br>
                <label>  Color:</label><br>
                <input type="text" name="color"><br>
                <label>  Raza:</label><br>
                <input type="text" name="raza"><br>
                <label>  Amo:</label><br>
                <select name="amo">
                    <option value=' '> </option>
                    <%
                        Gestion gestion = new Gestion();
                        ArrayList<Adoptador> listaAdoptador = gestion.leerAdoptadores();
                        for (Adoptador o : listaAdoptador) {

                            out.println("<option value='" + o.getAdoptadorid() + "'>" + o.getNombre() + "</option>");
                        }

                    %>
                </select><br>
 
                 
                <label>Peligroso:</label><br> 
                <input type="radio" name="peligroso" value="S"> Si<br>
                <input type="radio" name="peligroso" value="N"> No<br>

                <label>  Sexo:</label><br>

                <input type="radio" name="peligroso" value="m"> Masculino<br>
                <input type="radio" name="peligroso" value="f"> Femenino<br>
                <input type="submit" value="Acptar">
                <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>





    </body>
</html>
