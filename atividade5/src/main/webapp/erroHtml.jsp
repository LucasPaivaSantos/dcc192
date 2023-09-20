<%-- 
    Document   : erroHtml
    Created on : Sep 9, 2023, 2:07:16 AM
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
        <h2>Ocorreu um erro de HTML!</h2>
        <%
            String strNumAtividade = getServletContext().getInitParameter("numAtividade");
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
