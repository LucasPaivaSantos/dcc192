<%-- 
    Document   : menu
    Created on : Oct 1, 2023, 12:40:28 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" />
        <title>Menu</title>
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
        <a href="./welcome.jsp"><br>Boas vindas</a>
        <a href="./ErroJava"><br>Página com erro de Java</a>
        <a href="./erro300.jsp"><br>Página com erro de HTML</a>
        <a href="./Sair"><br>Sair</a>
            <%
            String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
            %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>