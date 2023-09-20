/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ufjf.dcc192.atividade4;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author lucas
 */
public class MenuServlet extends HttpServlet {

    String strSaudacao;

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
        //declara objeto sessão
        HttpSession session = request.getSession(true);
        //recupera o valor de "logged", atributo de session
        String resposta = (String) session.getAttribute("logged");

        ServletContext myServletContext = getServletContext();
        String strNumAtividade = myServletContext.getInitParameter("numAtividade");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>A Simple Session Example</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>DCC192 - Atividade " + strNumAtividade + "</h1>");
            out.println("<h2>" + strSaudacao + " " + resposta + "! vc entrou corretamente</h2>");
            out.println("<a href=\"./welcome.jsp\"><br>Boas vindas</a>");
            out.println("<a href=\"./ErroJava\"><br>Página com erro de Java</a>");
            out.println("<a href=\"./erro300.jsp\"><br>Página com erro de HTML</a>");
            out.println("<a href=\"./SairServlet\"><br>Sair</a>");
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
    public void init() {
        strSaudacao = getInitParameter("saudacao");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String resp = (String) session.getAttribute("logged");

        if (resp == null) {
            response.sendRedirect("index.jsp");
        } else {
            processRequest(request, response);
        }
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
        //declara nome
        String nome = request.getParameter("nome");
        String senhaRecebida = request.getParameter("senha");

        //recupera senha definida no web.xml
        String senhaCorreta = getServletConfig().getInitParameter("senha");

        if (senhaRecebida.equals(senhaCorreta)) {
            //adiciona o atributo "logged" a sessão, inicializa "logged" com o valor de "nome"
            request.getSession(true).setAttribute("logged", nome);
            request.getSession(true).setAttribute("mensagem", null);
            processRequest(request, response);

        } else {
            String msg = "Senha inválida, tente novamente";

            request.getSession(true).setAttribute("mensagem", msg);
            response.sendRedirect("index.jsp");
        }
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
