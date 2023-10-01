<%-- 
    Document   : welcome
    Created on : Oct 1, 2023, 12:14:40 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Conteúdos de Cada Semana</h1>
        <h2>Conhecendo Servlet</h2>
        <h2>Senha Hardcoded</h2>
        <h2>Controle de Sessão</h2>
        <h2>JSP</h2>
        <h2>Validação com Banco</h2>
        <h2>MVC</h2>
        <a href=./Menu>Voltar</a>
        <a href=./Sair>Sair</a>
        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>
