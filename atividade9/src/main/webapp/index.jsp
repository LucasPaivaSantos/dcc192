<%-- 
    Document   : index
    Created on : Nov 7, 2023, 3:13:36 PM
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
        <title>Login DCC192</title>
    </head>
    <body class="bg-secondary p-2 text-white">
        <div class="container d-flex justify-content-center align-items-center">
            <div class="col-md-6 text-center">
                <h1 class="mb-4">Laboratório de Programação de Sistemas Web</h1>
                <p class="mb-4">Faça Login</p>
                <form action="Controller" method="post">
                    <input type="text" name="userName" class="form-control mb-3">
                    <input type="password" name="password" class="form-control mb-3">
                    <input type="hidden" name="operacao" value="login">
                    <button type="submit" class="btn btn-outline-dark btn-block">Submeter</button>
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
            </div>
        </div>
    </body>
</html>