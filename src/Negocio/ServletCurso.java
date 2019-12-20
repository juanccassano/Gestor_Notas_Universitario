package Negocio;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.CursoDao;
import AccesoDatos.PersonaDao;

import Dominio.Curso;
import Dominio.Nota;
import Dominio.Persona;

/**
 * Servlet implementation class ServletCurso
 */
@WebServlet("/ServletCurso")
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCurso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getParameter("btnGuardarAlta")!= null)
		{
			boolean cargadoA = false;
			CursoDao cur = new CursoDao();
			Curso alta = new Curso();

			if (request.getParameter("cbxMateria") != "" && request.getParameter("cbxSemestre") != "" && request.getParameter("txtAnio") != "" && request.getParameter("cbxDocente") != "")
			{
					
				
				alta.setID(0);
				alta.setIDmateria(Integer.parseInt(request.getParameter("cbxMateria")));
				alta.setSemestre(Integer.parseInt(request.getParameter("cbxSemestre")));
				alta.setAnio(Integer.parseInt(request.getParameter("txtAnio")));
				alta.setLegDocente(Integer.parseInt(request.getParameter("cbxDocente")));

				
				
				
			
			cargadoA = cur.altaCurso(alta);
			
			}
			
			
			request.setAttribute ("resultadoA", cargadoA);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Cursos.jsp");
			rd.forward(request, response);
		}
		
		
		
		if (request.getParameter("btnCargarAlumnos")!= null)
		{
			int IDSelec = 0;

			if (request.getParameter("CursoSeleccionado") != "")
			{
				IDSelec = Integer.parseInt(request.getParameter("CursoSeleccionado"));
				HttpSession session = request.getSession();
				session.setAttribute("IDCursoSeleccionado", IDSelec);
			}
			

			
			request.setAttribute ("resultadoAC", IDSelec);
			
			RequestDispatcher rd = request.getRequestDispatcher("/AlumnosPorCurso.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
		if (request.getParameter("btnAceptarC")!= null)
		{
			
			boolean carga = false;
			CursoDao cur = new CursoDao();
			
			if (request.getParameter("AlumnosSeleccionados") != "" && request.getParameter("CursoSeleccionado") != "")
			{
				HttpSession session = request.getSession();
				String Seleccionados = request.getParameter("AlumnosSeleccionados");
				String AlumSel[] = Seleccionados.split(",");
				int CantAlum = AlumSel.length;
				
				for (int i=0; i < CantAlum; i++)
				{
					int legSel = Integer.parseInt(AlumSel[i]);
					int curSel = (int) session.getAttribute("IDCursoSeleccionado");
					cur.cargaAlumnos(legSel, curSel);
					carga=true;
				}
			}
			
			request.setAttribute ("resultadoACF", carga);		
			
			RequestDispatcher rd = request.getRequestDispatcher("/Cursos.jsp");
			rd.forward(request, response);
		}
		
		
		if (request.getParameter("btnCargarNotas")!= null)
		{
			CursoDao cur = new CursoDao();
			int IDCurso = 0;
			IDCurso = Integer.parseInt(request.getParameter("CursoSeleccionado"));
			HttpSession session = request.getSession();
			session.setAttribute("IDCursoSeleccionado", IDCurso);
			String table = "";
			ArrayList<Persona> listado = cur.obtenerAlumnosCurso(IDCurso);
			for (Persona p : listado)
			{
				String P1="", P2="", R1="", R2="";
				
				if (cur.obtenerPUno(IDCurso, p.getLegajo()) > 0 && cur.obtenerPUno(IDCurso, p.getLegajo()) <11)
				{
					P1 = Integer.toString(cur.obtenerPUno(IDCurso, p.getLegajo()));	
							
				}
				
				if (cur.obtenerPDos(IDCurso, p.getLegajo()) > 0 && cur.obtenerPDos(IDCurso, p.getLegajo()) <11)
				{
					P2 = Integer.toString(cur.obtenerPDos(IDCurso, p.getLegajo()))	;	
							
				}
				
				if (cur.obtenerRUno(IDCurso, p.getLegajo()) > 0 && cur.obtenerRUno(IDCurso, p.getLegajo()) <11)
				{
					R1 = Integer.toString(cur.obtenerRUno(IDCurso, p.getLegajo()))	;	
							
				}
				
				if (cur.obtenerRDos(IDCurso, p.getLegajo()) > 0 && cur.obtenerRDos(IDCurso, p.getLegajo()) <11)
				{
					R2 = Integer.toString(cur.obtenerRDos(IDCurso, p.getLegajo()))	;	
							
				}
				

				
				table+= "<tr>\r\n" + 
						"      <th scope=\"row\">"+ p.getLegajo() +"</th>\r\n" + 
						"      <td>" + p.getApellidoNombre() + "</td>\r\n" + 
						"      <td><p style=\"text-align:center\";><input type=\"text\" id=parcialUno"+ p.getLegajo()+ " name=\"parcialUno"+ p.getLegajo() +"\" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style=\"width: 30px;\"/ value="+ P1 +"></p></td>\r\n" + 
						"      <td><p style=\"text-align:center\";><input type=\"text\" id=parcialDos"+ p.getLegajo()+ " name=\"parcialDos"+ p.getLegajo() +"\" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style=\"width: 30px;\"/ value="+ P2 +"></p></td>\r\n" + 
						"      <td><p style=\"text-align:center\";><input type=\"text\" id=recupUno"+ p.getLegajo() +" name=\"recupUno"+ p.getLegajo() +"\" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style=\"width: 30px;\"/ value="+ R1 +"></p></td>\r\n" + 
						"      <td><p style=\"text-align:center\";><input type=\"text\" id=recupDos"+ p.getLegajo() + " name=\"recupDos"+ p.getLegajo() +"\" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style=\"width: 30px;\"/ value="+ R2 +"></p></td>\r\n" + 
						"      <td>\r\n" + 
						"      <select class=\"custom-select\" style=\"width: 150px;\">\r\n" + 
						"	  <option value=\"0\" class=\"dropdown-item\">Regular</option> \r\n" + 
						"	  <option value=\"1\" class=\"dropdown-item\">Libre</option> \r\n" + 
						"	  </select>\r\n" + 
						"    </tr>";
				
			}
			
			request.setAttribute("tablaAlumnosCurso", table);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/MenuAlumnos.jsp");
			rd.forward(request, response);
		}
		
		

		if (request.getParameter("btnAceptarCN")!= null)
		{
			
			boolean carga = false;
			CursoDao cur = new CursoDao();
			
			
				HttpSession session = request.getSession();
				int IDCurso= (int) session.getAttribute("IDCursoSeleccionado");
				ArrayList<Persona> listado = cur.obtenerAlumnosCurso(IDCurso);
				for (Persona p : listado)
				{
					String P1 = "parcialUno"+p.getLegajo();
					String P2 = "parcialDos"+p.getLegajo();
					String R1 = "recupUno"+p.getLegajo();
					String R2 = "recupDos"+p.getLegajo();
					
					Nota not = new Nota();
					
					if (request.getParameter(P1) != "")
					{
					not.setIDCurso(IDCurso);
					not.setInstancia("P1");
					not.setLegajo(p.getLegajo());
					not.setNota(Integer.parseInt(request.getParameter(P1)));
					
					if (cur.obtenerPUno(IDCurso, p.getLegajo()) > 0 && cur.obtenerPUno(IDCurso, p.getLegajo()) <11)
					{
						cur.modificarNota(not);
								
					}
					
					else
					
					{
						cur.cargarNota(not);	
					}
					
					
					carga = true;
					}
					
					if (request.getParameter(P2) != "")
					{
					not.setIDCurso(IDCurso);
					not.setInstancia("P2");
					not.setLegajo(p.getLegajo());
					not.setNota(Integer.parseInt(request.getParameter(P2)));
					if (cur.obtenerPDos(IDCurso, p.getLegajo()) > 0 && cur.obtenerPDos(IDCurso, p.getLegajo()) <11)
					{
						cur.modificarNota(not);
								
					}
					
					else
					
					{
						cur.cargarNota(not);	
					}
					carga = true;
					}
					
					if (request.getParameter(R1) != "")
					{
					not.setIDCurso(IDCurso);
					not.setInstancia("R1");
					not.setLegajo(p.getLegajo());
					not.setNota(Integer.parseInt(request.getParameter(R1)));
					if (cur.obtenerRUno(IDCurso, p.getLegajo()) > 0 && cur.obtenerRUno(IDCurso, p.getLegajo()) <11)
					{
						cur.modificarNota(not);
								
					}
					
					else
					
					{
						cur.cargarNota(not);	
					}
					carga = true;
					}
					
					if (request.getParameter(R2) != "")
					{
					not.setIDCurso(IDCurso);
					not.setInstancia("R2");
					not.setLegajo(p.getLegajo());
					not.setNota(Integer.parseInt(request.getParameter(R2)));
					if (cur.obtenerRDos(IDCurso, p.getLegajo()) > 0 && cur.obtenerRDos(IDCurso, p.getLegajo()) <11)
					{
						cur.modificarNota(not);
								
					}
					
					else
					
					{
						cur.cargarNota(not);	
					}
					carga = true;
					}
					
					
				}
				
				
			
			
			request.setAttribute ("resultadoCN", carga);		
			
			RequestDispatcher rd = request.getRequestDispatcher("/Cursos.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		doGet(request, response);
	}

}
