<%-- 
    Document   : Listar
    Created on : 15 de set. de 2025, 15:21:04
    Author     : prampero
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  language="java" import="model.*,controller.PessoaDAO" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Alunos - IMC</title>
        <style>
            table {
                border-collapse: collapse;
                margin: 20px auto;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
            .abaixo-peso { color: #0066cc; font-weight: bold; }
            .peso-normal { color: #00cc00; font-weight: bold; }
            .sobrepeso { color: #ff9900; font-weight: bold; }
            .obesidade { color: #cc0000; font-weight: bold; }
        </style>
    </head>
    <body>
        <jsp:useBean id="dao" class="controller.AlunoDAO" scope="page">
        </jsp:useBean>
        <%
            List<Aluno> lista;
            lista=dao.listar();
        %>
        <p align='center'>
            <font size='20px'>Lista de Alunos - Índice de Massa Corporal <%=request.getParameter("meuNome")%>
            </font></p>
        <table align='center' border='1'>
            <thead>
            <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>Peso (kg)</th>
            <th>Altura (m)</th>
            <th>IMC</th>
            <th>Situação</th>
            </tr>
            </thead>
            <tbody>
        <%
            for(Aluno v : lista){
                // Assumindo que getNota1() retorna o peso e getNota2() retorna a altura
                double peso = v.getNota1();
                double altura = v.getNota2();
                double imc = 0.0;
                String situacao = "";
                String classeCSS = "";
                
                if(altura > 0) {
                    imc = peso / (altura * altura);
                    
                    if(imc < 18.5) {
                        situacao = "Abaixo do peso";
                        classeCSS = "abaixo-peso";
                    } else if(imc >= 18.5 && imc < 25.0) {
                        situacao = "Peso normal";
                        classeCSS = "peso-normal";
                    } else if(imc >= 25.0 && imc < 30.0) {
                        situacao = "Sobrepeso";
                        classeCSS = "sobrepeso";
                    } else {
                        situacao = "Obesidade";
                        classeCSS = "obesidade";
                    }
                } else {
                    situacao = "Altura inválida";
                }
        %>
        <tr>
        <td> <%=v.getCodigo()%> </td>
        <td> <%=v.getNome()%> </td>
        <td> <%=String.format("%.1f", peso)%> </td>
        <td> <%=String.format("%.2f", altura)%> </td>
        <td> <%=altura > 0 ? String.format("%.2f", imc) : "N/A"%> </td>
        <td class="<%=classeCSS%>"> <%=situacao%> </td>
        </tr>
        <%
            }
        %>
        </tbody>
        </table>
        
        <div align="center" style="margin-top: 30px;">
            <h3>Classificação do IMC:</h3>
            <table border="1" style="margin: 0 auto;">
                <tr>
                    <th>IMC</th>
                    <th>Classificação</th>
                </tr>
                <tr>
                    <td>Menor que 18,5</td>
                    <td class="abaixo-peso">Abaixo do peso</td>
                </tr>
                <tr>
                    <td>18,5 a 24,9</td>
                    <td class="peso-normal">Peso normal</td>
                </tr>
                <tr>
                    <td>25,0 a 29,9</td>
                    <td class="sobrepeso">Sobrepeso</td>
                </tr>
                <tr>
                    <td>30,0 ou maior</td>
                    <td class="obesidade">Obesidade</td>
                </tr>
            </table>
        </div>
    </body>
</html>