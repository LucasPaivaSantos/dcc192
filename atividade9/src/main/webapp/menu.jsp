<%-- 
    Document   : menu
    Created on : Nov 7, 2023, 3:15:43 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/atividade9/styles/default.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="/atividade9/scripts/windowWatcher.js"></script>
        <title>Menu DCC192</title>
    </head>
    <body class="bg-secondary p-2 text-white">
        <%
        String usuario = (String) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario = usuario.substring(0, 1).toUpperCase() + usuario.substring(1);
        %>
        <h1 class="mb-4">Laboratório de Programação de Sistemas Web</h1>
        <h2 class="mb-4">Olá <%= usuario %>! Você entrou corretamente</h2>
        <% 
        } 
        %>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="welcome">
            <button type="submit" class="btn btn-outline-dark btn-sm float-left mb-2">Boas vindas</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="erroJava">
            <button type="submit" class="btn btn-outline-dark btn-sm float-left mb-2">Erro Java</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="erroHtml">
            <button type="submit" class="btn btn-outline-dark btn-sm float-left mb-2">Erro HTML</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="sair">
            <button type="submit" class="btn btn-outline-dark btn-sm float-left mb-2">Sair</button>
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
    </body>
</html>