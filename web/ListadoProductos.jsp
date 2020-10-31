<%-- 
    Document   : ListadoProductos
    Created on : 20/10/2020, 06:05:45 AM
    Author     : 15109
--%>

<%@page import="Model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="Model.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="css/estilo.css" rel="stylesheet"type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h1 id ="titulo" align ="center"class="font-weight-bold">Listato de Productos</h1>        
        <div id="cuadro2">
            <%
                String nombrep = request.getParameter("txtbuscar");
            %>
            
            <form>
                <div>
                <input type="text" name="txtbuscar">
                <a href="ListadoClientes.jsp"><button class="btn btn-outline-success my-2 my-sm-0" type="submit" > Buscar </button></a>

                
                </div> 
                <%
                if (nombrep == null || nombrep == "" ){
                %>
            <table class="table" name="tablaproductos">
                
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">ID</th>
                      <th scope="col">Nombre</th>
                      <th scope="col">Existencia</th>
                      <th scope="col">Precio</th>
                    </tr>
                  </thead>
                  <tbody>
            <%
              //1. Crear una instancia DAO correpondiente a las carreras
              UsuarioDAO productoDao = new UsuarioDAO();
              //2. Obtener todas las carreras de la base de datos
              List<Producto> productos = productoDao.getBDBProductos();
              //3. Iterar todas las carreras
              int i=0;
              for( Producto itempr : productos){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <tr>
                <th scope="row" id ="titulo"><%=i%></th>
                
                <td id ="titulo"><%=itempr.getNombreProducto()%></td>
                <td id ="titulo"><%=itempr.getExistencia()%></td>
                <td id ="titulo"><%=itempr.getPrecio()%></td>
                
              </tr>
              <% 
               }
              %>  
            </table>
                <%
                }else{
                %>
                <table class="table" name="tablaproductos">
                
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">ID</th>
                      <th scope="col">Nombre</th>
                      <th scope="col">Existencia</th>
                      <th scope="col">Precio</th>
                      <th scope="col">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
            <%
              //1. Crear una instancia DAO correpondiente a las carreras
              UsuarioDAO buscadoDao = new UsuarioDAO();
              //2. Obtener todas las carreras de la base de datos
              List<Producto> productos = buscadoDao.getBDBBuscarProductos(nombrep);
              //3. Iterar todas las carreras
              int i=0;
              for( Producto itempr : productos){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <tr>
                <th scope="row" id ="titulo"><%=i%></th>
                
                <td id ="titulo"><%=itempr.getNombreProducto()%></td>
                <td id ="titulo"><%=itempr.getExistencia()%></td>
                <td id ="titulo"><%=itempr.getPrecio()%></td>
                <td id ="titulo"><a href="ListadoProductos.jsp"><button type="button" class="btn btn-danger" data-toggle="modal">Eliminar</button></td>
                                <%
                                    //eliminar Registro
                                    String nomel = itempr.getNombreProducto();                                    
                                    UsuarioDAO eliminarDao = new UsuarioDAO();
                                    eliminarDao.eliminarProducto(nomel); 
                                %>
                                <div class="modal fade"></div>
                                <div class="modal-dialog">
                                    <p id="titulo">Registro eliminado</p>
                                </div>
                                </a>
                
              </tr>
              <% 
               }
              %>  
            </table>
            <%}%>
              
                    
                  </tbody>
                </table>
                </form>
        </div>

         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <br><a class="btn btn-primary" href="MenuPrincipal.jsp" role="button">Regresar</a>
    </body>
</html>
