<%-- 
    Document   : usuarios
    Created on : 20 jun. 2024, 08:55:46
    Author     : franc
--%>
<%@ page import="java.util.*,classes.User,classes.FileHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Usuarios Registrados</title>
</head>
<body>
    <h2>Usuarios Registrados</h2>
    <form method="GET" action="users.jsp">
        Ordenar por: 
        <select name="sortBy">
            <option value="name">Nombre</option>
            <option value="email">Email</option>
        </select>
        <input type="submit" value="Ordenar">
    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
        </tr>
        <%
            List<User> userList = FileHandler.readUsers();
            String sortBy = request.getParameter("sortBy");
            if (sortBy != null) {
                if (sortBy.equals("name")) {
                    userList.sort(Comparator.comparing(User::getName));
                } else if (sortBy.equals("email")) {
                    userList.sort(Comparator.comparing(User::getEmail));
                }
            }
            for (User user : userList) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>


