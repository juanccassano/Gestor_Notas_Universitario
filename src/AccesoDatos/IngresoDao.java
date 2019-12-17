package AccesoDatos;


import java.sql.Timestamp;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import Dominio.Provincia;



public class IngresoDao {
	
	private Conexion cn;
	
	public boolean insertar(int Legajo) {
		
		boolean estado=true;
		LocalDateTime l = LocalDateTime.now();
		Timestamp t = Timestamp.valueOf(l);
		
		
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO ingresos (Legajo, Registro) VALUES ('"+Legajo+"','"+t+"')";
		try
		 {
			estado=cn.execute(query);
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return estado;

	}

	public int obtenerUltimo() {
		cn = new Conexion();
		cn.Open();
		int ultimo=0;

		try
		 {
			 ResultSet rs= cn.query("SELECT Legajo FROM ingresos WHERE Registro = (SELECT MAX(REGISTRO) from ingresos)");
			 rs.next();
			 
			 if  (rs.getInt("Legajo") > 0)
			 {
				 ultimo = rs.getInt("Legajo");
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
		return ultimo;
	}
	
	public String obtenerNombre()
	{
		
		int leg = obtenerUltimo();
		cn = new Conexion();
		cn.Open();
		String user="";
		

		try
		 {
			 ResultSet rs= cn.query("SELECT ApellidoNombre FROM personas WHERE Legajo="+leg);
			 rs.next();
			 
			 if (rs.getString("ApellidoNombre") != null)
			 {
				 user = rs.getString("ApellidoNombre"); 
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
		return user;
		
	}
	

	
}

