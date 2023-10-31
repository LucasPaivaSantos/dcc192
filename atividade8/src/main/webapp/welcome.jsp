<%-- 
    Document   : welcome
    Created on : Oct 18, 2023, 3:52:50 PM
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
        <title>Welcome DCC192</title>
    </head>
    <body class="bg-secondary p-2 text-white">
        <h1>Conteúdos de Cada Semana</h1>
        <ol>
            <li>Conhecendo Servlet</li>
            <li>Login Hardcoded</li>
            <li>Controle de Sessão</li>
            <li>JSP</li>
            <li>Validação com Banco</li>
            <li>MVC</li>
            <li>Event Listeners</li>
            <li>Frameworks</li>
        </ol>
        <div class="btn-group" role="group">
            <form action="Controller" method="post">
                <input type="hidden" name="operacao" value="menu">
                <button type="submit" class="btn btn-outline-dark">Menu</button>
            </form>
            <form action="Controller" method="post">
                <input type="hidden" name="operacao" value="sair">
                <button type="submit" class="btn btn-outline-dark">Sair</button>
            </form>
        </div>
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
        <h2 class="mb-4"><%= msg %></h2>
        <%
        } 
        %>
    </body>
</html>
