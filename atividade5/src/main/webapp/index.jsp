<%-- 
    Document   : index
    Created on : Sep 21, 2023, 2:52:49 PM
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
        <h1>Laboratório de Programação de Sistemas Web</h1>
        <p>Faça Login</p>
        <form action="Menu" method="post">
            <input type="text" name="username">
            </br>
            <input type="password" name="password">
            </br>
            <button type="submit">Submeter</button>
        </form>
        <% String message = (String) request.getSession().getAttribute("message");
        if ( message != null ) {
        %> <%-- fim de scriptlet para inserir de dados de template fixa --%>
        <h2><%= message %></h2>
        <% // continua scriptlet
        } // fim do if
        %>


        <%
        String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <sup>Essa é a atividade <%= strNumAtividade %></sup>
    </body>
</html>