<%-- 
    Document   : index
    Created on : Sep 5, 2023, 9:46:09 PM
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
        <h1>DCC192 - Atividade 4</h1>
        <p>Digite seu nome e senha, depois clique no botão</p>
        <form action="MenuServlet" method="post">
            <input type="text" name="nome">
            </br>
            <input type="text" name="senha">
            </br>
            <button type="submit">Submeter</button>
        </form>
        <% String mensagem = (String) request.getSession().getAttribute("mensagem");
        if ( mensagem != null ) {
        %> <%-- fim de scriptlet para inserir de dados de template fixa --%>
        <h2><%= mensagem %></h2>
        <% // continua scriptlet
        } // fim do if
        %>
            
    </body>
</html>
