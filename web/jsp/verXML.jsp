<%-- 
    Document   : verXML
    Created on : 6 nov 2024, 19:14:20
    Author     : fgmrr
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<h3>Información del Libro</h3>
        <c:import var="bookInfo" url="file:///Users/fgmrr/books.xml" />
        <x:parse xml="${bookInfo}" var="output" />
        <b>Título</b>:
        <x:out select="$output/Libro/Nombre" />
        <br>
        <b>Autor</b>:
        <x:out select="$output/Libro/Autor" />
        <br>
        <b>Género</b>:
        <x:out select="$output/Libro/Genero" />
<a href="listar.jsp">Volver a la lista</a>