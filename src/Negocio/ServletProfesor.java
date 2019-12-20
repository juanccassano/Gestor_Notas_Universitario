package Negocio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.PersonaDao;
import Dominio.Persona;

/**
 * Servlet implementation class ServletProfesor
 */
@WebServlet("/ServletProfesor")
public class ServletProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProfesor() {
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
		
		if(request.getParameter("legajo") != null){

	         //   int legajo = Integer.parseInt(request.getParameter("legajo"));
	         //   PersonaDao per = new PersonaDao();
	         //   Persona p = per.obtenerPersona(legajo);
//	            String json = new Gson().toJson(p);

//	            response.setContentType("application/json");
//	           response.setCharacterEncoding("UTF-8");
//	            response.getWriter().write(json);
	            
			//	request.setAttribute ("persM", p);
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profesores.jsp");
				rd.forward(request, response);
	            
	        }
			
			
			if(request.getParameter("provSelecN") != null){

	            int provincia = Integer.parseInt(request.getParameter("provSelecN"));
	           
				request.setAttribute ("provS", provincia);
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profesores.jsp");
				rd.forward(request, response);
	            
	        }
			
			 
			
			if (request.getParameter("btnGuardarM")!= null)
			{
				boolean cargadoM = false;
				PersonaDao persona = new PersonaDao();
				Persona modif = new Persona();

				if (request.getParameter("txtDNIM") != "" && request.getParameter("txtApNomM") != "" && request.getParameter("txtDireccionM") != "" && request.getParameter("cbxLocalidadM") != ""&& request.getParameter("cbxProvinciaM") != ""&& request.getParameter("txtMailM") != "" && request.getParameter("txtTelM") != "")
				{
					
					String localidad = "";
					String provincia = "";
					
					localidad= persona.localidadSelec(Integer.parseInt(request.getParameter("cbxLocalidadM")));
					provincia= persona.provinciaSelec(Integer.parseInt(request.getParameter("cbxProvinciaM")));
					
					
					modif.setLegajo(Integer.parseInt(request.getParameter("txtLegM")));
					modif.setDNI(Integer.parseInt(request.getParameter("txtDNIM")));
					modif.setApellidoNombre(request.getParameter("txtApNomM"));
					modif.setDireccion(request.getParameter("txtDireccionM"));
					modif.setLocalidad(localidad);
					modif.setMail(request.getParameter("txtMailM"));
					modif.setProvincia(provincia);
					modif.setTelefono(Integer.parseInt(request.getParameter("txtTelM")));
					modif.setRol("Profesor");
					
					
					
				
				cargadoM = persona.modificarPersona(modif);
				persona.modificarUsuario(modif);
				}
				
				
				request.setAttribute ("resultadoM", cargadoM);
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profesores.jsp");
				rd.forward(request, response);
			}


				

			
			if (request.getParameter("btnGuardarN")!= null)
			{
				boolean cargadoN = false;
				PersonaDao persona = new PersonaDao();
				Persona alta = new Persona();

				if (request.getParameter("txtDNIN") != "" && request.getParameter("txtApNomN") != "" && request.getParameter("txtDireccionN") != "" && request.getParameter("cbxLocalidadN") != ""&& request.getParameter("cbxProvinciaN") != ""&& request.getParameter("txtMailN") != "" && request.getParameter("txtTelN") != "")
				{
					
					String localidad = "";
					String provincia = "";
					
					localidad= persona.localidadSelec(Integer.parseInt(request.getParameter("cbxLocalidadN")));
					provincia= persona.provinciaSelec(Integer.parseInt(request.getParameter("cbxProvinciaN")));
					
					
					alta.setLegajo(persona.proximoLegajo());
					alta.setDNI(Integer.parseInt(request.getParameter("txtDNIN")));
					alta.setApellidoNombre(request.getParameter("txtApNomN"));
					alta.setDireccion(request.getParameter("txtDireccionN"));
					alta.setLocalidad(localidad);
					alta.setMail(request.getParameter("txtMailN"));
					alta.setProvincia(provincia);
					alta.setTelefono(Integer.parseInt(request.getParameter("txtTelN")));
					
					alta.setRol("Profesor");
					
					
					
				
				cargadoN = persona.altaPersona(alta, "Profesor");
				persona.altaUsuario(alta);
				
				
				}
				
				
				request.setAttribute ("resultado", cargadoN);
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profesores.jsp");
				rd.forward(request, response);
			}
			
			if (request.getParameter("btnAceptarB")!= null)
			{
				boolean borrado = false;
				PersonaDao persona = new PersonaDao();
				int leg = (Integer.parseInt(request.getParameter("txtLegB")));
				
				persona.borrarUsuario(leg);
				borrado = persona.borrarPersona(leg);
				
				
				
				
				request.setAttribute ("resultadoB", borrado);
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profesores.jsp");
				rd.forward(request, response);
			}
		
		doGet(request, response);
	}

}
