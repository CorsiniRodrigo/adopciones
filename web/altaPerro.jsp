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
<%@include file="Includes/cabecera.jsp" %>
   

        <h1>Alta Perro</h1>
        <fieldset>
            <form method="get" action="ServletAltaPerro">
                <label>   Chip: </label><br>
                <input type="text" name="chip" required><br>
                <label>  Nombre:</label><br>
                <input type="text" name="nombre" required><br>
                <label>  Color:</label><br>
                <input type="text" name="color" required><br>
                <label>  Raza:</label><br>
                <input type="text" name="raza" required><br>
                <label>  Amo:</label><br>
                <select name="amo" required>
                    <option value=' '> </option>
                    <%
                        Gestion gestion = new Gestion();
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

                <input type="radio" name="sexo" value="m"> Masculino<br>
                <input type="radio" name="sexo" value="f"> Femenino<br>
                <input type="submit" value="Acptar">
                <a href="listaPerros.jsp"><input type="button" value="Cancelar"></a>
            </form>
        </fieldset>

   <%@include file="Includes/footer.jsp" %>