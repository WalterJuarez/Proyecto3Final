<%-- 
    Document   : ListadoClientes
    Created on : 20/10/2020, 06:06:42 AM
    Author     : 15109
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="Model.Individual"%>
<%@page import="Model.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="css/estilo.css" rel="stylesheet"type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
        
    <body>
        <h1 id="titulo" align="center"class="font-weight-bold">Lista de Clientes</h1>
        <div id="cuadro2">
           <%
               String nitb = request.getParameter("txtbuscar");
           %>
            <form>
                <div>
                <input type="text" name="txtbuscar">
                <a href="ListadoClientes.jsp"><button class="btn btn-outline-success my-2 my-sm-0" type="submit" > Buscar </button></a>

                
                </div> 
                <%
                if (nitb == null || nitb == "" ){
                %>
                
             
        <table class="table" name="tablaclientes">
        
           
                <thead class="thead-dark" >
                  <tr>                    
                    <th scope="col">ID</th> 
                    <th scope="col">Nit</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Tipo_Usuario</th>
                  </tr>
                </thead>
                <tbody>
                 
              <%
              
              //1. Crear una instancia DAO correpondiente a las carreras
              UsuarioDAO usuarioDao = new UsuarioDAO();
              //2. Obtener todas las carreras de la base de datos
              List<Individual> usuarios = usuarioDao.getBDBClientes();
              //3. Iterar todas las carreras
              int i=0;
              for( Individual usuario : usuarios){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <tr>
                <th scope="row" id ="titulo"><%=i%></th>
                
                <td id ="titulo"><%=usuario.getNit()%></td>
                <td id ="titulo"><%=usuario.getNombre()%></td>
                <td id ="titulo"><%=usuario.getDireccion()%></td>
                <td id ="titulo"><%=usuario.getTipoUsuario()%></td>
              </tr>
              <% 
               }//cierre for
              %>
        </table>
                <%}else{%>
                <table class="table" name="tablaclientes">
        
           
                <thead class="thead-dark" >
                  <tr>                    
                    <th scope="col">ID</th> 
                    <th scope="col">Nit</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Tipo_Usuario</th>
                    <th scope="col">Acciones</th>
                  </tr>
                </thead>
                <tbody>
               <%     
              
              //1. Crear una instancia DAO correpondiente a las carreras
              UsuarioDAO buscadoDao = new UsuarioDAO();
              //2. Obtener todas las carreras de la base de datos
              List<Individual> buscados = buscadoDao.getBDBBuscarClientes(nitb);
              //3. Iterar todas las carreras
              int j = 0;
              for( Individual buscado : buscados){
              //4. Pintar el HTML que correponde a cada carrera
              j++;
              %>
              <tr>
                
                <th scope="row" id ="titulo"><%=j%></th>
                <td id ="titulo"><%=buscado.getNit()%></td>
                <td id ="titulo"><%=buscado.getNombre()%></td>
                <td id ="titulo"><%=buscado.getDireccion()%></td>
                <td id ="titulo"><%=buscado.getTipoUsuario()%> </td>
                <td id ="titulo"><a href="ListadoClientes.jsp"><button type="button" class="btn btn-danger" data-toggle="modal">Eliminar</button></td>
                                <%
                                    //eliminar Registro
                                    String nitel = buscado.getNit();                                    
                                    UsuarioDAO eliminarDao = new UsuarioDAO();
                                    eliminarDao.eliminarCliente(nitel);                                    
                                %>
                                <div class="modal fade"></div>
                                <div class="modal-dialog">
                                    <p id="titulo">Registro eliminado</p>
                                </div>
                                </a>
              </tr>
              <% }//cierre 2do for %>
                </table>
              <%}%>             
                
              <div class="form-group col-md-6m">
                  
                
              </div>

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
