/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ufjf.dcc192.atividade6;

import com.ufjf.dcc192.atividade6.model.DaoUsuario;
import com.ufjf.dcc192.atividade6.model.Usuario;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author lucas
 */
public class Menu extends HttpServlet {

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
        HttpSession session = request.getSession(true);

        ServletContext myServletContext = getServletContext();
        String assignmentNumber = myServletContext.getInitParameter("assignmentNumber");
        String loggedUser = (String) session.getAttribute("loggedUser");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link href=\"styles.css\" rel=\"stylesheet\" />");
            out.println("<title>Menu</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Laboratório de Programação de Sistemas Web</h1>");
            out.println("<h2>Olá " + loggedUser + "! vc entrou corretamente</h2>");
            out.println("<a href=\"./welcome.jsp\"><br>Boas vindas</a>");
            out.println("<a href=\"./ErroJava\"><br>Página com erro de Java</a>");
            out.println("<a href=\"./erro300.jsp\"><br>Página com erro de HTML</a>");
            out.println("<a href=\"./Sair\"><br>Sair</a>");
            out.println("<sup >Essa é a atividade " + assignmentNumber + "</sup>");
            out.println("</body>");
            out.println("</html>");
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
        String sessionTimeout = "Sessão expirada, faça login novamente";
        HttpSession session = request.getSession(true);
        String loggedUser = (String) session.getAttribute("loggedUser");

        if (loggedUser == null) {
            session.setAttribute("msg", sessionTimeout);
            response.sendRedirect("index.jsp");
        } else {
            processRequest(request, response);
        }
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
        HttpSession session = request.getSession(true);

        String username = (String) request.getParameter("userName");
        String password = (String) request.getParameter("password");

        DaoUsuario daoUsuario = new DaoUsuario(1, "ana", "1234");
        List<Usuario> usuarios = daoUsuario.buscarTodos();

        for (Usuario usuario : usuarios) {
            if (usuario.getNome().equals(username) && usuario.getSenha().equals(password)) {
                session.setAttribute("loggedUser", username);
                session.removeAttribute("msg");
                processRequest(request, response);
                break;
            }
        }

        String userNotFound = "Nome de usuário ou senha inválidos";
        session.setAttribute("msg", userNotFound);
        response.sendRedirect("index.jsp");
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
