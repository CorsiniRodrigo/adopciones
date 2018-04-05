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
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Adoptadores</title>
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
                <th>Nombre</th>
                <th>DNI</th>
                <th>Jardin</th>
                <th>Hijo</th>
                <th>Otros perros</th>
                <th></th>
            </tr>
            <%
                Gestion gestion = new Gestion();
                ArrayList<Adoptador> o = gestion.leerAdoptadores();
                int pos = 0;
                while (pos < o.size()) {
                    Adoptador adoptador = o.get(pos);
                    Metodos metodos=new Metodos();
                        
                    out.print("<tr>");
                        out.print("<td>"+adoptador.getNombre()+"</td>");
                        out.print("<td>"+adoptador.getDni()+"</td>");
                        out.print("<td>"+metodos.convertirSNMF(adoptador.getJardin())+"</td>");
                        out.print("<td>"+metodos.convertirSNMF(adoptador.getHijo())+"</td>");
                        out.print("<td>"+adoptador.getOtrosPerros()+"</td>");
                        out.print("<td>"+"</td>");
                    out.print("</tr>");
                    pos++;
                        
                }

            %> </table>
    </body>
</html>