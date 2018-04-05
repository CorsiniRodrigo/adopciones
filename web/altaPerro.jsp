<%-- 
    Document   : listaAdoptadores
    Created on : 03-abr-2018, 19:04:27
    Author     : Corsini
--%>

<%@page import="Utilidades.Metodos"%>
<%@page import="adopciones.Adoptador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="adopciones.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Alta Perro</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
	<ul>
  <li><a href="#home">Perros</a></li>
  <li><a href="#news">Familias</a></li>
  <li><a href="#contact">Contacto</a></li>
        <h1>Alta Perro</h1>
        <form method="get" action="ServletAltaPerro">
            Chip:<br>
            <input type="text" name="chip"><br>
            Nombre:<br>
            <input type="text" name="nombre"><br>
            Color:<br>
            <input type="text" name="color"><br>
            Raza:<br>
            <input type="text" name="raza"><br>
            Amo:<br>
            <select name="amo">
                <%
                    Gestion gestion = new Gestion();
                    ArrayList<Adoptador> listaAdoptador = gestion.leerAdoptadores();
                    for (Adoptador o : listaAdoptador) {
                    
                        out.println("<option value='" + o.getAdoptadorid() + "'>" + o.getNombre() + "</option>");
                    }
                
                %>
            </select><br>
            Peligroso:<br>
            <select name="peligroso">
                <option value="S">Si</option>
                <option value="N">No</option>
            </select><br>
            Sexo:<br>
            <select name="sexo">
                <option value="m">Macho</option>
                <option value="f">Hembra</option>
            </select><br>
            <input type="submit" value="Acptar">
            <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
        </form>





    </body>
</html>
