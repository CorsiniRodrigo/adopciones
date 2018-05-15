/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Utilidades.Metodos;
import adopciones.Adoptador;
import adopciones.ExcepcionAdopciones;
import adopciones.Gestion;
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
public class ServletAltaAdoptador extends HttpServlet {

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
        ArrayList<String> ListaErrores = validarFormulario(request);
        if (ListaErrores == null) {
           try {     Gestion gestion = new Gestion();
            Adoptador adoptador = new Adoptador();
            adoptador.setDni(request.getParameter("dni"));
            adoptador.setHijo(request.getParameter("hijo"));
            adoptador.setJardin(request.getParameter("jardin"));
            adoptador.setNombre(request.getParameter("nombre"));
            adoptador.setOtrosPerros(Integer.parseInt(request.getParameter("otrosperros")));
        
                gestion.insertarAdoptador(adoptador);
                request.setAttribute("mensaje", "Insercíon Correcta");
                request.getRequestDispatcher("listaAdoptador.jsp").forward(request, response);
            } catch (ExcepcionAdopciones ex) {
                request.setAttribute("mensaje", "La insercion ha sido fallida");
                ListaErrores = new ArrayList();
                ListaErrores.add(ex.getMensajeErrorUsuario());
                request.setAttribute("ListaErrores", ListaErrores);
                request.getRequestDispatcher("altaAdoptador.jsp").forward(request, response);
                // Logger.getLogger(ServletAltaPerro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.setAttribute("mensaje", "La insercion ha sido fallida");
            request.setAttribute("ListaErrores", ListaErrores);
            request.getRequestDispatcher("altaAdoptador.jsp").forward(request, response);
        }
    }

    private ArrayList<String> validarFormulario(HttpServletRequest request) {

        ArrayList<String> ListaErrores = new ArrayList();

        if (request.getParameter("dni").length() != 9) {
            ListaErrores.add("El Dni debe tener una longitud de 9 digitos");
        }
          if (request.getParameter("nombre").length() >20) {
            ListaErrores.add("El Nombre debe tener una longitud inferior a 20 digitos");
        }
          
              if (request.getParameter("dni") == null) {
            ListaErrores.add("Aceso no Autorizado");
        }
          if (request.getParameter("nombre")== null) {
            ListaErrores.add("Acceso no Autorizado");
        }
            if (Metodos.esEntero(request.getParameter("otrosperros"))==false) {
            ListaErrores.add("Si tiene Otros Perros debes introducir el numero de animales que tiene en casa ");
        }
                if ( request.getParameter("otrosperros")==null) {
           ListaErrores.add("Acceso no Autorizado");
        }


        if (ListaErrores.size() == 0) {
            return null;
        } else {
            return ListaErrores;
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
