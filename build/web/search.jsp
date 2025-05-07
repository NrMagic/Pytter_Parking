<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Variáveis
            Connection cnx = null;
            PreparedStatement st = null;
            ResultSet rs = null;
            LocalDateTime data_entrada;
            
            // Conexão com o banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/Parking";
                String user = "root";
                String password = "root";
                cnx = DriverManager.getConnection(url, user, password);

                // Obtém o número da placa da requisição
                String search = request.getParameter("placa");
                if (search != null && !search.isEmpty()) {
                    // Prepara a consulta SQL para buscar o veículo pela placa
                    String sql = "SELECT * FROM tb_veiculos WHERE placa = ? ORDER BY data_entrada DESC";
                    st = cnx.prepareStatement(sql);
                    st.setString(1, search); // Define a placa como parâmetro da consulta

                    // Executa a consulta
                    rs = st.executeQuery();

                    if (rs.next()) {
                        // Exibe os detalhes do veículo se encontrado
        %>
                        <table border='1'>
                            <tr>
                                <th>Placa</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Cor</th>
                                <th>Data/Entrada</th>
                                <th>Data/Saida</th>
                            </tr>
                            
                            
                            
                            
                            <tr>
                                <td><%= rs.getString("placa") %></td>
                                <td><%= rs.getString("marca") %></td>
                                <td><%= rs.getString("modelo") %></td>
                                <td><%= rs.getString("cor") %></td>
                                <%
                                 data_entrada= rs.getString("data_entrada");
                                 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                 String dateIn=data_entrada.format(formatter);
                                %>
                                <td><%= dateIn %></td>
                                
                            </tr>
                        </table>

                        <div class="line">
                            <label for="labelInput" class="labelInput">Valor</label>
                            <input type="number" name="valor" class="valor" id="valor" required>
                        </div>

                        <div class="line">
                            <label for="labelInput" class="labelInput">Forma de Pagamento</label>
                            <select name="selectpag">
                                <option value="dinheiro" id="dinheiro">Dinheiro</option>
                                <option value="PIX" id="PIX">PIX</option>
                                <option value="cartao" id="cartao">Cartão</option>
                            </select>
                        </div>

        <% 
                    } else {
                        // Se o veículo não for encontrado
                        response.sendRedirect("outcar.html");
                        out.print("<p style='color:red;font-size:25px'>Erro: Placa não encontrada</p>");
                    }
                } else {
                    // Se a placa não for fornecida
                    response.sendRedirect("incar.html");
                    out.print("<p style='color:blue;font-size:25px'>Placa não cadastrada</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.print("<p style='color:red;font-size:25px'>Erro no banco de dados: " + e.getMessage() + "</p>");
            }
        %>
    </body>
</html>
