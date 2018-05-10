<%-- 
    Document   : altausuario
    Created on : 23-abr-2018, 15:00:03
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Includes/cabecera.jsp" %>
        <h1>Alta Usuario</h1>
        <form method="post" action="ServletAutenticador" >  

            <label>Usuario:</label><br>
            <input type="text" name="usuario"/><br>
            <label>Contraseña:</label><br>
            <input type="password" name="contrasena"/><br>
            <label>Repite Contraseña:</label><br>
            <input type="password" name="repetirContrasena"/><br>
            <input type="radio" name="perfil" value="a">Administrador<br> 
            <input type="radio" name="perfil" value="n">Usuario Normal<br> 
            <a href="index.jsp" ><input type="submit" value="Acceder"/></a>  

        </form>

      <%@include file="Includes/footer.jsp" %>