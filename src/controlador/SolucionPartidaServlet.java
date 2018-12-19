package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

public class SolucionPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = -8115125154824623193L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SolucionPartidaServlet() {
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		//Cogemos la sesion actual y la invalidamos
		HttpSession sesion = request.getSession(true);
		Partida partida = (Partida) sesion.getAttribute("partida");
		
		
		//Actualizamos la partida y redirigimos a jsp TableroSolucion
		sesion.setAttribute("partida", partida);
		RequestDispatcher vista = request.getRequestDispatcher("TableroSolucion.jsp");
		vista.forward(request, response);
	}
}
