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
    </head>
    <body>
        <div class="line">
            <label for="labelInput" class="labelInput">Entrada/Saida</label>
        <select name="selectinout">
            <option value="Entrada" id="entrada" name="entrada">entrada</option>
            <option value="Saida" id="saida">Saida</option>
        </select>
        <input type="submit" value="Enter" id="submit" class="inputButton">
        </div>  
        <%  
            ResultSet rs;
            
            if(rs.next()){
            String inout=request.getParameter("selectinout");
            
            if("entrada".equals(inout)){
                
            response.sendRedirect("incar.html");
            } else{
            
            response.sendRedirect("outcar.html");

            }
            }else{
            
            
            
                    // Se não encontrar o usuário ou senha no banco
                    out.println("Opção invalida.");
            }
            %>
    </body>
</html>
