<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="classes.User" %>
<%@ page import="classes.UserComparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Usuarios Registrados</title>
</head>
<body>
    <h2>Usuarios Registrados</h2>
    <form method="GET" action="index.jsp">
        Ordenar por: 
        <select name="sortBy">
            <option value="name">Nombre</option>
            <option value="email">Email</option>
        </select>
        <input type="submit" value="Ordenar">
    </form>
    
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Last Name</th>
        </tr>
        <% 
            String filePath = "C:\\Users\\Jordy vindas\\OneDrive - Universidad de Costa Rica\\Documentos\\NetBeansProjects\\SimposioUcr\\register.txt";
            BufferedReader reader = null;
            try {
                reader = new BufferedReader(new FileReader(filePath));
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length >= 3) {
                        String name = parts[0].trim();
                        String email = parts[1].trim();
                        String lastname = parts[2].trim();
        %>
        <tr>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= lastname %></td>
        </tr>
        <% 
                    }
                }
            } catch (IOException e) {
                e.printStackTrace(); // Manejo básico de excepciones, ajusta según tus necesidades
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </table>

</body>
</html>
