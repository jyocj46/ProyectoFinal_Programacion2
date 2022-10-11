<%-- 
    Document   : empleado
    Created on : Oct 6, 2022, 4:11:05 PM
    Author     : Josue
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Puesto" %>
<%@page import="clases.Empleado" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <h1>Empleados</h1>
        <form action="" method="get" class="form-group">
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Id Empleado</span>
                <input type="text" name="txt_idempleado" id="txt_idempleado" class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Nombre</span>
                <input type="text" name="txt_Nombre" id="txt_nombre" class="form-control" placeholder="Juan" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Apellidos</span>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Martinez" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Direccion</span>
                <input type="text" name="txt_Direccion" id="txt_Direccion" class="form-control" placeholder="Guatemala" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Telefono</span>
                <input type="text" name="txt_Teleofno" id="txt_Telefono" class="form-control" placeholder="12345678" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">DPI</span>
                <input type="text" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="0000-00000-0000" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Genero</span>
                    <input type="text" name="txt_genero" id="txt_genero" class="form-control" placeholder="Hombre/Mujer" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de Nacimiento</span>
                <input type="date" name="txt_Fn" id="txt_Fn" class="form-control" placeholder="dd/mm/yyyy" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Puesto</span>
                <select name="dr_puesto" id="dr_puesto" class="form-control">
                 <% Puesto puesto = new Puesto();
                HashMap<String,String> drop = puesto.drop_puesto();
                    for(String i : drop.keySet()){
                    out.println("<option value='" + i +"'>" + drop.get(i) + "</option>");
                    }
                %>
                </select>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de inicio de labores</span>
                <input type="date" name="txt_Fechain" id="txt_Fechain" class="form-control" placeholder="dd/mm/yyyy" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de ingreso</span>
                <input type="date" name="txt_Fechai" id="txt_Fechai" class="form-control" placeholder="dd/mm/yyyy" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button type="button" class="btn btn-success">Agregar</button>
                <button type="button" class="btn btn-warning">Actualizar</button>
                <button type="button" class="btn btn-danger">Eliminar</button>
            </div>
        </form>
        
        <!-- Inicio de la Tabla Leer -->
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>DPI</th>
                    <th>Genero</th>
                    <th>Puesto</th>
                    <th>Fecha nacimiento</th>
                    <th>Fecha de inicio de labores</th>
                    <th>Fecha de ingreso</th>
                </tr>
                </thead>
                <tbody id="tbl_estudiante">
                
                <% Empleado empleado = new Empleado();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = empleado.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 11)+">");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,2) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,4) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,5) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,6) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,7) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,8) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,9) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,10) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,11) + "</td>");
                            out.println("</tr>");
                            
                    
                        }
                  %>
                  
                  
                </tbody>
                
            </table>
        
        
    </body>
</html>
