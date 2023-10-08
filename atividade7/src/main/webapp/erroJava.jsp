<%-- 
    Document   : erroJava
    Created on : Oct 8, 2023, 1:13:25 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" />
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
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>