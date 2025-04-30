<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

        Connection cnx;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url ="jdbc:mysql://localhost:3306/Parking";
        String user ="root";
        String password ="root";
        cnx = DriverManager.getConnection(url, user, password);
        
        String sql;
        
        sql="SELECT * FROM tb_veiculos WHERE placa LIKE ORDEM BY data DESC";
        
        ResultSet rs = st.executeQuery();

        if (rs.next()){
            
        String search = request.getParameter("placa");  // Recebe o valor da pesquisa

            if(sql==search){
            %>
                <tr>
                    <td><%rs.getString("placa") %></td>
                    <td><%rs.getString("marca") %></td>
                    <td><%rs.getString("modelo") %></td>
                    <td><%rs.getString("cor") %></td>
                    <td><%rs.getString("data_entrada") %></td>
                </tr>
                 <div class="line">
                          <label for="labelInput" class="labelInput">Valor</label>
                          <input type="number" name="valor" class="valor" id="valor" required>
                      </div>
                        <div class="line">
                    <label for="labelInput" class="labelInput">Forma de PAgamento</label>
                    <select name="selectpag">
                        <option value="dinheiro" id="dinheiro">Dinheiro</option>
                        <option value="PIX" id="PIX">PIX</option>
                        <option value="cartao" id="cartao">Cartão</option>
                    </select>
               <% } else{
                        
                        response.sendRedirect("outcar.html");
                        out.print("<p style='color:red;font-size:25px'>Erro Placa não encontrada");
               
                        }}else{
                        
                         response.sendRedirect("incar.html");
                        out.print("<p style='color:blue;font-size:25px'>Placa não cadastrada");
}
        
        
        %>
    </body>
</html>