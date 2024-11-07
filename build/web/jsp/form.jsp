<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/crear_xml_servlet" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre"><br><br>

        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor"><br><br>

        <label for="genero">Género:</label>
        <input type="text" id="genero" name="genero"><br><br>

        <input type="submit" value="Enviar">
    </form>
</body>
</html>
