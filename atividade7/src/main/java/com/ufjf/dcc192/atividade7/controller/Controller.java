/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ufjf.dcc192.atividade7.controller;

import com.ufjf.dcc192.atividade7.model.DaoUsuario;
import com.ufjf.dcc192.atividade7.model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void incrementUserCount(ServletContext context) {
        Integer userCount = (Integer) context.getAttribute("userCount");
        if (userCount == null) {
            userCount = 0;
        }
        userCount++;
        context.setAttribute("userCount", userCount);
    }

    public void decrementUserCount(ServletContext context) {
        Integer userCount = (Integer) context.getAttribute("userCount");
        if (userCount != null && userCount > 0) {
            userCount--;
            context.setAttribute("userCount", userCount);
        }
    }

    public boolean login(String _user, String _pass) {
        String dbUsername = getServletContext().getInitParameter("dbUsername");
        String dbPassword = getServletContext().getInitParameter("dbPassword");
        DaoUsuario da = new DaoUsuario(1, dbUsername, dbPassword);
        Usuario temp = da.buscar(_user);
        if (temp == null || !(_pass.equals(temp.getSenha()))) {
            return false;
        }
        return true;
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = null;
        String loggedIn = null;
        RequestDispatcher rd = null;
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String operacao = request.getParameter("operacao");

        // Verifica se está tentando logar
        session = request.getSession(true);
        if (operacao != null) {
            if (operacao.equals("login")) {
                // Valida login e vai para menu
                if (login(userName, password)) {
                    incrementUserCount(getServletContext()); // Incrementa o contador
                    session.setAttribute("loggedIn", "TRUE");
                    session.setAttribute("usuario", userName);
                    rd = request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                } else {
                    session.setAttribute("loggedIn", "FALSE");
                    session.setAttribute("msg", "Usuário ou Senha inválido");
                    rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } // senao, verifica se já está logado
            else {
                // Gerenciamento de sessao
                loggedIn = (String) session.getAttribute("loggedIn");
                if (loggedIn == null || !loggedIn.equals("TRUE")) {
                    session.setAttribute("msg", "Sua sessão expirou!");
                    rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } // Executa a operação desejada
                else {
                    switch (operacao) {
                        case "menu":
                            rd = request.getRequestDispatcher("menu.jsp");
                            rd.forward(request, response);
                            break;
                        case "welcome":
                            rd = request.getRequestDispatcher("welcome.jsp");
                            rd.forward(request, response);
                            break;
                        case "erroJava":
                            throw new ServletException();
                        case "erroHtml":
                            rd = request.getRequestDispatcher("erro300.jsp");
                            rd.forward(request, response);
                        case "sair":
                            decrementUserCount(getServletContext());
                            session.setAttribute("loggedIn", "FALSE");
                            rd = request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                            break;
                        default:
                            session.setAttribute("loggedIn", "FALSE");
                            rd = request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                    }
                }
            }
        } else {
            decrementUserCount(getServletContext());
            session.setAttribute("loggedIn", "FALSE");
            rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
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
