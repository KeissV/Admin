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
            width: 90%; /* Ajustar el ancho del contenedor principal */
            margin: auto;
            overflow: hidden;
        }

        header {
            background: #0033A0; /* Color oficial de la UCR */
            color: #fff;
            padding: 10px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        header h1 {
            margin: 0;
            font-size: 2.5em;
        }

        nav {
            background: #0033A0; /* Color oficial de la UCR */
            text-align: center;
            padding: 10px 0;
        }

        nav ul {
            padding: 0;
            list-style: none;
            margin: 0;
        }

        nav ul li {
            display: inline;
            margin: 0 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
        }

        nav ul li a:hover {
            background: #00509E; /* Un tono más claro del color oficial */
        }

        main {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow-x: auto; /* Permitir desplazamiento horizontal en tablas largas */
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

        @media (max-width: 992px) {
            .container {
                width: 95%; /* Ajustar el ancho del contenedor en pantallas más pequeñas */
            }

            table {
                font-size: 0.9em; /* Reducir tamaño de fuente para ajustar en pantallas pequeñas */
            }
        }

        @media (max-width: 768px) {
            nav ul li {
                margin: 5px 0;
            }

            nav ul li a {
                padding: 8px 12px;
            }

            table {
                font-size: 0.8em; /* Reducir aún más el tamaño de fuente para pantallas muy pequeñas */
            }
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
                <li><a href="Inscriptions.jsp">Inscripciones</a></li>
                <li><a href="Request.jsp">Solicitudes</a></li>
                <!-- Agrega más opciones de navegación si es necesario -->
            </ul>
        </nav>
        <main>
            <h2>Usuarios Registrados  <img src="icons/herra.gif" alt="" class="float-right"/></h2>
            <div style="overflow-x:auto;">
                <table>
                    
                    <thead>
                       
                        <br/>
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
                     
                     <br/>
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
            </div>
        </main>
    </div>
</body>
</html>
