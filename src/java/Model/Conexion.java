
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    public static final String DRIVER_DB = "org.postgresql.Driver";
    public static final String url = "jdbc:postgresql://localhost:5432/SistemaDeVentas";
    public static final String user = "postgres";
    public static final String password = "97135795182465";
    public static Connection conn;
   static{
       try {
            Class.forName(DRIVER_DB);
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
   }
    
}
