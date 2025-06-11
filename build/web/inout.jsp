<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./src/styles/inout.css">
    </head>
    <body>
        <form method="get">
            <div class="line">
                <label for="labelInput" class="labelInput">Entrada/Saida</label>
                <select name="selectinout" id="selectinout" autofocus required>
                    <option value="Entrada" id="Entrada" selected>Entrada</option>
                    <option value="Saida" id="Saida" >Saida</option>
                </select>
            </div>
            <div class="button">
                <input type="submit" value="Enter" id="submit" class="inputButton">
            </div>
        </form>
        <%  
            String inout;
            inout=request.getParameter("selectinout");
            //out.println("Valor do parâmetro selectinout: " + inout);  // Para verificar o valor do parâmetro
            if("Entrada".equals(inout)){
                
            response.sendRedirect("incar.html");
            }else if("Saida".equals(inout)){
            
            response.sendRedirect("outcar.html");
            }else{
            // Se não encontrar o usuário ou senha no banco
            //out.println("Opção invalida.");

            }
 
        %>
    </body>
</html>