<%-- 
    Document   : index
    Created on : Oct 8, 2023, 1:09:58 AM
    Author     : lucas
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/atividade7/styles/default.css" rel="stylesheet" />
        <script src="/atividade7/scripts/onWindowClose.js"></script>
        <title>Login DCC192</title>
    </head>
    <body>
        <h1>Laboratório de Programação de Sistemas Web</h1>
        <p>Faça Login</p>
        <form action="Controller" method="post">
            <input type="text" name="userName">
            <br> <!-- Use "br" instead of "br" -->
            <input type="password" name="password">
            <br> <!-- Use "br" instead of "br" -->
            <input type="hidden" name="operacao" value="login">
            <button type="submit">Submeter</button>
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
        String msg = (String) request.getSession().getAttribute("msg"); 
        if (msg != null) {
        %>
        <h2><%= msg %></h2>
        <%
        } 
        %>

        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>
