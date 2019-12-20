package AccesoDatos;

import java.sql.ResultSet;
import java.util.ArrayList;

import AccesoDatos.Conexion;
import Dominio.Curso;
import Dominio.Materia;
import Dominio.Persona;
import Dominio.Provincia;


public class CursoDao {
	
	private Conexion cn;
	
	public ArrayList<Curso> obtenerTodos() {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Curso> list = new ArrayList<Curso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from cursos ORDER BY IDMateria asc");
			 while(rs.next())
			 {
				 Curso curso = new Curso();
				
				curso.setID(rs.getInt("ID"));
				curso.setIDmateria(rs.getInt("IDMateria"));
				curso.setLegDocente(rs.getInt("IDProfesor"));
				curso.setSemestre(rs.getInt("Semestre"));
				curso.setAnio(rs.getInt("Anio"));

				

				 list.add(curso);
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
	
	public ArrayList<Materia> obtenerMaterias()
	{
		cn = new Conexion();
		cn.Open();
		ArrayList<Materia> list = new ArrayList<Materia>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from materias");
			 while(rs.next())
			 {
					Materia mat = new Materia();
				 
				 
				 mat.setID(rs.getInt("ID"));
				 mat.setNombre(rs.getString("Nombre"));

				 list.add(mat);
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
	

	
	public String obtenerMateria(int id)
	{
		cn = new Conexion();
		cn.Open();
		String nombre="";
		 try
		 {
			 ResultSet rs= cn.query("Select * from materias where ID="+id);
			 while(rs.next())
			 {
				 nombre= rs.getString("Nombre");
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
		 return nombre;
		
	}
	
	public String obtenerProf(int leg)
	{
		cn = new Conexion();
		cn.Open();
		String nombre="";
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where Legajo="+leg);
			 while(rs.next())
			 {
				 nombre= rs.getString("ApellidoNombre");
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
		 return nombre;
		
	}
	
	public boolean altaCurso(Curso c)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO cursos (IDMateria, Semestre, Anio, IDProfesor) "
				     + "VALUES ('"+c.getIDmateria()+"','"+c.getSemestre()+"','"+c.getAnio()+"','"+c.getLegDocente()+"')";
				     
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
	
	
	
	public ArrayList<Persona> obtenerAlumnosDisponibles(int IDCurso) {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Persona> list = new ArrayList<Persona>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from personas where Estado=1 AND Rol='Alumno'");
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
				 pers.setRol("'Alumno'");
				 
				 if (alumnoDisponible(IDCurso, pers.getLegajo()))
				 {
					 list.add(pers); 
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
		 return list;
	}
	
	public boolean alumnoDisponible(int IDCurso, int Legajo) {
		cn = new Conexion();
		cn.Open();
		boolean resultado = true;
		 try
		 {
			 ResultSet rs= cn.query("Select * from alumnos_x_curso where IDCurso="+IDCurso+" AND Legajo="+Legajo);
			 while(rs.next())
			 {
				 resultado=false;
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
		 return resultado;
	}
	
	public boolean cargaAlumnos(int Leg, int IDCurso)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO alumnos_x_curso (IDCurso, Legajo) "
				     + "VALUES ("+IDCurso+","+Leg+")";
				     
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
