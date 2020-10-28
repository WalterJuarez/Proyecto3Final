
package Model;

public class Individual extends Clientes{
    
    private String dpi;
    private double descuento;


    public Individual(String nombre, String nit, String direccion, String tipoUsuario, double descuento) {
        super(nombre, nit, direccion, tipoUsuario);
        //this.dpi = dpi;
        this.descuento = descuento;

    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
    

    @Override
    public int getId() {
        return super.getId();
    }

    @Override
    public void setId(int id) {
        super.setId(id);
    }

    @Override
    public String getNombre() {
        return super.getNombre();
    }

    @Override
    public void setNombre(String nombre) {
        super.setNombre(nombre);
    }

    @Override
    public String getNit() {
        return super.getNit();
    }

    @Override
    public void setNit(String nit) {
        super.setNit(nit);
    }

    @Override
    public String getDireccion() {
        return super.getDireccion();
    }

    @Override
    public void setDireccion(String direccion) {
        super.setDireccion(direccion);
    }

    @Override
    public String getTipoUsuario() {
        return super.getTipoUsuario();
    }

    @Override
    public void setTipoUsuario(String tipoUsuario) {
        super.setTipoUsuario(tipoUsuario);
    }
    
}
