<%-- 
    Document   : listar
    Created on : 6 nov 2024, 19:09:46
    Author     : fgmrr
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Libro" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Libros</title>
</head>
<body>
    <h1>Agregar un Libro</h1>

    <%
        ArrayList<Libro> libros = (ArrayList<Libro>) session.getAttribute("libros");
        if (libros == null) {
            libros = new ArrayList<>();
            session.setAttribute("libros", libros);
        }

        String nombre = request.getParameter("nombre");
        String autor = request.getParameter("autor");
        String genero = request.getParameter("genero");

        if (nombre != null && autor != null && genero != null) {
            Libro nuevoLibro = new Libro(nombre, autor, genero);
            libros.add(nuevoLibro);
        }
    %>

    <form action="listar.jsp" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br><br>

        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br><br>

        <label for="genero">Género:</label>
        <input type="text" id="genero" name="genero" required><br><br>

        <input type="submit" value="Agregar Libro">
    </form>

    <h2>Lista de Libros</h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Autor</th>
            <th>Género</th>
            <th>Acciones</th>
        </tr>
        <%
            for (Libro libro : libros) {
        %>
        <tr>
            <td><%= libro.getNombre() %></td>
            <td><%= libro.getAutor() %></td>
            <td><%= libro.getGenero() %></td>
            <td>
                <form action="generarXML.jsp" method="post">
                    <input type="hidden" name="nombre" value="<%= libro.getNombre() %>">
                    <input type="hidden" name="autor" value="<%= libro.getAutor() %>">
                    <input type="hidden" name="genero" value="<%= libro.getGenero() %>">
                    <input type="submit" value="Generar XML">
                </form>
                <form action="verXML.jsp" method="post" >
                    <input type="hidden" name="nombre" value="<%= libro.getNombre() %>">
                    <input type="hidden" name="autor" value="<%= libro.getAutor() %>">
                    <input type="hidden" name="genero" value="<%= libro.getGenero() %>">
                    <input type="submit" value="Ver desde XML">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>