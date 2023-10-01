<%-- 
    Document   : erroJava
    Created on : Oct 1, 2023, 12:13:03 AM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet" />
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Ocorreu um erro de java!</h2>
        <a href=./Menu>Voltar</a>
        <a href=./Sair>Sair</a>
        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>