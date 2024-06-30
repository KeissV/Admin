<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="classes.Decryted" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f4f4f4;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Admin Dashboard</h1>
        </header>
        <nav>
            <ul>
                <li><a href="#usuarios">Usuarios</a></li>
                <li><a href="#inscripciones">Inscripciones</a></li>
                <li><a href="#solicitudes">Solicitudes</a></li>
            </ul>
        </nav>
        <main>
            <section id="usuarios">
                <h2>Usuarios Registrados</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre completo</th>
                            <th>Nombre usuario</th>
                            <th>Email</th>
                            <th>Contraseña</th>
                            <th>Rol</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String filePath = "C:\\Users\\Jordy vindas\\OneDrive - Universidad de Costa Rica\\Documentos\\NetBeansProjects\\SimposioUcr\\register.txt";
                            BufferedReader br = null;
                            Decryted decrypter = new Decryted();
                            try {
                                br = new BufferedReader(new FileReader(filePath));
                                String line;
                                while ((line = br.readLine()) != null) {
                                    String[] encryptedData = line.split(",");
                                    String[] data = new String[encryptedData.length];
                                    for (int i = 0; i < encryptedData.length; i++) {
                                        data[i] = decrypter.decrypt(encryptedData[i]);
                                    }
                                    %>
                                    <tr>
                                        <td><%= data[0] %></td>
                                        <td><%= data[1] %></td>
                                        <td><%= data[2] %></td>
                                        <td><%= data[3] %></td>
                                        <td><%= data[4] %></td>
                                    </tr>
                                    <%
                                }
                            } catch (IOException e) {
                                e.printStackTrace();
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (br != null) {
                                    try {
                                        br.close();
                                    } catch (IOException e) {
                                        e.printStackTrace();
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </section>
       
        </main>
    </div>
</body>
</html>

