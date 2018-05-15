/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import adopciones.ExcepcionAdopciones;
import adopciones.Gestion;
import adopciones.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usuario
 */
public class ServletAutenticador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Gestion gestion;

        try (PrintWriter out = response.getWriter()) {

            ServletContext contexto = request.getServletContext();
            String uE = contexto.getInitParameter("AdministradorEmergencia");
            String cE = contexto.getInitParameter("ContrasennaEmergencia");

            String u = request.getParameter("usuario");
            String p = request.getParameter("contrasena");

            if (uE.equals(u) && cE.equals(p)) {

                Usuario usuario = new Usuario();
                usuario.setNombre(u);
                usuario.setPerfil("A");
                HttpSession sesion = request.getSession();
                sesion.setAttribute("UsuarioSesion", usuario);
                request.getRequestDispatcher("listaAdoptador.jsp").forward(request, response);

            } else {
                try {
                    gestion = new Gestion();
                    ArrayList<Usuario> o = gestion.leerUsuarios();
                    Usuario usuario = new Usuario();
                    int pos = 0;
                    while (pos < o.size()) {

                        if (o.get(pos).getNombre().equals(u) && o.get(pos).getPassword().equals(u)) {
                            usuario.setNombre(u);
                            usuario.setPerfil(o.get(pos).getPerfil());
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("Usuario", usuario);
                            request.getRequestDispatcher("listaAdoptador.jsp").forward(request, response);
                        }

                        pos++;
                    }
               
                } catch (ExcepcionAdopciones ex) {
                    Logger.getLogger(ServletAutenticador.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
