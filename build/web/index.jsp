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
            background: #0033A0; /* Color oficial de la UCR */
            color: #fff;
            padding: 20px 0;
            text-align: center;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .header h4 {
            margin: 0;
            font-size: 2em; /* Tamaño original del título */
        }

        .header img {
            position: absolute;
            top: 10px;
            left: 10px;
            width: 80px;
            height: auto;
        }

        .nav-container {
            background: #0033A0; /* Color oficial de la UCR */
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
            align-items: center; /* Centrar verticalmente los elementos de la lista */
        }

        nav ul li {
            margin: 0 10px; /* Espacio entre los elementos de la lista */
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            display: inline-block;
            transition: background 0.3s ease;
        }

        nav ul li a:hover {
            background: #00509E; /* Un tono más claro del color oficial */
        }

        .main-content-container {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .main-content {
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 800px; /* Limitar el ancho máximo del contenido para evitar que se extienda demasiado en pantallas grandes */
        }

        @media (max-width: 992px) {
            .header h4{
                font-size: 1.5em; /* Reducir el tamaño de la fuente en pantallas medianas */
            }

            .header img {
                width: 60px; /* Reducir el tamaño del logo en pantallas medianas */
            }

            nav ul li {
                margin: 10px; /* Aumentar el espacio entre elementos de lista en pantallas medianas */
            }
        }

        @media (max-width: 768px) {
            .header h4 {
                font-size: 1.2em; /* Reducir el tamaño de la fuente en pantallas pequeñas */
            }

            .header img {
                width: 50px; /* Reducir el tamaño del logo en pantallas pequeñas */
            }

            nav ul {
                flex-direction: column; /* Cambiar a disposición vertical en pantallas pequeñas */
                align-items: center; /* Centrar elementos en pantallas pequeñas */
            }

            nav ul li {
                margin: 8px 0; /* Aumentar el espacio entre elementos de lista en pantallas pequeñas */
            }

            nav ul li a {
                padding: 8px 12px; /* Reducir el padding de los enlaces en pantallas pequeñas */
                font-size: 0.9em; /* Reducir el tamaño de la fuente en pantallas pequeñas */
            }
        }

        .footer {
            background: #0033A0; /* Color oficial de la UCR */
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: absolute;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <header class="header">
            <h4>Panel de Administración</h4>
        </header>
        <div class="nav-container">
            <nav>
                <ul class="nav">
                    <li class="nav-item"><a class="nav-link" href="users.jsp">Usuarios Registrados</a></li>               
                    <li class="nav-item"><a class="nav-link" href="Request.jsp">Solicitudes</a></li>
                    <li class="nav-item"><a class="nav-link" href="inscripciones.jsp">Inscripciones</a></li>
                    <li class="nav-item"><a class="nav-link" href="editEvents.jsp">Eventos</a></li>
                    <!-- Agrega más opciones de navegación si es necesario -->
                </ul>
            </nav>
        </div>
        <div class="main-content-container">
            <div class="main-content">
                <h5 class="text-center">Bienvenido al Panel de Administración</h5>
                <p class="text-center">Aquí puedes gestionar usuarios registrados, inscripciones y solicitudes para el Simposio.</p>
                <p class="text-center">Explora las opciones de navegación para acceder a cada sección.</p>
                <img src="icons/Gifnombre.gif" alt="" class="float-right"/>
            </div>
        </div>
    </div>
    
</body>
</html>

