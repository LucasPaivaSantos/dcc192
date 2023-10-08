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
import java.util.List;

public class Controller extends HttpServlet {

    public void increaseUsers() {
        ServletContext context = getServletContext();

        String initParam = context.getInitParameter("loggedUsers");
        Integer loggedUsers = (initParam != null) ? Integer.parseInt(initParam) : 0;
        loggedUsers++;
        String strLoggedUsers = Integer.toString(loggedUsers);

        context.setAttribute("loggedUsers", strLoggedUsers);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = null;
        String loggedIn = null;
        RequestDispatcher rd = null;
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String operacao = request.getParameter("operacao");

        session = request.getSession(true);

        if (operacao != null) {
            if (operacao.equals("login")) {
                String dbUsername = getServletContext().getInitParameter("dbUsername");
                String dbPassword = getServletContext().getInitParameter("dbPassword");
                DaoUsuario daoUsuario = new DaoUsuario(1, dbUsername, dbPassword);
                List<Usuario> usuarios = daoUsuario.buscarTodos();

                boolean credenciaisValidas = false;
                for (Usuario usuario : usuarios) {
                    if (usuario.getNome().equals(userName) && usuario.getSenha().equals(password)) {
                        credenciaisValidas = true;
                        session.setAttribute("loggedIn", "TRUE");
                        //increaseUsers();
                        session.setAttribute("usuario", userName);
                        rd = request.getRequestDispatcher("menu.jsp");
                        rd.forward(request, response);
                        break;
                    }
                }

                if (!credenciaisValidas) {
                    session.setAttribute("loggedIn", "FALSE");
                    session.setAttribute("msg", "Usuário ou Senha inválido");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
            } else {
                loggedIn = (String) session.getAttribute("loggedIn");
                if (loggedIn == null || !loggedIn.equals("TRUE")) {
                    session.setAttribute("msg", "Sua sessão expirou!");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                } else {
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
                            session.setAttribute("loggedIn", "FALSE");
                            rd = request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                            break;
                        default:
                            session.setAttribute("loggedIn", "FALSE");
                            rd = request.getRequestDispatcher("erro.jsp");
                            rd.forward(request, response);
                    }
                }
            }
        } else {
            session.setAttribute("loggedIn", "FALSE");
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
