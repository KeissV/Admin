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
            margin: 0;
            padding: 0;
        }

        .header {
            background: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            background-size: cover;
            background-position: center;
        }

        .header h1 {
            margin: 0;
            font-size: 2.5em;
        }

        .nav-container {
            background: #333;
        }

        nav {
            display: flex;
            justify-content: center;
        }

        nav ul {
            padding: 0;
            list-style: none;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
            transition: background 0.3s ease;
        }

        nav ul li a:hover {
            background: #575757;
        }

        .main-content-container {
            display: flex;
            justify-content: center;
        }

        .main-content {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 1700px; /* Ajusta este valor según sea necesario */
        }

        @media (max-width: 576px) {
            .header h1 {
                font-size: 1.5em; /* Reducir el tamaño de la fuente en pantallas pequeñas */
            }

            nav ul li a {
                padding: 5px 10px; /* Reducir el padding para que se ajuste mejor en pantallas pequeñas */
                font-size: 0.9em; /* Reducir el tamaño de la fuente en pantallas pequeñas */
            }

            .main-content {
                padding: 10px; /* Reducir el padding del contenido principal en pantallas pequeñas */
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <header class="header">
            <h1>Panel de Administración</h1>
        </header>
        <div class="nav-container">
            <nav>
                <ul>
                    <li><a href="users.jsp">Usuarios Registrados</a></li>               
                    <li><a href="Request.jsp">Solicitudes</a></li>
                    <li><a href="inscripciones.jsp">Inscripciones</a></li>
                    <!-- Agrega más opciones de navegación si es necesario -->
                </ul>
            </nav>
        </div>
        <div class="main-content-container">
            <div class="main-content">
                <h2>Bienvenido al Panel de Administración</h2>
                <p>Aquí puedes gestionar usuarios registrados, inscripciones y solicitudes para el Simposio.</p>
                <p>Explora las opciones de navegación para acceder a cada sección.</p>
            </div>
        </div>
    </div>
    
</body>
</html>