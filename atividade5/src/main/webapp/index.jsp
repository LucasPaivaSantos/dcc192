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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String strNumAtividade = getServletContext().getInitParameter("assignmentNumber");
        %>
        <h1>DCC192 - Atividade <%= strNumAtividade %></h1>
        <p>Digite seu nome e senha, depois clique no botão</p>
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



        <sup style="position: fixed;
             bottom: 0;
             left: 0;
             width: 100%;
             background-color: #333;
             color: #fff;
             text-align: center;
             padding: 10px 0;">Essa é a atividade <%= strNumAtividade %>
        </sup>


    </body>
</html>