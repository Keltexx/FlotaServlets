package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SalirPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = -2117449561482862290L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalirPartidaServlet() {
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
		
		//Redirigimos a index.html
		response.sendRedirect("index.html");
	}
}
