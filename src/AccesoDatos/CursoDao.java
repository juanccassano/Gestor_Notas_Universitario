package AccesoDatos;

import java.sql.ResultSet;
import java.util.ArrayList;

import AccesoDatos.Conexion;
import Dominio.Curso;
import Dominio.Materia;
import Dominio.Nota;
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
	
	public ArrayList<Curso> obtenerTodos(int IDDocente) {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Curso> list = new ArrayList<Curso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from cursos where IDProfesor="+IDDocente +" ORDER BY IDMateria asc");
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
	
	
	public ArrayList<Persona> obtenerAlumnosCurso(int IDCurso) {
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
				 
				 if (!alumnoDisponible(IDCurso, pers.getLegajo()))
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
	
	public int obtenerPUno(int IDCurso, int Legajo) {
		cn = new Conexion();
		cn.Open();
		 int nota = 0;
		 try
		 {
			 ResultSet rs= cn.query("Select Nota from notas where Legajo="+Legajo+" AND IDCurso="+IDCurso+" AND Instancia='P1'");
			 while(rs.next())
			 {
				 nota = rs.getInt("Nota");
				 
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
		 return nota;
	}
	
	public int obtenerPDos(int IDCurso, int Legajo) {
		cn = new Conexion();
		cn.Open();
		 int nota = 0;
		 try
		 {
			 ResultSet rs= cn.query("Select Nota from notas where Legajo="+Legajo+" AND IDCurso="+IDCurso+" AND Instancia='P2'");
			 while(rs.next())
			 {
				 nota = rs.getInt("Nota");
				 
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
		 return nota;
	}
	
	public int obtenerRUno(int IDCurso, int Legajo) {
		cn = new Conexion();
		cn.Open();
		 int nota = 0;
		 try
		 {
			 ResultSet rs= cn.query("Select Nota from notas where Legajo="+Legajo+" AND IDCurso="+IDCurso+" AND Instancia='R1'");
			 while(rs.next())
			 {
				 nota = rs.getInt("Nota");
				 
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
		 return nota;
	}
	
	public int obtenerRDos(int IDCurso, int Legajo) {
		cn = new Conexion();
		cn.Open();
		 int nota = 0;
		 try
		 {
			 ResultSet rs= cn.query("Select Nota from notas where Legajo="+Legajo+" AND IDCurso="+IDCurso+" AND Instancia='R2'");
			 while(rs.next())
			 {
				 nota = rs.getInt("Nota");
				 
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
		 return nota;
	}
	
	public boolean cargarNota(Nota n)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		String query = "INSERT INTO notas (Legajo, Nota, Instancia, IDCurso) "
				     + "VALUES ("+ n.getLegajo() +","+ n.getNota()+",'"+ n.getInstancia()+"',"+ n.getIDCurso()+")";
				     
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
	
	public boolean modificarNota(Nota n)
	{
		boolean estado = false;
		cn = new Conexion();
		cn.Open();	

		//String query = "INSERT INTO notas (Legajo, Nota, Instancia, IDCurso) "
		//		     + "VALUES ("+ n.getLegajo() +","+ n.getNota()+",'"+ n.getInstancia()+"',"+ n.getIDCurso()+")";
		
		String query = "UPDATE notas SET Nota="+n.getNota() + " WHERE Legajo="+n.getLegajo()+ " AND Instancia='"+ n.getInstancia() + "' AND IDCurso="+n.getIDCurso();
				     
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
