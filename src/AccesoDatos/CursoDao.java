package AccesoDatos;

import java.sql.ResultSet;
import java.util.ArrayList;

import AccesoDatos.Conexion;
import Dominio.Curso;


public class CursoDao {
	
	private Conexion cn;
	
	public ArrayList<Curso> obtenerTodos() {
		cn = new Conexion();
		cn.Open();
		 ArrayList<Curso> list = new ArrayList<Curso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from cursos");
			 while(rs.next())
			 {
				 Curso curso = new Curso();
				// art.setIdArticulo(rs.getInt("articulos.idArticulo"));
				// art.setNombre(rs.getString("articulos.nombre"));

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

}
