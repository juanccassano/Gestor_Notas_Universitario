package AccesoDatos;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

import Dominio.Ingreso;
import Dominio.Persona;

public class ReporteDao {

	
	private Conexion cn;
	
	public ArrayList<Ingreso> obtenerTodos() {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Ingreso> list = new ArrayList<Ingreso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from ingresos");
			 while(rs.next())
			 {
				 Ingreso ing = new Ingreso();
				 
				 
				 ing.setLegajo(rs.getInt("Legajo"));
				 Timestamp tp = rs.getTimestamp("Registro");
				 
				 
				 
				 //Timestamp timestamp = new Timestamp(date.getTime());
				 
				 
				 
				 
				 ing.setIngreso(tp.toLocalDateTime());

				 list.add(ing);
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.close();
		 }
		 return list;
	}
}
