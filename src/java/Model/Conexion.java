
package Model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    private static String url = "jdbc:postgresql://localhost:5432/SistemaDeVentas";
    private static String user = "postgres";
    private static String password = "97135795182465";
    
    /**
     * 
     * @return
     */
    
    public static Connection Conectar() throws ClassNotFoundException{
        Connection con = null;
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
            java.sql.Statement st = con.createStatement();
        }catch (Exception e){
            System.out.println(e);
        }
        
        return con;
    }
    
}
