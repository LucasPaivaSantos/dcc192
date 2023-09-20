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
        <h1>DCC192</h1>
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
