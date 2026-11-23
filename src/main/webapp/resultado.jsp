

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicación guardada</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f3ef;
            margin: 0;
            padding: 40px 20px;
            color: #493b38;
        }

        .contenedor {
            max-width: 650px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        h1, h2 {
            color: #a47778;
        }

        .mensaje {
            background: #f1e9e5;
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .publicacion {
            padding: 15px;
            background: #faf7f5;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow-wrap: anywhere;
        }

        a {
            display: inline-block;
            background: #a47778;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
        }

        a:hover {
            background: #855d5e;
        }
    </style>
</head>

<body>

    <div class="contenedor">

        <h1>Mi Blog Personal</h1>

        <div class="mensaje">
            <h2>${mensaje}</h2>
        </div>

        <div class="publicacion">
            <h3>${titulo}</h3>
            <p>${contenido}</p>
        </div>

        <a href="index.html">Volver al formulario</a>

    </div>

</body>
</html>
