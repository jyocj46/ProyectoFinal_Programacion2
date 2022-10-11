<%-- 
    Document   : puesto
    Created on : Oct 6, 2022, 2:12:24 PM
    Author     : Josue
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="clases.Puesto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <h1>Puestos</h1>
        <div class="container">
        <div class="modal fade" id="modal_puesto" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
        
            <div class="modal-body">
        <form action="sr_puesto" method="post" class="form-group">
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">Id puesto</span>
                        <input type="text" name="txt_idpuesto" id="txt_idpuesto" value="0" class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
                    </div>
                    <br>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">Puesto</span>
                        <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Puesto" aria-label="Puesto" aria-describedby="addon-wrapping" required>
                    </div>
            <br>
            <%--<label for="lbl_idpuesto"><b>Id puesto</b></label>
            <input type="text" name="txt_idpuesto" id="txt_idpuesto" value="0" class="form-control" readonly>
            <label for="lbl_codigo"><b>Puesto</b></label>
            <input type="text" name="txt_puesto" id="txt_puesto" placeholder="Ejemplo: Administrador" class="form-control" required> --%>
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button name="btn_agregar" value="agregar" class="btn btn-success" id="btn_agregar">Agregar</button>
                <button type="button" class="btn btn-warning">Actualizar</button>
                <button type="button" class="btn btn-danger">Eliminar</button>
            </div>
            
        </form>
            </div>
            </div>
        </div>
         </div>        
         <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Puesto</th>
                    <th>Id</th>
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                <table class="table table-bordered">
                <tbody id="tbl_empleados">
                <% Puesto puesto = new Puesto();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = puesto.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            //out.println("</tr>");
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 1)+">");
                           // out.println("<td>"+ tabla.getValueAt (t,0) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("</tr>");
                        }
                  %>
                  <tr>
                
                </tr>
                </tbody>
                
            </table>
                  
                  
                </tbody>
                
            </table>   
            
            
            
            <!-- Boton Para crear nuevo registro -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_puesto">Nuevo Registro</button>
    </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        </body>
</html>
