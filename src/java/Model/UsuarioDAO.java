
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO implements CRUD{
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    EntidadUsuario eU = new EntidadUsuario();
    Conexion con = new Conexion();
    Connection acceso;
    
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
    }
    
}
