<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <div class="box">
                <label class="labelInput">Valor por Hora</label>
                <input type="number" id="precohora" required class="inputButton">
                <label class="labelInput">Valor Adicional</label>
                <input type="number" id="adhora" required class="inputButton">
                <label class="labelInput">Total vagas</label>
                <input type="number" id="vagas" required class="inputButton">
                <label class="labelInput">Usuario</label>
                <input type="text" id="user" class="inputButton" required>
                <label class="labelInput">Password</label>
                <input type="password" id="password" class="inputButton" required>
            </div> 
        </form>
        
    </body>
</html>
