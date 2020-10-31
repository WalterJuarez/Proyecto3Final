
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public static final String DRIVER_DB = "org.postgresql.Driver";
    public static final String URL_DB ="jdbc:postgresql://localhost:5432/SistemaDeVentas";
    public static final String USER_DB = "postgres";
    public static final String PASSWORD_DB = "97135795182465";
    public static Connection conn;
    static{
        try {
            Class.forName(DRIVER_DB);
            conn = DriverManager.getConnection(URL_DB, USER_DB, PASSWORD_DB);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}
