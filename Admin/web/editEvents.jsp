<%@page import="java.util.List"%>
<%@page import="classes.EventManager"%>
<%@page import="java.util.ArrayList"%>
<%
    EventManager eventManager = new EventManager();
    List<String[]> events = new ArrayList<>();
    try {
        events = eventManager.getEvents();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Guardar cambios si se envió el formulario
    if (request.getMethod().equalsIgnoreCase("POST")) {
        events.clear();
        for (int i = 0; i < request.getParameterValues("eventName").length; i++) {
            String[] event = new String[10];
            event[0] = request.getParameterValues("eventName")[i];
            event[1] = request.getParameterValues("eventTime")[i];
            event[2] = request.getParameterValues("eventDescription")[i];
            event[3] = request.getParameterValues("eventOrganizer")[i];
            event[4] = request.getParameterValues("eventContact")[i];
            event[5] = request.getParameterValues("eventDate")[i];
            event[6] = request.getParameterValues("eventImage")[i];
            events.add(event);
        }
        if (eventManager.saveEvents(events)) {
            out.println("<script>alert('Eventos guardados exitosamente.');</script>");
        } else {
            out.println("<script>alert('Error al guardar los eventos.');</script>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Eventos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Editar Eventos</h1>
        <form method="post" action="editEvents.jsp">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nombre del Evento</th>
                        <th>Hora</th>
                        <th>Descripción</th>
                        <th>Encargados</th>
                        <th>Contacto</th>
                        <th>Fecha</th>
                        <th>Imagen</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (String[] event : events) {
                    %>
                    <tr>
                        <td><input type="text" name="eventName" value="<%= event[0] %>" class="form-control"></td>
                        <td><input type="text" name="eventTime" value="<%= event[1] %>" class="form-control"></td>
                        <td><input type="text" name="eventDescription" value="<%= event[2] %>" class="form-control"></td>
                        <td><input type="text" name="eventOrganizer" value="<%= event[3] %>" class="form-control"></td>
                        <td><input type="text" name="eventContact" value="<%= event[4] %>" class="form-control"></td>
                        <td><input type="text" name="eventDate" value="<%= event[5] %>" class="form-control"></td>
                        <td><input type="text" name="eventImage" value="<%= event[6] %>" class="form-control"></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                <a href="index.jsp" class="btn btn-secondary">Volver</a>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
