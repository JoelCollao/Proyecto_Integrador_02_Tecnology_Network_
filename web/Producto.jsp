<%-- 
    Document   : Producto
    Created on : Oct 30, 2021, 12:10:29 AM
    Author     : USUARIO
--%>

<%@page import="Modelo.Categoria"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- <link rel="stylesheet" type="text/css" href="Estilos/estilos.css"/>-->
        <link rel="stylesheet" type="text/css" href="Estilos/estilosindex.css"/>
        <script type="text/javascript" src="Js/codigo.js"></script> 
        <title>Technology Networks</title>
    </head>
    <body>
        <div>
            <div class="d-flex">
                <div class="card col-sm-4">
                    <form action="Control?accion=registrarProducto" method="POST" enctype="multipart/form-data"> 
                        <%
//                            Cliente cli = new Cliente();
                            ProductoDAO proDAO = new ProductoDAO();
                            ArrayList<Producto>listaProducto = proDAO.listar();
                            int totalClientes= listaProducto.size()+1;
                            String formato="0000";
                            DecimalFormat objf= new DecimalFormat(formato);
                            String codProducto = "P"+objf.format(totalClientes);
                            System.out.println("Producto nuevo"+codProducto);
                            %>
                        <div class="form-group">
                            <label>Codigo Producto</label>
                            <input type="text" readonly="readonly" name="txtCod_Pro" value="<%= codProducto%>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" name="txtDesc_Pro" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Precio Unitario</label>
                            <input type="text" name="txtPunit" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Cantidad a ingresar</label>
                            <input type="text" name="txtCantidad" class="form-control">
                        </div>
                        <%
                        CategoriaDAO cDAO = new CategoriaDAO();
                        ArrayList<Categoria>listarCategorias= cDAO.listarTodoCategoria();
                        %>
                        <div class="form-group">
                            <label>Categoria</label>
                            <select name="categoria"><%
                                for(int i=0; i<listarCategorias.size(); i++){%>
                                <option value="<%= listarCategorias.get(i).getCat_codigo() %>">
                                    <%= listarCategorias.get(i).getCat_nombre() %>
                                </option><%}%>
                            </select>
                            
                            <!--<input type="text" name="txtDirec" class="form-control">-->
                        </div>

                        <div class="form-group">
                            <label>Agregar imagen</label>
                            <input type="file" name="filefoto" class="form-control">
                        </div>

                        <input type="submit" value="Agregar"  class="btn btn-info">

                    </form>
                </div>


                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Precio unitario</th>
                                <th>Stock</th>
                                <th>Categoria</th>
                                <th>Imagen</th>
                            </tr>
                        </thead>
                        <tbody>
                           <!--  FOREACH -->
                           <%
                           for(int j=0;j<listaProducto.size();j++){%>
                            <tr>
                                <td><%= listaProducto.get(j).getPro_codigo() %></td>
                                <td><%= listaProducto.get(j).getPro_descripcion() %></td>
                                <td><%= listaProducto.get(j).getPro_precio_unitario() %></td>
                                <td><%= listaProducto.get(j).getPro_stock() %></td>
                                <td><%= listaProducto.get(j).getCat_codigo() %></td>
                                <td><img src="ControladorImg?parametro=<%= listaProducto.get(j).getPro_codigo()%> " width="100" height="100">
                                <td><a class="btn btn-warning" data-toggle="modal" data-target="#ventana1" onclick="modalProducto('<%= listaProducto.get(j).getPro_codigo() %>','<%= listaProducto.get(j).getPro_descripcion() %>','<%= listaProducto.get(j).getPro_precio_unitario() %>','<%= listaProducto.get(j).getPro_stock() %>','<%= listaProducto.get(j).getCat_codigo() %>')" >Editar</a></td>
                                <td><a class="btn btn-danger" data-toggle="modal" data-target="#ventana2" href="#">Quitar</a></td>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
                        
        <div class="modal fade" id="ventana1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Control?accion=actualizarProducto" method="POST" enctype="multipart/form-data">   
                        <div class="modal-body">
                            <label>Codigo</label>
                            <input type="text" readonly="readonly" name="txtCod_Prod" id="txtCod_Prod" class="form-control">

                            <label>Descripcion</label>
                            <input type="text" placeholder="Descripcion" name="txtDesc_Prod" id="txtDesc_Prod" class="form-control">

                            <label>Precio Unitario</label>
                            <input type="text" placeholder="Precio Unitario" name="txtPrecio_Prod" id="txtPrecio_Prod" class="form-control">

                            <label>Cantidad a ingresar</label>
                            <input type="text" placeholder="Ingresar cantidad" name="txtCant_Prod" id="txtCant_Prod" class="form-control">
                            
                            <div class="modal-body">
                            <label>Categoria</label>
                            <select name="categoria" id="Cat_Prod"><%
                                for(int i=0; i<listarCategorias.size(); i++){%>
                                <option value="<%= listarCategorias.get(i).getCat_codigo() %>">
                                    <%= listarCategorias.get(i).getCat_nombre() %>
                                </option><%}%>
                            </select>
                            </div>
                            <div class="modal-body">
                                <label>Seleccionar Imagen</label><br>
                                <!--label><input type="radio" name="habilitar_imagen" value="Si" checked>Si</label>
                                <label><input type="radio" name="habilitar_imagen" value="No">No</label-->
                                <input type="file" name="ffoto" id="Foto_Prod" class="form-control">
                            </div>
                            
                        </div>
                       <div class="modal-body">   
                        <button type="submit" value="Actualizar"  class="btn btn-info">Actualizar</button>
                        <button class="btn btn-danger btn-large" data-dismiss="modal" aria-hidden="true">Salir</button>
                        </div>
                    </form>                           
                </div>
            </div>
        </div>
                            
         
           <div class="modal fade" id="ventana2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="card-body text-center">
                        <label>Desea Eliminar Producto</label><br>
                        <button class="btn btn-danger btn-large" data-dismiss="modal" aria-hidden="true">Si</button>
                        <button class="btn btn-warning btn-large" data-dismiss="modal" aria-hidden="true">No</button>
                     </div>
                </div>
            </div>
        </div>                 

                        
                        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
