
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase encargada de establecer la conexión
 * entre el blog personal y la base de datos MySQL.
 */
public class Conexion {

    private static final String URL =
        "jdbc:mysql://localhost:3307/blogpersonal?useSSL=false&serverTimezone=America/Bogota";

    private static final String USUARIO = "root";

    // Reemplazar por la contraseña de MySQL Workbench.
    private static final String PASSWORD = "Dayan123.";

    /**
     * Establece y devuelve una conexión con MySQL.
     */
    public static Connection conectar() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                URL, USUARIO, PASSWORD
            );

            System.out.println("Conexión a MySQL exitosa.");

            return conexion;

        } catch (ClassNotFoundException | SQLException e) {

            System.err.println("Error al conectar con MySQL: "
                    + e.getMessage());

            return null;
        }
    }
}
