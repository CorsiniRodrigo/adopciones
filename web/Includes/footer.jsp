
         
                <%
                 ServletContext contexto = request.getServletContext();
                 String texto = contexto.getInitParameter("Piedepagina");
                 out.print("<footer>" + texto + "</footer>");
                     
                   
                %>
                
           
    </body>
</html>

