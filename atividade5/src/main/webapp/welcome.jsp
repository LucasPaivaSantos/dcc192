<%-- 
    Document   : welcome
    Created on : Sep 5, 2023, 9:59:55 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Conteúdos de Cada Semana</h1>
        <h2>Conhecendo Servlet</h2>
        <h2>Senha Hardcoded</h2>
        <h2>Controle de Sessão</h2>
        <h2>JSP</h2>
        <h2>Java DB</h2>
        <a href=./SairServlet>Sair</a>
        <%
        String strNumAtividade = getServletContext().getInitParameter("numAtividade");
        %>
        <sup style="position: fixed;
             bottom: 0;
             left: 0;
             width: 100%;
             background-color: #333;
             color: #fff;
             text-align: center;
             padding: 10px 0;">Essa é a atividade <%= strNumAtividade %>
        </sup>
    </body>
</html>
