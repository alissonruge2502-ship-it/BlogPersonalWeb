
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<%!
    private String escaparHtml(Object valor) {
        if (valor == null) return "";

        return valor.toString()
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Blog Personal</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f0f5;
            margin: 0;
            padding: 30px;
        }

        .contenedor {
            max-width: 750px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
        }

        h1, h2 {
            text-align: center;
            color: #59436b;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            background: #80618e;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
        }

        .publicacion {
            background: #f8f5fa;
            padding: 18px;
            margin-top: 18px;
            border-radius: 10px;
            border-left: 5px solid #80618e;
        }

        .fecha {
            color: #777;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="contenedor">

    <h1>Mi Blog Personal</h1>

    <p style="text-align:center;">
        Un espacio para compartir pensamientos, experiencias e historias.
    </p>

    <h2>Crear una publicación</h2>

    <form action="<%= request.getContextPath() %>/publicaciones"
          method="post">

        <label>Título:</label>
        <input type="text" name="titulo" required>

        <label>Contenido:</label>
        <textarea name="contenido" rows="5" required></textarea>

        <button type="submit">Publicar</button>
    </form>

    <hr>

    <h2>Mis publicaciones</h2>

    <%
        List<Map<String, Object>> publicaciones =
            (List<Map<String, Object>>) request.getAttribute("publicaciones");

        if (publicaciones != null && !publicaciones.isEmpty()) {

            for (Map<String, Object> p : publicaciones) {
    %>

        <div class="publicacion">

            <h3><%= escaparHtml(p.get("titulo")) %></h3>

            <p><%= escaparHtml(p.get("contenido")) %></p>

            <p class="fecha">
                Fecha: <%= escaparHtml(p.get("fecha")) %>
            </p>

        </div>

    <%
            }

        } else {
    %>

        <p style="text-align:center;">
            Todavía no hay publicaciones.
        </p>

    <%
        }
    %>

</div>

</body>
</html>
