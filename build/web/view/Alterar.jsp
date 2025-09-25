<%-- 
    Document   : Gravar
    Created on : 15 de set. de 2025, 14:21:02
    Author     : prampero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="model.*,controller.PessoaDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PessoaDAO dao;
            Pessoa obj;
    
            try{
            
                obj = new Pessoa();
                obj.setCodigo(request.getParameter("txtCodigo"));
                obj.setNome(request.getParameter("txtNome"));
                obj.setNota1(Double.parseDouble(request.getParameter("txtPeso")));
                obj.setNota2(Double.parseDouble(request.getParameter("txtAltura")));
                
                dao = new PessoaDAO();
                dao.alterar(obj);
          
                out.print("<h1>Alterador com sucesso. </h1>");
            }
            catch(Exception ex){
                out.println("<h1> Erro: "+ex.getMessage()+"</h1>");
            }
         %>
    </body>
</html>
