
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO implements CRUD{
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public void saveCarrera(Individual clientes){
       
	        try {
                    Statement statement = Conexion.conn.createStatement();	           	
	            String dml = "INSERT INTO clientesdb(nombre,direccion,tipousuario,descuentos,nit) "
	            		+ "VALUES('" + clientes.getNombre() + "'" + 
	            		",'" + clientes.getDireccion() + "'"+ ",'" + clientes.getTipoUsuario()+ "'" + ",'" + clientes.getDescuento()+ "'"+
	            		",'" + clientes.getNit() + "')";
	            System.out.println("dml = " + dml);
	            statement.executeUpdate(dml);
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	    }
    public void saveProducto(Producto prod){
       
	        try {
                    Statement statement = Conexion.conn.createStatement();	           	
	            String dml = "INSERT INTO productosdb(nombre,cantidad,precio) "
	            		+ "VALUES('" + prod.getNombreProducto()+ "'" + 
	            		",'" + prod.getExistencia() + "'"+ ",'" + prod.getPrecio() + "')";
	            System.out.println("dml = " + dml);
	            statement.executeUpdate(dml);
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	    }
    
    public List<Individual> getBDBClientes(){
	        List<Individual>  cliente = new ArrayList<Individual>();
        try {
            Statement statement = Conexion.conn.createStatement();
            String consulta = " SELECT nombre,direccion,tipousuario,descuentos,nit "+
                              " FROM clientesdb";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                cliente.add(new Individual(rs.getString("nombre"),rs.getString("nit"), rs.getString("direccion"),rs.getString("tipousuario"),rs.getDouble("descuentos")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
	    }
    public List<Individual> getBDBBuscarClientes(String nit){
	        List<Individual>  cliente = new ArrayList<Individual>();
        try {
            Statement statement = Conexion.conn.createStatement();
            String consulta = "select * from clientesdb where nit LIKE"+"'"+nit+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                cliente.add(new Individual(rs.getString("nombre"),rs.getString("nit"), rs.getString("direccion"),rs.getString("tipousuario"),rs.getDouble("descuentos")));
            }
            System.out.print(consulta);
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
	    }
    
    public List<Producto> getBDBProductos(){
	        List<Producto>  producto = new ArrayList<Producto>();
        try {
            Statement statement = Conexion.conn.createStatement();
            String consulta = " SELECT nombre,cantidad,precio "+
                              " FROM productosdb";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                producto.add(new Producto(rs.getString("nombre"),Double.parseDouble(rs.getString("precio")), (int) Integer.parseInt(rs.getString("cantidad"))));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
	    }
    
    public List<Producto> getBDBBuscarProductos(String nombre){
	        List<Producto>  producto = new ArrayList<Producto>();
        try {
            Statement statement = Conexion.conn.createStatement();
            String consulta = "select * from productosdb where nombre LIKE"+"'"+nombre+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                producto.add(new Producto(rs.getString("nombre"),Double.parseDouble(rs.getString("precio")), (int) Double.parseDouble(rs.getString("cantidad"))));
            }
            System.out.print(consulta);
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
	    }
    

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int add(Object[] o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Object[] o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void eliminarCliente(String nit) {
        
         try {
            String eliminarRegistro = "DELETE FROM clientesdb WHERE nit = "+"'"+nit+"'";
            Statement statement = Conexion.conn.createStatement();
            statement.executeUpdate(eliminarRegistro);
        } catch (Exception e) {
        }
    
    }
    
    public void eliminarProducto(String nombrep) {
        
         try {
            String eliminarRegistro = "DELETE FROM productosdb WHERE nombre = "+"'"+nombrep+"'";
            Statement statement = Conexion.conn.createStatement();
            statement.executeUpdate(eliminarRegistro);
        } catch (Exception e) {
        }
    
    }

    @Override
    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<EntidadUsuario> getValidar(String nombre, String password){
	        List<EntidadUsuario>  user = new ArrayList<EntidadUsuario>();
        try {
            Statement statement = Conexion.conn.createStatement();
            String consulta = "select * from clientesdb where nombre LIKE"+"'"+nombre+"' AND password '"+password+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                user.add(new EntidadUsuario(rs.getString("nombre"),rs.getString("password")));
            }
            System.out.print(consulta);
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
	    }
}
