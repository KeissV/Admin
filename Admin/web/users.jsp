<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="Treee.Tree"%>
<%@page import="Treee.Person"%>
<%@page import="classes.Decryted"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
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
            <h1>Panel de Administración</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="Request.jsp">Inscripciones</a></li>
                <li><a href="Request.jsp">Solicitudes</a></li>
            </ul>
        </nav>
        <main>
            <h2>Usuarios Registrados</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre completo</th>
                        <th>Nombre de usuario</th>
                        <th>Email</th>
                        <th>Número de identificación</th>
                        <th>Número de teléfono</th>
                        <th>Institución</th>
                        <th>Área de interés</th>
                        <th>Rol</th>
                        <th>Tipo de participante</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        String filePath = "C:\\Users\\Jordy vindas\\OneDrive - Universidad de Costa Rica\\Documentos\\NetBeansProjects\\SimposioUcr\\register.txt";
                        Tree tree = new Tree();
                        Decryted decrypter = new Decryted();

                        try {
                            // Leer datos desde el archivo y agregar al árbol
                            tree.readFromFileAndInsert(filePath, decrypter);
                        } catch (IOException e) {
                            out.println("Error al leer o procesar el archivo: " + e.getMessage());
                        }

                        // Obtener la lista de personas del árbol
                        List<Person> persons = tree.getAllPersons();

                        // Iterar sobre la lista de personas para mostrarlas en la tabla
                        for (Person person : persons) {
                    %>
                        <tr>
                            <td><%= person.getFullName() %></td>
                            <td><%= person.getUsername() %></td>
                            <td><%= person.getEmail() %></td>
                            <td><%= person.getIdNumber() %></td>
                            <td><%= person.getPhoneNumber() %></td>
                            <td><%= person.getInstitution() %></td>
                            <td><%= person.getInterestArea() %></td>
                            <td><%= person.getRole() %></td>
                            <td><%= person.getParticipantType() %></td>
                        </tr>
                    <% 
                        } // Fin del bucle for
                    %>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>
