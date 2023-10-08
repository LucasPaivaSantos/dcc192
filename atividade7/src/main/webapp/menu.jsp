<%-- 
    Document   : menu
    Created on : Oct 8, 2023, 1:14:39 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" />
        <title>Menu DCC192</title>
    </head>
    <body>
        <% String usuario = (String) request.getSession().getAttribute("usuario");
        if (usuario != null) {
        %>
        <h1>Laboratório de Programação de Sistemas Web</h1>
        <h2>Olá <%= usuario%>! Você entrou corretamente</h2>
        <% 
        } 
        %>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="welcome">
            <button type="submit">Boas vindas</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="erroJava">
            <button type="submit">Erro Java</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="erroHtml">
            <button type="submit">Erro HTML</button>
        </form>
        <form action="Controller" method="post">
            <input type="hidden" name="operacao" value="sair">
            <button type="submit">Sair</button>
        </form>

        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>