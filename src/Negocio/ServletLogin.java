package Negocio;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.IngresoDao;
import AccesoDatos.UsuarioDao;


/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		
		if (request.getParameter("btnLogin")!= null)
		{
			UsuarioDao user = new UsuarioDao();
			IngresoDao ing = new IngresoDao();
			boolean chequeo = false;

			if (request.getParameter("txtUser") != "" && request.getParameter("txtPass") != "")
			{
				
			
			chequeo = user.revisarLogin(Integer.parseInt(request.getParameter("txtUser")), Integer.parseInt(request.getParameter("txtPass")));
			
			}
			
			if (chequeo)
			{
				chequeo =  ing.insertar(Integer.parseInt(request.getParameter("txtUser")));
			}
			
			request.setAttribute ("resultado", chequeo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
			rd.forward(request, response);
		}
		
		
		
		doGet(request, response);
		
		
	}

}
