<%-- 
    Document   : IngresoProductos
    Created on : 20/10/2020, 06:06:03 AM
    Author     : 15109
--%>

<%@page import="Model.Producto"%>
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
        <h1 id="titulo" align="center"class="font-weight-bold">Formulario Creacion de Productos</h1>
        <%
            UsuarioDAO dao = new UsuarioDAO();
            String nombre = request.getParameter("Nombre");
            String precio = request.getParameter("Precio");
            String cantidad = request.getParameter("Cantidad");
            if(nombre == null && precio == null && cantidad == null){
        %>
        <div id="cuadro2">
        <form >
            
            <div class="form-group col-md-6">
              <label for="inputName">Nombre</label>
              <input type="text" class="form-control" id="inputEmail4" name="Nombre"style="width : 600px; heigth : 600px">
            </div>
            
            
            
                
            <div class="form-group col-md-6">
                 <label for="inputName">Precio</label>
                <input type="text" class="form-control" name ="Precio" aria-label="Dollar amount (with dot and two decimal places)" >
            </div>
            
            <div class="form-group col-md-6">
              <label for="inputDireccion">Cantidad</label>
              <input type="Integer" class="form-control" id="inputAddress" name = "Cantidad" style="width : 200px; heigth : 200px">
            </div>
            
            
            
            
        
            
            <div class="form-group"><br>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                  Activo
                </label>
              </div>
            </div>
             <button type="submit" class="btn btn-primary"style="width : 100px; heigth : 100px">Crear</button>
        </div><br>
        <%
            }else{
              //1. Crear una instancia de CarreraDAO
                UsuarioDAO productoDao = new UsuarioDAO();
                //2. Crear una instancia de Carrera
                Producto producto = new Producto(nombre,Double.parseDouble(precio),Integer.parseInt(cantidad));
                //3. Insertar en la DB la carrera
                productoDao.saveProducto(producto);  
            
        %>
            <div class="alert alert-primary" role="alert">
              Producto Ingresado de manera exitosa, deseas <a href="ListadoProductos.jsp" class="alert-link">ver Listado de Productos?</a>
            </div>
        <%}%>    
          </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <br><a class="btn btn-primary" href="MenuPrincipal.jsp" role="button">Regresar</a>
        
        
    </body>
</html>
