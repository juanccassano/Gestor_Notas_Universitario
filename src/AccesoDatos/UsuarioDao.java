package AccesoDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Dominio.Usuario;


public class UsuarioDao {

	private Conexion cn;


	public UsuarioDao()
	{
		
	}
	
	public boolean revisarLogin (int legajo, int clave) {
		boolean datos = false;
		int pw = 0;
		int leg = 0;
		cn = new Conexion();
		cn.Open();
		 try
		 {
			 ResultSet rs= cn.query("Select * from usuarios where Legajo=" + legajo);
			 while (rs.next())
			 {
				 
			 
			 
			 pw = rs.getInt("Clave");
			 leg = rs.getInt("Legajo");

			 if (clave == pw && leg == legajo)
			 {
				 datos = true;
			 }
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
		 return datos;
	}
	
}
