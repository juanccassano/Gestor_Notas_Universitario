package AccesoDatos;

import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Curso;
import Dominio.Localidad;
import Dominio.Persona;
import Dominio.Provincia;


public class PersonaDao {
	
	private Conexion cn;
	
	public ArrayList<Persona> obtenerTodos(String rol) {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Persona> list = new ArrayList<Persona>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where Estado=1 AND Rol="+rol);
			 while(rs.next())
			 {
				 Persona pers = new Persona();
				 
				 
				 pers.setLegajo(rs.getInt("Legajo"));
				 pers.setDNI(rs.getInt("DNI"));
				 pers.setApellidoNombre(rs.getString("ApellidoNombre"));
				 pers.setDireccion(rs.getString("Direccion"));
				 pers.setLocalidad(rs.getString("Localidad"));
				 pers.setProvincia(rs.getString("Provincia"));
				 pers.setMail(rs.getString("Mail"));
				 pers.setTelefono(rs.getInt("Telefono"));
				 pers.setRol(rol);
				 list.add(pers);
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
	
	public Persona obtenerPersona(int leg) {
		cn = new Conexion();
		cn.Open();
		Persona per = new Persona();
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where Legajo="+leg);
			 while(rs.next())
			 {
				 
				 
				 per.setLegajo(rs.getInt("Legajo"));
				 per.setDNI(rs.getInt("DNI"));
				 per.setApellidoNombre(rs.getString("ApellidoNombre"));
				 per.setDireccion(rs.getString("Direccion"));
				 per.setLocalidad(rs.getString("Localidad"));
				 per.setProvincia(rs.getString("Provincia"));
				 per.setMail(rs.getString("Mail"));
				 per.setTelefono(rs.getInt("Telefono"));
				 per.setRol(rs.getString("Rol"));

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
		 return per;
	}
	
	
	
	
	public int proximoLegajo()
	{
		cn = new Conexion();
		cn.Open();
		int prox = 0;
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where Legajo = (Select MAX(Legajo) from personas)");
			 rs.next();
			 prox = rs.getInt("Legajo") +1;
			 
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.close();
		 }
		 return prox;	
	}
	
	public boolean altaPersona(Persona p, String rol)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO personas (DNI, ApellidoNombre, Direccion, Localidad, Provincia, Mail, Telefono, Rol, Estado) "
				     + "VALUES ('"+p.getDNI()+"','"+p.getApellidoNombre()+"','"+p.getDireccion()+"','"+p.getLocalidad()+"'"
				     + ",'"+p.getProvincia()+"','"+p.getMail()+"','"+p.getTelefono()+"','"+rol+"',1)";
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
	
	public boolean altaUsuario(Persona p)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO usuarios (Legajo, Clave) VALUES ('"+p.getLegajo()+"','"+p.getDNI()+"')";
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
	
	

	public ArrayList<Provincia> obtenerProvincias()
	{
		cn = new Conexion();
		cn.Open();
		ArrayList<Provincia> list = new ArrayList<Provincia>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from provincia");
			 while(rs.next())
			 {
					Provincia prov = new Provincia();
				 
				 
				 prov.setID(rs.getInt("id"));
				 prov.setNombre(rs.getString("nombre"));

				 list.add(prov);
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
	
	public ArrayList<Localidad> obtenerLocalidades(int idProv)
	{
		cn = new Conexion();
		cn.Open();
		ArrayList<Localidad> list = new ArrayList<Localidad>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from localidad where provincia_id="+idProv);
			 while(rs.next())
			 {
					Localidad loc = new Localidad();
				 
				 
				 loc.setID(rs.getInt("id"));
				 loc.setIDProvincia(idProv);
				 loc.setNombre(rs.getString("nombre"));

				 list.add(loc);
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
	
	public ArrayList<Localidad> obtenerLocalidades()
	{
		cn = new Conexion();
		cn.Open();
		ArrayList<Localidad> list = new ArrayList<Localidad>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from localidad");
			 while(rs.next())
			 {
					Localidad loc = new Localidad();
				 
				 
				 loc.setID(rs.getInt("id"));
				 loc.setIDProvincia(rs.getInt("provincia_id"));
				 loc.setNombre(rs.getString("nombre"));

				 list.add(loc);
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
	
	public String localidadSelec(int id)
	{
		cn = new Conexion();
		cn.Open();
		
		String loc = "";
		 try
		 {
			 ResultSet rs= cn.query("Select * from localidad where ID="+id);
			 while(rs.next())
			 {

				 

				 loc = rs.getString("nombre");


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
		return loc;
	}
	
	public String provinciaSelec(int id)
	{
		cn = new Conexion();
		cn.Open();
		
		String prov = "";
		 try
		 {
			 ResultSet rs= cn.query("Select * from provincia where ID="+id);
			 while(rs.next())
			 {

				 

				 prov = rs.getString("nombre");


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
		return prov;
	}
	
	public boolean personaDisponible(int DNI)
	{
		cn = new Conexion();
		cn.Open();
		
		boolean estado = true;
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where DNI="+DNI);
			 while(rs.next())
			 {

				 

				 estado = false;


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
		return estado;
	}

	
	public boolean modificarPersona(Persona p) {
		

		Persona persona = new Persona();
		boolean estado=false;
		
		cn = new Conexion();
		cn.Open();	

		String query = "UPDATE personas SET DNI='"+p.getDNI()+"', ApellidoNombre='"+p.getApellidoNombre()+"', Direccion='"+p.getDireccion()+"', Localidad='"+p.getLocalidad()+"', Provincia='"+p.getProvincia()+"', Mail='"+p.getMail()+"', Telefono='"+p.getTelefono()+"', Rol='"+p.getRol()+"' WHERE Legajo='"+p.getLegajo()+"'";
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
	
	public boolean modificarUsuario(Persona p) {
		

		Persona persona = new Persona();
		boolean estado=false;
		
		cn = new Conexion();
		cn.Open();	

		String query = "UPDATE usuarios SET Clave='"+p.getDNI()+"' WHERE Legajo='"+p.getLegajo()+"'";
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
	
	
	public boolean borrarPersona(int leg) {
		

		boolean estado=false;
		
		cn = new Conexion();
		cn.Open();	

		String query = "UPDATE personas SET Estado=0 WHERE Legajo="+leg;
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
	
	
	
	public boolean borrarUsuario(int leg) {
		

		boolean estado=false;
		
		cn = new Conexion();
		cn.Open();	

		String query = "DELETE from usuarios where Legajo="+leg;
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
	
	

}
