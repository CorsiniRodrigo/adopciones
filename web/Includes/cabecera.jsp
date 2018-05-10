<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos/css.css">
        <title>JSP Page</title>
    </head>

    <body>
       	<h1><img src="Imagenes/encabezado.jpg" ></h1>
        <ul>
            <li><a href="listaPerros.jsp">Perros</a></li>
                <%
                 //  HttpSession sesion = request.getSession();
                // Usuario   Object usuarioSesion = (Usuario)  sesion.getAttribute("usuarioSesion");
                 //   if (usuarioSesion == null) {

                   //     request.getRequestDispatcher("index.jsp").forward(request, response);
                    //    ArrayList<String> ListaErrores = new ArrayList();

                 //   }
                   // if (usuarioSesion.equals("A")) {
                  //      out.println("<li><a href='listaAdoptador.jsp'>Familias</a></li>");
                  //  }


                %>

<li><a href="listaAdoptador.jsp">Familias</a></li>
            <li><a href="https://es-es.facebook.com/ADOPTA-EN-ESPA%C3%91A-311579258852821/">Contacto</a></li>
                <%    out.println("<li><a href='index.jsp'>usuario</a></li>"); %>
        </ul><br>