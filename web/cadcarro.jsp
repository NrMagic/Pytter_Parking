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
        <meta charset="UTF-8">
        <title>Cadastro de Veículos</title>
    </head>
    <body>
        <%
            String placa = request.getParameter("placa");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String cor = request.getParameter("cor");
            String pagamento = request.getParameter("pagamento");
            String valor = request.getParameter("valor");

            LocalDateTime dataAtual = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // <-- formato compatível com MySQL
            String data = dataAtual.format(formatter);

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/parking";
                String user = "root";
                String password = "root";
                Connection conecta = DriverManager.getConnection(url, user, password);
                PreparedStatement st;

                String sql = "INSERT INTO tb_veiculos (placa, marca, modelo, cor, data_entrada) VALUES (?, ?, ?, ?, ?)";
                st = conecta.prepareStatement(sql);
                st.setString(1, placa);
                st.setString(2, marca);
                st.setString(3, modelo);
                st.setString(4, cor);
                st.setString(5, data);
                st.executeUpdate();
                out.print("<p style='color:green;font-size:25px'>Entrada registrada com sucesso!</p>");

                conecta.close();

            } catch (Exception e) {
                String erro = e.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:blue;font-size:25px'>Este cadastro já existe.</p>");
                } else {
                    out.print("<p style='color:red;font-size:25px'>Erro: " + erro + "</p>");
                }
            }
        %>
    </body>
</html>