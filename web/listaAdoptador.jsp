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
        <title>Adoptadores</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
        <ul>
            <li><a href="listaPerros.jsp">Perros</a></li>
            <li><a href="listaAdoptador.jsp">Familias</a></li>
            <li><a href="https://es-es.facebook.com/ADOPTA-EN-ESPA%C3%91A-311579258852821/">Contacto</a></li>

        </ul><br>
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            ArrayList<String> ListaErrores = (ArrayList) request.getAttribute("ListaErrores");
            if (mensaje != null) {
                if (ListaErrores != null) {
                    out.println("<p style=color:red>" + mensaje + "</p>");

                    for (String o : ListaErrores) {
                        out.println("<p style=color:red>" + o + "</p>");
                    }
                } else {
                    out.println("<p style=color:green>" + mensaje + "</p>");
                }
            }
        %>
        <table id="tabla">
            <tr>
                <th>Nombre</th>
                <th>DNI</th>
                <th>Jardin</th>
                <th>Hijo</th>
                <th>Otros perros</th>
                <th> <a href="altaAdoptador.jsp"><button class="btn"><img src="Iconos/veterinario.png" ></button></a></th>
            </tr>
            <%
                Gestion gestion = new Gestion();
                ArrayList<Adoptador> o = gestion.leerAdoptadores();
                int pos = 0;
                while (pos < o.size()) {
                    Adoptador adoptador = o.get(pos);
                    Metodos metodos = new Metodos();

                    out.print("<tr>");
                    out.print("<td>" + adoptador.getNombre() + "</td>");
                    out.print("<td>" + adoptador.getDni() + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(adoptador.getJardin()) + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(adoptador.getHijo()) + "</td>");
                    out.print("<td>" + adoptador.getOtrosPerros() + "</td>");
                    out.print("<td>"
                            + "<a href='altaAdoptador.jsp'><button class='btn'><img src='Iconos/001-lupa.png' ></button></a>"
                            + "<a href='modificarAdoptador.jsp?adoptadorId="+adoptador.getAdoptadorid()+"'><button class='btn'><img src='Iconos/002-componer.png' ></button></a>"
                            + "<a href='altaAdoptador.jsp'><button class='btn'><img src='Iconos/003-borrar.png' ></button></a>"
                            + "</td>");
                    out.print("</tr>");
                    pos++;

                }

            %> </table>
    </body>
</html>