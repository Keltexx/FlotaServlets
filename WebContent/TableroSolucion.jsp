<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="modelo.Partida"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundir la flota servlet</title>
<style>
table {
	width: 100%;
	height: 100%;
	margin: auto;
}

#blanco {
	background-color: white
}

#rojo {
	background-color: red
}

#amarillo {
	background-color: yellow
}

#azul {
	background-color: blue
}
</style>
</head>
<body>
	<h1>Hundir la Flota</h1>
	<%
		//Obtencion de la partida y la sesion actual
		HttpSession sesion = request.getSession(true);
		Partida partida = (Partida) sesion.getAttribute("partida");

		int disparos = partida.getDisparosEfectuados();
		int barcosNavegando = partida.getBarcosQuedan();

		//Mensajes a mostrar sobre la partida actual dependiendo la situacion
		out.println("Solucion PARTIDA <br>");
		//La casilla disparada ya habia sido disparada antes (no cambiamos su estado pero incrementa el numero de disparos)
		//Mensajes de estado de la partida (Barcos flotando, hundidos y disparos realizados)
		out.println("Barcos Navegando: " + barcosNavegando + "<br>");
		out.println("Barcos Hundidos: " + (6 - barcosNavegando + "<br>"));
		out.println("Numero de disparos efectuados:  " + disparos + "<br>");

		out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td></td>");

		//Añade la primera fila de letras
		for (int i = 0; i < 8; i++) {
			char letra = (char) (i + 65);
			out.println("<th>" + letra + "</th>");
		}
		out.println("</tr>");
		String color = "blanco";

		for (int i = 0; i < 8; i++) {
			out.println("<tr>");
			//Añade la columna de numeros
			out.println("<th>" + (i + 1) + "</th>");
			//Añadir el resto de celdas con radio buttom
			for (int j = 0; j < 8; j++) {
				switch (partida.getCasilla(i, j)) {
				case Partida.AGUA:
					color = "azul";
					break;
				default:
					color = "rojo";
					break;
				}
				//Se pinta la celda 
				out.println("<td id=\"" + color + "\"" + "></td>");
			}


			out.println("</tr>");
		}
	

		out.println("</table>");
		out.println("<br>");
		out.println("</form>");
	%>

	<!-- Opciones del juego que redirigen a servlets -->
	<a href="/FlotaServlets/NuevaPartidaServlet">Nueva partida</a>
	<br>
	<a href="/FlotaServlets/SalirPartidaServlet">Salir</a>
	<br>
</body>
</html>