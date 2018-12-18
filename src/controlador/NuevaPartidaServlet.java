package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NuevaPartidaServlet extends HttpServlet{
	private static final long serialVersionUID = -3580302242881257197L;

	/**
	 * @see HtppServlet#HttpServlet()
	 */
	public NuevaPartidaServlet(){
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		//Cogemos la sesion actual y la cerramos e invalidamos
		HttpSession sesion = request.getSession(true);
		sesion.removeAttribute("partida");
		sesion.invalidate();
	
		//Redirigimos a HundirFlotaServlet, donde tenemos una opcion para crear una partida si no existe
		RequestDispatcher vista = request.getRequestDispatcher("HundirFlotaServlet");
		vista.forward(request, response);
	}
}
