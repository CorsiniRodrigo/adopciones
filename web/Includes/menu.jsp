<%-- 
    Document   : menu
    Created on : 15-may-2018, 9:43:11
    Author     : usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="adopciones.Usuario"%>
<ul>
    <li><a href="listaPerros.jsp">Perros</a></li>
        <%
            HttpSession sesion = request.getSession();
            Usuario usuarioSesion = (Usuario) sesion.getAttribute("usuario");
            if (usuarioSesion == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                ArrayList<String> ListaErrores = new ArrayList();

            }
            if (usuarioSesion.getPerfil().equals("A")) {
                out.println("<li><a href='listaAdoptador.jsp'>Familias</a></li>");
            }


        %>
    <li><a href="https://es-es.facebook.com/ADOPTA-EN-ESPA%C3%91A-311579258852821/">Contacto</a></li>
        <%    out.println("<li><a href='index.jsp'>usuario</a></li>");%>
</ul><br>
