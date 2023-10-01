package com.ufjf.dcc192.atividade6;

import com.ufjf.dcc192.atividade6.model.DaoUsuario;
import com.ufjf.dcc192.atividade6.model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class Controller extends HttpServlet {

    public boolean login(String _user, String _pass) {
        DaoUsuario daoUsuario = new DaoUsuario(1, "ana", "1234");
        Usuario temp = daoUsuario.buscar(_user);
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

        session = request.getSession(true);

        if (operacao != null) {
            if (operacao.equals("login")) {
                DaoUsuario daoUsuario = new DaoUsuario(1, "ana", "1234");
                List<Usuario> usuarios = daoUsuario.buscarTodos();

                boolean credenciaisValidas = false;
                for (Usuario usuario : usuarios) {
                    if (usuario.getNome().equals(userName) && usuario.getSenha().equals(password)) {
                        credenciaisValidas = true;
                        session.setAttribute("loggedIn", "TRUE");
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
                        case "ajuda":
                            rd = request.getRequestDispatcher("ajuda.jsp");
                            rd.forward(request, response);
                            break;
                        case "erro_java":
                            throw new ServletException();
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
