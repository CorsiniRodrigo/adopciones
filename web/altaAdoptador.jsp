<%-- 
    Document   : altaAdoptador
    Created on : 09-abr-2018, 18:42:00
    Author     : usuario
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="java.util.ArrayList"%>
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

        <h1>Alta Adoptador</h1>
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
                if (request.getAttribute("ListaErrores") != null) {
                    out.println("<p style=color:red>" + mensaje + "</p>");
                    ArrayList<String> ListaErrores = (ArrayList) request.getAttribute("ListaErrores");
                    for (String o : ListaErrores) {
                        out.println("<p style=color:red>" + o + "</p>");
                    }
                } else {
                    out.println("<p style=color:green>" + mensaje + "</p>");
                }
            }
        %>
        <fieldset>
            <form method="get" action="ServletAltaAdoptador">
                <label>   Nombre: </label><br>
                <input type="text" name="nombre" value="<%=Metodos.convertiNullStringVacio(request.getParameter("nombre"))%>"><br>
                <label>  DNI: </label><br>
                <input type="text" name="dni" value="<%=Metodos.convertiNullStringVacio(request.getParameter("dni"))%>"><br>
                <label>  Jardin: </label><br>
                <select name="jardin">
                    <option></option>
                     <option value="s"<%
                        if(request.getParameter("jardin")!=null){
                            if(request.getParameter("jardin").equals("s")){
                    %>selected<%}
                    }%>>Si</option>
                    <option value="n"<%
                        if(request.getParameter("jardin")!=null){
                            if(request.getParameter("jardin").equals("n")){
                    %>selected<%}
                    }%>>No</option>
                </select><br>
                <label>  Hijos: </label><br>
                <select name="hijo">
                     <option></option>
                    <option value="s"<%
                        if(request.getParameter("hijo")!=null){
                            if(request.getParameter("hijo").equals("s")){
                    %>selected<%}
                    }%>>Si</option>
                    <option value="n"<%
                        if(request.getParameter("hijo")!=null){
                            if(request.getParameter("hijo").equals("n")){
                    %>selected<%}
                    }%>>No</option>
                </select><br>
                <label>  Otros Perros: </label><br>
                <input type="text" name="otrosperros" value="<%=Metodos.convertiNullStringVacio(request.getParameter("otrosperros"))%>"><br>
                <input type="submit" value="Acptar">
                <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>





    </body>
</html>

</html>
