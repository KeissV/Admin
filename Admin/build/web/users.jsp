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
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f4f4;
            padding-top: 20px;
        }

        .container {
            margin-bottom: 50px;
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        th, td {
            text-align: center;
            vertical-align: middle;
        }

        @media (max-width: 576px) {
            h1, h2 {
                font-size: 1.5em;
            }

            th, td {
                font-size: 0.9em;
                padding: 5px;
            }
        }

        @media (max-width: 768px) {
            h1, h2 {
                font-size: 1.8em;
            }

            th, td {
                font-size: 1em;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Panel de Administración</h1>
        </header>
        <main>
            <section id="usuarios">
                <h2>Usuarios Registrados</h2>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead class="thead-dark">
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
                </div>
            </section>
        </main>
    </div>
    
</body>
</html>
