<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Conection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro_de_veiculos</title>
    </head>
    <body>
        <%

        String placa =resquest.getParameter("placa");
        String marca =resquest.getParameter("marca");
        String modelo =resquest.getParameter("modelo");
        String cor =resquest.getParameter("cor");
        String pagamento =resquest.getParameter("pagamento");
        String valor =request.getParameter("valor");
        LocalDateTime dataAtual=LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String data = dataAtual.format(formatter);
            
            
        try{
            Connection conecta;
            PreparamentStatemnt st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/parking";
            String user = "root";
            String password = "root";
            conecta=DriverManager.getConection(url,user,password);
            
            // Executar a consulta
            ResultSet rs = st.executeQuery();
            
         if (rs.next()){
            
            String inout=resquest.getParameter("selectinout");
            
            if("entrada" equals(inout)){
            
            String sql ="INSERT INTO tb_veiculos (placa,marca,modelo,cor,data_entrada,pagamento,valor) VALUES (?,?,?,?,?,?,?)";
            st=conecta.prepareStatement(sql);
            st.setString(1,placa);
            st.setString(2,marca);
            st.setString(3,modelo);
            st.setString(4,cor);
            st.setString(5,data);
            
            st.executeUpdate();
            
            } else{
                
            String sql ="UPDATE tb_veiculos (data_saida,pagamento,valor) VALUES (?,?,?)";
            st=conecta.prepareStatement(sql);
            st.setString(1,data);
            st.setString(2,pagamento);
            st.setString(3,valor);
            
            st.executeUpdate();
            
            }
            }
            
            }catch (Exception x) {
            String erro = x.getMessage();
            if (erro.contains("Duplicate entry")) {
                out.print("<p style='color:blue;font-size:25px'>Este cadastro já existe.</p>");
            } else {
                out.print("<p style='color:red;font-size:25px'>Erro: " + erro + "</p>");
            }
       
        %>
    </body>
</html>
