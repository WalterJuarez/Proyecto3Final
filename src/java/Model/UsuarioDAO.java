
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
	            String dml = "INSERT INTO Clientes(Id_Clientes, Nombre, Direccion, Tipo_Usuario, Descuentos, Nit) "
	            		+ "   VALUES("+clientes.getId() + ",'" + clientes.getNombre() + "'" + 
	            		",'" + clientes.getDireccion() + "'"+ ",'" + clientes.getTipoUsuario()+ "'" + ",'" + clientes.getDescuento()+ "'"+
	            		",'" + clientes.getNit() + "')";
	            System.out.println("dml = " + dml);
	            statement.executeUpdate(dml);
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	    }
    /*
    public EntidadUsuario ValidarUsuario(String password, String user){
      String sql = "select * from Usuarios where Nombre=? and Password=?";
      try{
          acceso = con.Conectar();
          ps = acceso.prepareStatement(sql);
          ps.setString(1, user);
          ps.setString(2, password);
          rs = ps.executeQuery();
          while(rs.next()){
              eU.setId(rs.getInt(1));
              eU.setUser(rs.getString(2));
              eU.setPassword(rs.getNString(3));
          }
          
      }catch (Exception e){
          e.printStackTrace();
      }
      return eU;
    }
    
    public List Listar(){
        List<EntidadUsuario> lista = new ArrayList<>();
        String sql = "select * from Usuarios";
        try{
            acceso = cn.Conectar();
            ps = acceso.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                EntidadUsuario u = new EntidadUsuario();
                u.setId(rs.getInt(1));
                u.setUser(rs.getString(1));
                u.setPassword(rs.getString(2));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return lista;
    }
    
    public int add(Object[] o){
        int r = 0;
        String sql = "insert into Usuarios(Nombre,Password) values (?,?)";
        try{
            acceso = cn.Conectar();
            ps = acceso.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
            r = ps.executeUpdate();            
        }catch(Exception e){
            e.printStackTrace();
        }
        return r;
    }
    
    /**
     * 
     * @param o
     * @return
     */
    /*
    public int actualizar(Object[] o){
        int r = 0;
        String sql = "update Usuarios set Nombres=?, Password=? where Id_Usuarios = ?";
        try{
            acceso = cn.Conectar();
            ps = acceso.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[2]);
        }catch(Exception e){
            e.printStackTrace();
        }
        return r;
    }
    
    /**
     * 
     * @param id
     */
    /*
    public void eliminar(int id){
        String sql = "delete from Usuarios where Id_Usuarios = ?";
         try {
            acceso = cn.Conectar();
            ps = acceso.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }   
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/
    /*

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
   
    @Override
    public int add(Object[] o) {
        int r = 0;
        String sql = "insert into Clientes(Id_Clientes,Nombre,Direccion,Tipo_Usuario,Descuentos,Nit)values(?,?,?,?,?,?)";
        try {
            con = (Connection) Conexion.conn.createStatement();
            ps = con.prepareStatement(sql);
            ps.setObject(1, o[0]);
            ps.setObject(2, o[1]);
            ps.setObject(3, o[3]);
            ps.setObject(4, o[4]);
            ps.setObject(5, o[5]);
            ps.setObject(6, o[2]);
            r = ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    @Override
    public int actualizar(Object[] o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/

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

    @Override
    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
