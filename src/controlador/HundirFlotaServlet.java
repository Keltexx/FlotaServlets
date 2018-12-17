package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * @see HttpServlet#HttpServlet()
 */
public class HundirFlotaServlet extends HttpServlet{
	private static final long serialVersionUID = 8729309655459452098L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
	public HundirFlotaServlet(){
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession sesion = request.getSession(true);
		Partida partida = (Partida) sesion.getAttribute("partida");
		boolean disparada = false;
		
		if(partida == null){
			partida = new Partida(8,8,6);
		}
		else{
			if(request.getParameter("casilla")!=null){
				String[] casillas = request.getParameter("casilla").split("#");
				int fila = Integer.parseInt(casillas[0]);
				int col = Integer.parseInt(casillas[1]);
				disparada = partida.casillaDisparada(fila, col);
				partida.pruebaCasilla(fila, col);
			}
		}
		sesion.setAttribute("partida", partida);
		sesion.setAttribute("disparada", disparada);
		RequestDispatcher vista = request.getRequestDispatcher("TableroActual.jsp");
		vista.forward(request, response);
	}
}
