<%-- 
    Document   : borrarperro
    Created on : 10-may-2018, 14:42:53
    Author     : usuario
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="adopciones.Perro"%>
<%@page import="adopciones.Gestion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Includes/cabecera.jsp" %>
<h1>Borrar Perro</h1>
<fieldset>
    <%
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null) {
            if (request.getAttribute("ListaErrores") != null) {
                out.println("<ol>");
                out.println("<li style=color:red>" + mensaje + "</li>");
                ArrayList<String> ListaErrores = (ArrayList) request.getAttribute("ListaErrores");
                for (String o : ListaErrores) {
                    out.println("<li style=color:red>" + o + "</li>");
                }
            } else {
                out.println("<li style=color:green>" + mensaje + "</li>");
            }
            out.println("</ol>");
            out.println(" <br> ");
            out.println(" <br> ");
        }
    %>
    <%
        Gestion gestion = new Gestion();
        Perro perro = new Perro();
        if (request.getParameter("chip") == null) {
            perro = gestion.leerPerro(Integer.parseInt(request.getParameter("perroId")));
        } else {
            Adoptador adoptador = new Adoptador();
            adoptador.setAdoptadorid(Integer.parseInt(request.getParameter("amo")));
            adoptador = gestion.leerAdoptador(adoptador.getAdoptadorid());
            perro = new Perro();
            perro.setNombre(request.getParameter("nombre"));
            perro.setChip(Integer.parseInt(request.getParameter("chip")));
            perro.setColor(request.getParameter("color"));
            perro.setRaza(request.getParameter("raza"));
            perro.setAmo(adoptador);
            perro.setPeligroso(request.getParameter("peligroso"));
            perro.setSexo(request.getParameter("sexo"));
        }
    %>
    <form method="get" action="ServletBorrarPerro">
        <input type="hidden" name="perroId" value="<%=perro.getIdPerro()%>">
        <label>   Chip: </label><br>
        <input type="text" name="chip"  value="<%=perro.getChip()%>" disabled ><br>
        <label>  Nombre:</label><br>
        <input type="text" name="nombre" value="<%=perro.getNombre()%>"disabled><br>
        <label>  Color:</label><br>
        <input type="text" name="color" value="<%=perro.getColor()%>"disabled><br>
        <label>  Raza:</label><br>
        <input type="text" name="raza" value="<%= perro.getRaza()%>"disabled><br>
        <label>  Amo:</label><br>
        <input type="text" name="raza" value="<%= Metodos.convertiNullStringVacio(perro.getAmo().getNombre())%>"disabled><br>

        </select><br>

        <label>Peligroso:</label><br> 
        <%
            if (perro.getPeligroso().equals("S")) {
        %>
        <input type="radio" name="peligroso" value="S"checked> Si<br><% }
            if (perro.getPeligroso().equals("N")) {
        %>
        <input type="radio" name="peligroso" value="N"checked> No<br><% } %>

        <label>  Sexo:</label><br>
        <%
            if (perro.getSexo().equals("m")) {
        %>
        <input type="radio" name="sexo" value="m" checked> Si<br><% }
            if (perro.getSexo().equals("f")) {
        %>
        <input type="radio" name="sexo" value="f"checked> No<br><% }%>




        <input type="submit" value="Acptar">
        <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
    </form>
</fieldset>
<%@include file="Includes/footer.jsp" %>