/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import adopciones.Adoptador;
import adopciones.ExcepcionAdopciones;
import adopciones.Gestion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
public class ServletBorrarAdoptador extends HttpServlet {

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
        ArrayList<String> ListaErrores = null;
       
        Adoptador adoptador = new Adoptador();

        try { Gestion gestion = new Gestion();
            adoptador.setAdoptadorid(Integer.parseInt(request.getParameter("adoptadorId")));
            gestion.borrarAdoptador(adoptador.getAdoptadorid());
            request.setAttribute("mensaje", "Eliminacion Correcta");
            request.getRequestDispatcher("listaAdoptador.jsp").forward(request, response);
        } catch (ExcepcionAdopciones ex) {
            request.setAttribute("mensaje", "La Modificacion ha sido fallida");
            ListaErrores = new ArrayList();
            ListaErrores.add(ex.getMensajeErrorUsuario());
            request.setAttribute("ListaErrores", ListaErrores);
            request.getRequestDispatcher("altaAdoptador.jsp").forward(request, response);
            // Logger.getLogger(ServletAltaPerro.class.getName()).log(Level.SEVERE, null, ex);
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
