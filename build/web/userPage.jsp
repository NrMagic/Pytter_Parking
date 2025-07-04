<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./src/styles/userPage.css">
    </head>
    <body>
        <form method="post">
            <div class="box">
                <div class="row">
                    <label class="labelInput">Valor por Hora</label>
                    <input type="number" id="precohora"  class="inputButton">
                </div>
                <div class="row">
                    <label class="labelInput">Valor Adicional</label>
                    <input type="number" id="adhora"  class="inputButton">
                </div>
                <div class="row">
                    <label class="labelInput">Total vagas</label>
                    <input type="number" id="vagas" class="inputButton">
                </div>
                <div class="row">
                    <label class="labelInput">Usuario</label>
                    <input type="text" id="User" class="inputButton" >
                </div>
                <div class="row">
                    <label class="labelInput">Password</label>
                    <input type="password" id="Password" class="inputButton" >
                </div>
                <div class="row">
                    <label>Admin</label>
                    <input type="radio" name="gestao" value="admin">
                </div>
                <div class="row">
                    <label>Usuario</label>
                    <input type="radio" name="gestao" value="usuario">
                </div>
            </div>
            <div class="button">
                <input type="submit" id="submit">
            </div>
        </form>
        <%
            double precohora = 0.0;
            double adhora = 0.0;
            int totalvagas = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/parking";
                String user = "root";
                String password = "root";
                Connection conecta = DriverManager.getConnection(url, user, password);
                PreparedStatement st;
                
                precohora=Double.parseDouble(request.getParameter("precohora"));
                adhora=Double.parseDouble(request.getParameter("adhora"));
                totalvagas=Integer.parseInt(request.getParameter("vagas"));
                String usuario=request.getParameter("User");
                String senha=request.getParameter("password");
            }catch (Exception e) {
                String erro = e.getMessage();
            }
        %>
    </body>
</html>