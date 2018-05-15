<%-- 
    Document   : altaAdoptador
    Created on : 09-abr-2018, 18:42:00
    Author     : Corsini
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Includes/cabecera.jsp" %>
<%@include file="Includes/menu.jsp" %>

        <h1>Alta Adoptador</h1>    
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
            <br> 
            <form method="post" action="ServletAltaAdoptador">
                <label>   Nombre: </label><br>
                <input type="text" name="nombre"   value="<%=Metodos.convertiNullStringVacio(request.getParameter("nombre"))%>" required><br>
                <label>  DNI: </label><br>
                <input type="text" requiered name="dni" value="<%=Metodos.convertiNullStringVacio(request.getParameter("dni"))%>" required><br>
                <label>  Jardin: </label><br>
                <input type="radio" name="jardin" value="s"> Si<br>
                <input type="radio" name="jardin" value="n"> No<br>
                <label>  Hijos: </label><br> 
                <input type="radio" name="hijo" value="s"> Si<br>
                <input type="radio" name="hijo" value="n"> No<br>
                <label>  Otros Perros: </label><br>
                <input id="datosnumero"type="number" name="otrosperros" value="<%=Metodos.convertiNullStringVacio(request.getParameter("otrosperros"))%>"><br>
                <input type="submit" value="Acptar">
                <a href="listaAdoptador.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>

     <%@include file="Includes/footer.jsp" %>