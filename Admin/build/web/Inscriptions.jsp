<%@page import="java.util.List"%>
<%@page import="classes.Inscripciones"%>
<%@page import="java.util.ArrayList"%>
<%
    Inscripciones inscripciones = new Inscripciones();
    List<String[]> listaInscripciones = new ArrayList<>();
    try {
        listaInscripciones = inscripciones.getInscripciones();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscripciones</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Inscripciones</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID del Evento</th>
                    <th>Nombre del Evento</th>
                    <th>Nombre de Usuario</th>
                    <th>ID Number</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (String[] inscripcion : listaInscripciones) {
                %>
                <tr>
                    <td><%= inscripcion[0] %></td>
                    <td><%= inscripcion[1] %></td>
                    <td><%= inscripcion[2] %></td>
                    <td><%= inscripcion[3] %></td>
                    <td><%= inscripcion[4] %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
