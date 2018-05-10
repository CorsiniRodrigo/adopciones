/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import adopciones.Adoptador;
import adopciones.ExcepcionAdopciones;
import adopciones.Gestion;
import adopciones.Perro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
public class ServletBorrarPerro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)           throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList listaerrores = null;
        Perro perro = new Perro();
        Gestion gestion = new Gestion();
        try {
            Adoptador adoptador = new Adoptador();
            adoptador.setAdoptadorid(Integer.parseInt(request.getParameter("adoptador")));
            perro.setAmo(adoptador);
            perro.setChip(Integer.parseInt(request.getParameter("chip")));
            perro.setColor(request.getParameter("color"));
            perro.setIdPerro(Integer.parseInt(request.getParameter("idperro")));
            perro.setNombre(request.getParameter("nombre"));
            perro.setPeligroso(request.getParameter("peligroso"));
            perro.setRaza(request.getParameter("raza"));
            perro.setSexo(request.getParameter("sexo"));
            perro.setIdPerro(Integer.parseInt(request.getParameter("perroId")));
            gestion.borrarPerro(perro.getIdPerro());
        } catch (ExcepcionAdopciones ex) {
            Logger.getLogger(ServletModificarPerro.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<String> validarformulario(HttpServletRequest request) {
        ArrayList<String> listaerrores = new ArrayList();
        if (request.getParameter("color") == null) {

            listaerrores.add("El color es Obligatorio");
        }
        if (request.getParameter("nombre") == null) {

            listaerrores.add("El nombre es Obligatorio");
        }
        if (request.getParameter("raza") == null) {

            listaerrores.add("La raza es Obligatoria");
        }
        

        return listaerrores;
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
