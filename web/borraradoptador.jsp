<%-- 
    Document   : borraradoptador
    Created on : 18-abr-2018, 18:42:25
    Author     : usuario
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Gestion"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <body>
        <h1>Borrar Adotpador</h1>
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
                Adoptador adoptador;
                Gestion gestion = new Gestion();
                adoptador = gestion.leerAdoptador(Integer.parseInt(request.getParameter("adoptadorId")));


            %>
            <br> 
            <form method="post" action="ServletBorrarAdoptador">
                <input type="hidden" name="adoptadorId" value="<%=adoptador.getAdoptadorid()%>">
                <label>   Nombre: </label><br>
                <input type="text" name="nombre" value="<%= adoptador.getNombre()%>" disabled><br>
                <label>  DNI: </label><br>
                <input type="text" requiered name="dni" value="<%=adoptador.getDni()%>" disabled><br>
                <label>  Jardin: </label><br>
                <%--   <select name="jardin">
                    <option></option>
                    <option value="s" >Si</option>
                    <option value="n"> No</option>
                </select><br>--%>

               <%
                    if (Metodos.convertirSNMF(adoptador.getJardin()).equals("Si")) {
                       %> <input type="radio" name="jardin" value="s" checked> Si<br><% } %>
                   <%   if (Metodos.convertirSNMF(adoptador.getJardin()).equals("No")) {
                       %> <input type="radio" name="jardin" value="n" checked> No<br><% } %>




                <label>  Hijos: </label><br>
                <%--   <select name="hijo">
                    <option></option>
                    <option value="s"<%
                        if (Metodos.convertirSNMF(adoptador.getHijo()).equals("Si")) {

                            %>selected<%}
                            %>>Si</option>
                    <option value="n"<%
                        if (Metodos.convertirSNMF(adoptador.getHijo()).equals("No")) {
                            %>selected<%}
                            %>>No</option>
                </select><br>  --%>


               <%
                    if (Metodos.convertirSNMF(adoptador.getHijo()).equals("Si")) {
                       %> <input type="radio" name="hijo" value="s"checked>Si<br><%} %>
                             <%
                    if (Metodos.convertirSNMF(adoptador.getHijo()).equals("No")) {
                       %> <input type="radio" name="hijo" value="n"checked>No<br><%} %>




                <label>  Otros Perros: </label><br>
                <input id="datosnumero"type="number" name="otrosperros" value="<%= adoptador.getOtrosPerros()%>" disabled><br>
                <input type="submit" value="Eliminar">
                <a href="listaAdoptador.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>





    </body>
</html>

</html>
