<%-- 
    Document   : erroJava
    Created on : Oct 18, 2023, 3:50:54 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="/atividade8/scripts/windowWatcher.js"></script>
        <title>Erro Java DCC192</title>
    </head>
    <body>
        <h2>Ocorreu um erro de Java!</h2>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>