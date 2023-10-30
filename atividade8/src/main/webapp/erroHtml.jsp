<%-- 
    Document   : erroHtml
    Created on : Oct 18, 2023, 3:49:33 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/atividade8/styles/default.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="/atividade8/scripts/windowWatcher.js"></script>
        <title>Erro HTML DCC192</title>
    </head>
    <body>
        <h2>Ocorreu um erro de HTML!</h2>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="menu">
            <button type="submit">Menu</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="sair">
            <button type="submit">Sair</button>
        </form>
        <%
                String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <%
        Integer loggedUsers = (Integer) getServletContext().getAttribute("userCount"); 
        if (loggedUsers != null) {
        %>
        <div class="users-counter mb-4">
            <div>Essa é a atividade <%= strNumAtividade %></div>
            <div>Usuários logados no momento: <div><%= loggedUsers %></div> </div>
        </div>
        <%
        } 
        else {
        %>
        <div class="users-counter mb-4">
            <div>Essa é a atividade <%= strNumAtividade %></div>
            <div>Usuários logados no momento: <div>0</div> </div>
        </div>
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
    </body>
</html>