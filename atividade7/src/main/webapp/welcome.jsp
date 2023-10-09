<%-- 
    Document   : welcome
    Created on : Oct 8, 2023, 1:15:07 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/atividade7/styles/default.css" rel="stylesheet" />
        <script src="/atividade7/scripts/onWindowClose.js"></script>
        <title>Welcome DCC192</title>
    </head>
    <body>
        <h1>Conteúdos de Cada Semana</h1>
        <ol>
            <li>Conhecendo Servlet</li>
            <li>Login Hardcoded</li>
            <li>Controle de Sessão</li>
            <li>JSP</li>
            <li>Validação com Banco</li>
            <li>MVC</li>
            <li>Event Listeners</li>
        </ol>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="menu">
            <button type="submit">Menu</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="sair">
            <button type="submit">Sair</button>
        </form>

        <% 
        Integer loggedUsers = (Integer) getServletContext().getAttribute("userCount"); 
        if (loggedUsers != null) {
        %>
        <div class="users-counter">Usuários logados no momento: <div><%= loggedUsers %></div>
        </div><%
        } 
        else {
        %>
        <div class="users-counter">Usuários logados no momento: <div>0</div></div>
        <%
        } 
        %>

        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>