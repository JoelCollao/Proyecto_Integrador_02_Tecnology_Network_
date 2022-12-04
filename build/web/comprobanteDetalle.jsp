<%-- 
    Document   : comprobanteDetalle
    Created on : 21/11/2021, 01:18:03 PM
    Author     : mrang
--%>

<%@page import="ModeloDAO.ComprobanteDAO"%>
<%@page import="Modelo.Comprobante"%>
<%@page import="Modelo.Empresa"%>
<%@page import="ModeloDAO.EmpresaDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Cdetalle"%>
<%@page import="ModeloDAO.CdetalleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="Estilos/estilosindex.css"/>
        <title>JSP Page</title>
    </head>
    <body>
       <%
       String nro_comprobante=request.getAttribute("nro_comprobante").toString();
       %> 
        <div>
        <h1><a href="Control?accion=logout&contador="<%= 0 %> class="btn btn-danger btn-block">Salir</a></h1>
        </div>
        <div class="col-sm-8">
            <table class="table table-hover">
                <thead>
                    <%
                    CdetalleDAO cdetalle = new CdetalleDAO();
                    ArrayList<Cdetalle>listardetalle=cdetalle.detalle(nro_comprobante);
                    ProductoDAO pDAO = new ProductoDAO();
                    %>
                    <tr>
                        <%
                        ComprobanteDAO comprobanteDAO = new ComprobanteDAO();
                        ArrayList<Comprobante>listarcomprobante = comprobanteDAO.listaComprobante(nro_comprobante);
                        EmpresaDAO empresaDAO = new EmpresaDAO();
                        ArrayList<Empresa>listarEmpresaLocacion= empresaDAO.listarEmpresaporLocacion(listarcomprobante.get(0).getLocacion());
                        %>
                        <td>Empresa:</td>
                        <td><%= listarEmpresaLocacion.get(0).getRazon_social() %></td>
                        <td>Factura:</td>
                        <td><%= nro_comprobante %></td>
                    </tr> 
                    
                    <tr>
                        <th>Item</th>
                        <th>Descripcion</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>SubTotal</th>
                    </tr>
                </thead>
                <tbody>
                <!--  LISTAR EL DETALLE DEL COMPROBANTE SEGUN NRO_cOMPROBANTE    --> 
                <%
                    for(int j=0;j<listardetalle.size();j++){%>
                        <tr>
                            <td><%= j+1 %></td>
                            <td><%= pDAO.listarProducto(listardetalle.get(j).getCod_producto()).getPro_descripcion() %></td>
                            <td><%= listardetalle.get(j).getCantidad() %></td>
                            <td><%= pDAO.listarProducto(listardetalle.get(j).getCod_producto()).getPro_precio_unitario() %></td>
                            <td><%= listardetalle.get(j).getMonto() %></td>
                        </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div>
            <footer>
                <%
                HttpSession sesion = request.getSession();
                %>
                <tr>
                    <td>Cliente:</td>
                    <td> <%= sesion.getAttribute("cliente")%> </td>
                </tr><br>
                <%
                Date fechaactual = new Date(Calendar.getInstance().getTimeInMillis());
                %>
                <tr>
                    <td>Fecha:</td>
                    <td><%= fechaactual %></td>
                </tr>
            </footer>
        </div>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
