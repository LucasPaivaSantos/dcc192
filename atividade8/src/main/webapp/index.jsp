<%-- 
    Document   : index
    Created on : Oct 18, 2023, 3:51:34 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="/atividade8/scripts/windowWatcher.js"></script>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>