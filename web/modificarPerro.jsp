<%-- 
    Document   : modificarPerro
    Created on : 16-abr-2018, 15:36:28
    Author     : usuario
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Perro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="adopciones.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificar Perro</h1>
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
                    Adoptador adoptador =new Adoptador();
                    adoptador.setAdoptadorid(Integer.parseInt(request.getParameter("amo")));
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
            <form method="get" action="ServletModificarPerro">
                <label>   Chip: </label><br>
                <input type="text" name="chip"  value="<%=perro.getChip()%>"><br>
                <label>  Nombre:</label><br>
                <input type="text" name="nombre" value="<%=perro.getNombre()%>"><br>
                <label>  Color:</label><br>
                <input type="text" name="color" value="<%=perro.getColor()%>"><br>
                <label>  Raza:</label><br>
                <input type="text" name="raza" value="<%=Metodos.convertiNullStringVacio(perro.getRaza())%>"><br>
                <label>  Amo:</label><br>
                <select name="amo">
                    <option value=""> </option>
                    <option value="<%=perro.getIdPerro()%>" selected> </option>
                    <%
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

                <input type="radio" name="sexo" value="m"> Si<br>
                <input type="radio" name="sexo" value="f"> No<br>

                <input type="submit" value="Acptar">
                <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>
    </body>
</html>
