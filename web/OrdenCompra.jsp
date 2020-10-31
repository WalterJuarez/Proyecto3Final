<%-- 
    Document   : OrdenCompra
    Created on : 20/10/2020, 07:29:31 PM
    Author     : 15109
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="Model.Individual"%>
<%@page import="Model.UsuarioDAO"%>
<%@page import="Model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrdenCompra</title>
        <link href="css/estilo.css" rel="stylesheet"type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h1 id="titulo" align="center"class="font-weight-bold">Generar Orden de Compra</h1>
         <br><a class="btn btn-primary" href="MenuPrincipal.jsp" role="button">Regresar</a>
        <div id="cuadro2">
            <%
                String nitoc = request.getParameter("nit");
            %>
        <form>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="inputdate">Fecha</label><br>
                <input type="date" id="start" name="trip-start"
                value="date"
                min="2020-01-01" max="2022-12-31">             
            </div>
            <hr color ="#ffffff">
            <div class="form-group col-md-6">
             <h1 id="numOrdenCompra">ORDEN No. </h1>
            </div><br/>
            
            <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputnit">Nit</label>
                <input type="text" class="form-control" id="inputPassword4" name="nit" style="width : 200px; heigth : 200px">
                <a class="btn btn-primary" type="submit" name="btcliente"href="OrdenCompra.jsp">validar
                    <table>
                <%     
              
              //1. Crear una instancia DAO correpondiente a las carreras
              UsuarioDAO buscadoDao = new UsuarioDAO();
              //2. Obtener todas las carreras de la base de datos
              List<Individual> buscados = buscadoDao.getBDBBuscarClientes(nitoc);
              //3. Iterar todas las carreras
              
              for( Individual buscado : buscados){
              //4. Pintar el HTML que correponde a cada carrera
              
              %>
              <tr>
                  <thead class="thead-dark">
                  <tr>
                    <th scope="col">Nit</th>
                    <th scope="col">Nombre</th>
                  </tr>
                </thead>
                <tbody>
                
                <td id ="titulo"><%=buscado.getNit()%></td>
                <td id ="titulo"><%=buscado.getNombre()%></td>
                
                
              </tr>
              <% }//cierre 2do for %>
                </table>
                
             </a>
            </div>
            
            </div> 
            <hr>
            <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputIdProducto">Id_Producto</label>
              <input type="text" class="form-control" id="inputAddress" style="width : 200px; heigth : 200px">
            </div>
               <div class="form-group col-md-6">
              <label for="inputCantidad">Cantidad</label>
              <input type="text" class="form-control" id="inputAddress" style="width : 200px; heigth : 200px">
            </div>
                <button type="submit" class="btn btn-primary"style="width : 100px; heigth : 100px">Agregar</button>
            </div>
            <hr color ="#ffffff">
            <table class="table">
        
           
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Nit</th>
                    <th scope="col">Nombre</th>
                  </tr>
                </thead>
                <tbody>
                  
              
            <table class="table">
        
           
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Precio/Unit</th>
                    <th scope="col">Descuentos</th>
                    <th scope="col">Total</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
            
            <div class="form-group col-md-4">
                <label for="inputState">Tipo de Envio</label>
                <select id="inputState" class="form-control"style="width : 200px; heigth : 200px">
                <option selected>Seleccionar</option>
                <option>Aereo</option>
                <option>Maritimo</option>
                <option>Terrestre</option>
            </select>
    </div>
            
            
        
            </div>
            <hr color ="#ffffff">
            <div class="form-group col-md-6">
             <h1 id="granTotal">Total  de Orden Q 0.00</h1>
            </div><br/>
            
            <div class="form-group col-md-6">
             <button type="submit" class="btn btn-primary"style="width : 100px; heigth : 100px">Guardar</button>
            
            
             <button type="submit" class="btn btn-primary"style="width : 100px; heigth : 100px">Eliminar</button>
             
            </div>
            
        </div><br>
           
            
          </form>
            
           
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <br><a class="btn btn-primary" href="MenuPrincipal.jsp" role="button">Regresar</a>
        
        
    </body>
</html>
