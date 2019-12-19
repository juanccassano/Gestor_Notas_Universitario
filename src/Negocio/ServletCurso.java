package Negocio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.CursoDao;
import AccesoDatos.PersonaDao;
import Dominio.Curso;
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
		
		
		doGet(request, response);
	}

}
