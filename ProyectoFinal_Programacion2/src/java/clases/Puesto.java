/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;
import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Josue
 */
public class Puesto {
    private String puesto;
    private int id_puesto;

    Conexion cn;
    
    public Puesto() {}
    public Puesto(String puesto, int id_puesto) {
        this.puesto = puesto;
        this.id_puesto = id_puesto;
    }

    
    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
    
    public HashMap drop_puesto(){
        HashMap<String,String> drop = new HashMap();
        
        try{
            String query = "SELECT idPuesto as id,puesto FROM puestos;";
            cn = new Conexion();
            cn.abrir_con();
            
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while(consulta.next()){
            drop.put(consulta.getString("id"), consulta.getString("puesto"));
            }
        
        cn.cerrar_con();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        return drop;
        
        }
    
    
    
    
    
    
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
   cn = new Conexion();
   cn.abrir_con();
    String query;
    query = "SELECT e.idPuesto as  id,e.puesto FROM puestos as e inner join puestos;";
     ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      
      String encabezado[] = {"id","puesto"};
      tabla.setColumnIdentifiers(encabezado);
      
      String datos[]=new String[1];
      
   while(consulta.next()){
      datos[0] = consulta.getString("id");
      datos[1] = consulta.getString("puesto");
      tabla.addRow(datos);
      }
   cn.cerrar_con();
    
      
  }catch(SQLException ex){
      cn.cerrar_con();
      System.out.println("Error: " + ex.getMessage() );
  
  }
    return tabla;
    }
    
    public int crear(){
    int retorno=0;
        
        try{
         PreparedStatement parametro;
         cn = new Conexion();
         
         String query;
            query = "INSERT INTO puestos(puesto) VALUES (?);";
         cn.abrir_con();
            parametro  = (PreparedStatement) cn.conexionBD.prepareStatement(query);
         parametro.setString(1, getPuesto());
         int executar= parametro.executeUpdate();
         retorno = executar;
         cn.cerrar_con();
     }catch(HeadlessException | SQLException ex){
         System.out.println("Error"+ex.getMessage());
         }
        
        return retorno;
    }
}
