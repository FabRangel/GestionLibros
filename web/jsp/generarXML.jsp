<%-- 
    Document   : generarXML
    Created on : 6 nov 2024, 19:13:56
    Author     : fgmrr
--%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.TransformerException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@ page import="java.io.*" %>

<%
    String nombre = request.getParameter("nombre");
    String autor = request.getParameter("autor");
    String genero = request.getParameter("genero");

    try {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.newDocument();

        Element root = document.createElement("Libro");
        document.appendChild(root);

        Element nombreElement = document.createElement("Nombre");
        nombreElement.appendChild(document.createTextNode(nombre));
        root.appendChild(nombreElement);

        Element autorElement = document.createElement("Autor");
        autorElement.appendChild(document.createTextNode(autor));
        root.appendChild(autorElement);

        Element generoElement = document.createElement("Genero");
        generoElement.appendChild(document.createTextNode(genero));
        root.appendChild(generoElement);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource source = new DOMSource(document);
        
        String fileName = nombre.replace(" ", "_") + ".xml"; 
        
        File directory = new File("/Users/fgmrr/books/"); 

        if (!directory.exists()) {
            directory.mkdirs();
        }

        File file = new File(directory, fileName);
        StreamResult result = new StreamResult(file);
        transformer.transform(source, result);

        response.getWriter().println("Archivo XML creado con éxito en " + file.getAbsolutePath());

    } catch (ParserConfigurationException | TransformerException e) {
        e.printStackTrace();
        response.getWriter().println("Ocurrió un error al crear el archivo XML: " + e);
    }
%>

<a href="listar.jsp">Volver a la lista</a>