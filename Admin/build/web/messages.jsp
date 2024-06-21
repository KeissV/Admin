<%-- 
    Document   : mensajes
    Created on : 20 jun. 2024, 08:55:59
    Author     : franc
--%>

<%@ page import="java.util.*,classes.Message,classes.FileHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Solicitudes de Mensajes</title>
</head>
<body>
    <h2>Solicitudes de Mensajes</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Remitente</th>
            <th>Contenido</th>
        </tr>
        <%
            List<Message> messageList = FileHandler.readMessages();
            for (Message message : messageList) {
        %>
        <tr>
            <td><%= message.getName() %></td>
            <td><%= message.getEmail() %></td>
            <td><%= message.getContent() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>


