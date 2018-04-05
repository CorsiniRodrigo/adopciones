<%-- 
    Document   : listaPerros
    Created on : 04-abr-2018, 11:16:35
    Author     : Corsini
--%>

<%@page import="adopciones.Perro"%>
<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="adopciones.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>JSP Page</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
	<ul>
  <li><a href="#home">Perros</a></li>
  <li><a href="#news">Familias</a></li>
  <li><a href="#contact">Contacto</a></li>

</ul><br>
        <table id="tabla">
              <tr>
                <th>Chip</th>
                <th>Nombre</th>
                <th>Color</th>
                <th>Raza</th>
                <th>Amo</th>
                <th>Peligroso</th>
                <th>Sexo</th>
                <th></th>
            </tr>
            <%
                Gestion gestion = new Gestion();
                ArrayList<Perro> o = gestion.leerPerros();
                int pos = 0;
                while (pos < o.size()) {
                    Perro perro = o.get(pos);
                    Metodos metodos = new Metodos();

                    out.print("<tr>");
                    out.print("<td>" + perro.getChip() + "</td>");
                    out.print("<td>" + perro.getNombre() + "</td>");
                    out.print("<td>" + perro.getColor() + "</td>");
                    out.print("<td>" + perro.getRaza() + "</td>");
                    out.print("<td>" +metodos.convertiNullStringVacio(perro.getAmo().getNombre())+" - "+ metodos.convertiNullStringVacio(perro.getAmo().getDni()) + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(perro.getPeligroso()) + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(perro.getSexo()) + "</td>");
                    out.print("<td>" + "</td>");
                    out.print("</tr>");
                    pos++;

                }

            %> </table>

       
    </body>
</html>
