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

<%@include file="Includes/cabecera.jsp" %>
<%@include file="Includes/menu.jsp" %>

        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
                out.println("<p style=color:green>" + mensaje + "</p>");
            }
        %>
        <table id="tabla">
            <tr>
                <th>Chip</th>
                <th>Nombre</th>
                <th>Color</th>
                <th>Raza</th>
                <th>Amo</th>
                <th>Peligroso</th>
                <th>Sexo</th>
                <th> <a href="altaPerro.jsp"><button class="btn"><img src="Iconos/veterinario.png" ></button></a></th>
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
                    out.print("<td>" + metodos.convertiNullStringVacio(perro.getAmo().getNombre()) + " - " + metodos.convertiNullStringVacio(perro.getAmo().getDni()) + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(perro.getPeligroso()) + "</td>");
                    out.print("<td>" + metodos.convertirSNMF(perro.getSexo()) + "</td>");
                    out.print("<td><a href='mostrarperro.jsp?perroId="+perro.getIdPerro()+"'><button class='btn'><img src='Iconos/001-lupa.png' ></button></a>"
                            + "<a href='modificarPerro.jsp?perroId="+perro.getIdPerro()+"'><button class='btn'><img src='Iconos/002-componer.png' ></button></a>"
                            + "<a href='borrarperro.jsp?perroId="+perro.getIdPerro()+"'<button class='btn'><img src='Iconos/003-borrar.png' ></button></a>"
                            + "</td>");
                    out.print("</tr>");
                    pos++;

                }

            %> </table>
            <%@include file="Includes/footer.jsp" %>
