<%-- 
    Document   : index
    Created on : 23-abr-2018, 14:37:00
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="ServletAutenticador" >  
            <h1>Alta Usuario</h1>
            <label>Usuario:</label>
            <input type="text" name="usuario">
            <label>Contraseña:</label>
            <input type="password" name="contrasena">
            <input type="submit" value="Acceder">  
            <a href = "altausuario.jsp">Nuevo Usuario</a>
        </form>
    </body>
</html>
