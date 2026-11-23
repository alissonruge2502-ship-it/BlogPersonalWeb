

package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Conexion;

/**
 * Servlet encargado de gestionar las publicaciones
 * del blog personal.
 */
@WebServlet("/publicaciones")
public class PublicacionServlet extends HttpServlet {

    // Guarda una nueva publicación en MySQL.
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        // Validar que los campos no estén vacíos.
        if (titulo == null || titulo.trim().isEmpty()
                || contenido == null || contenido.trim().isEmpty()) {

            request.setAttribute("mensaje",
                    "Debes completar el título y el contenido.");

            request.getRequestDispatcher("/resultado.jsp")
                    .forward(request, response);
            return;
        }

        // Consulta SQL para insertar la publicación.
        String sql = "INSERT INTO publicaciones "
                + "(titulo, contenido, estado) VALUES (?, ?, ?)";

        try (Connection conexion = Conexion.conectar()) {

            if (conexion == null) {
                throw new ServletException(
                        "No se pudo establecer la conexión con MySQL.");
            }

            try (PreparedStatement consulta =
                    conexion.prepareStatement(sql)) {

                consulta.setString(1, titulo.trim());
                consulta.setString(2, contenido.trim());
                consulta.setString(3, "PUBLICADO");

                int resultado = consulta.executeUpdate();

                if (resultado > 0) {
                    request.setAttribute("mensaje",
                            "¡Tu publicación se guardó correctamente!");

                    request.setAttribute("titulo", titulo);
                    request.setAttribute("contenido", contenido);
                }
            }

        } catch (SQLException e) {
            throw new ServletException(
                    "Error al guardar la publicación.", e);
        }

        request.getRequestDispatcher("/resultado.jsp")
                .forward(request, response);
    }

    // Muestra el formulario principal del blog.
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/index.html")
                .forward(request, response);
    }
}
