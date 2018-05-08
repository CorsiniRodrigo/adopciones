<%-- 
    Document   : modificarAdoptador
    Created on : 12-abr-2018, 14:59:02
    Author     : usuario
--%>

<%@page import="adopciones.Adoptador"%>
<%@page import="adopciones.Gestion"%>
<%@page import="Utilidades.Metodos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificar Adotpador</h1>
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
                if (request.getParameter("dni") == null) {
                    Gestion gestion = new Gestion();
                    adoptador = gestion.leerAdoptador(Integer.parseInt(request.getParameter("adoptadorId")));
                } else {
                    adoptador = new Adoptador();
                    adoptador.setAdoptadorid(Integer.parseInt(request.getParameter("adoptadorId")));
                    adoptador.setDni(request.getParameter("dni"));
                    adoptador.setHijo(request.getParameter("hijo"));
                    adoptador.setJardin(request.getParameter("jardin"));
                    adoptador.setNombre(request.getParameter("nombre"));
                    adoptador.setOtrosPerros(Integer.parseInt(request.getParameter("otrosperros")));
                }

            %>
            <br> 
            <form method="post" action="ServletModificarAdoptador">
                <input type="hidden" name="adoptadorId" value="<%=adoptador.getAdoptadorid()%>">
                <label>   Nombre: </label><br>
                <input type="text" name="nombre" value="<%= adoptador.getNombre()%>" required><br>
                <label>  DNI: </label><br>
                <input type="text" name = "dni" value="<%=adoptador.getDni()%>" required><br>
                <label>  Jardin: </label><br>
                <%--   <select name="jardin">
                    <option></option>
                    <option value="s" >Si</option>
                    <option value="n"> No</option>
                </select><br>--%>

                <input type="radio" name="jardin" value="s"<%
                    if (Metodos.convertirSNMF(adoptador.getJardin()).equals("Si")) {
                       %>checked<%}
                       %>> Si<br>
                <input type="radio" name="jardin" value="n"<%
                    if (Metodos.convertirSNMF(adoptador.getJardin()).equals("No")) {
                       %>checked<%}
                       %>> No<br>




                <label>  Hijos: </label><br>

                <input type="radio" name="hijo" value="s"<%
              if (Metodos.convertirSNMF(adoptador.getHijo()).equals("Si")) {
                       %>checked<%}
                       %>> Si<br>
                <input type="radio" name="hijo" value="n"<%
                    if (Metodos.convertirSNMF(adoptador.getHijo()).equals("No")) {
                       %>checked<%} 
                       %>> No<br>


 <%= adoptador.getOtrosPerros() %>

                <label>  Otros Perros: </label><br>
                <input id="datosnumero" type="number" name="otrosperros" value="<%= adoptador.getOtrosPerros() %>" ><br>
                <input type="submit" value="Acptar">
                <a href="listaAdoptador.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>





    </body>
</html>

</html>
