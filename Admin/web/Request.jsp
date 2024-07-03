<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Base64" %>
<%@ page import="classes.Decryted" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitudes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        header {
            background: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        nav ul {
            padding: 0;
            list-style: none;
            background: #333;
            text-align: center;
            margin: 0;
        }

        nav ul li {
            display: inline;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 15px 20px;
            display: inline-block;
        }

        nav ul li a:hover {
            background: #575757;
        }

        main {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
            font-weight: bold;
            text-align: center;
            padding: 12px;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Solicitudes</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="users.jsp">Usuarios Registrados</a></li>
                <li><a href="inscripciones.jsp">Inscripciones</a></li>      
                <!-- Agrega más opciones de navegación si es necesario -->
            </ul>
        </nav>
        <main>
            <h2>Solicitudes de Mensajes</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre completo</th>
                        <th>Email</th>
                        <th>Número de teléfono</th>
                        <th>Mensaje</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        String filePath = "C:\\Users\\Jordy vindas\\OneDrive - Universidad de Costa Rica\\Documentos\\NetBeansProjects\\SimposioUcr\\request.txt";
                        try {
                            List<String> lines = Files.readAllLines(Paths.get(filePath), StandardCharsets.UTF_8);
                            Decryted decryted = new Decryted();
                            for (String line : lines) {
                                String[] parts = line.split(","); // Suponiendo que los datos están separados por comas
                    %>
                                <tr>
                                    <td><%= decryted.decrypt(parts[0]) %></td>
                                    <td><%= decryted.decrypt(parts[1]) %></td>
                                    <td><%= decryted.decrypt(parts[2]) %></td>
                                    <td><%= decryted.decrypt(parts[3]) %></td>
                                </tr>
                    <% 
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>
