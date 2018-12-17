<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="modelo.Partida"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hundir la flota servlet</title>
<style>
	table{
		width:100%;
		height:100%;
		margin:auto;
	}
	#blanco {
		background-color:white
	}
	#rojo {
		background-color:red
	}
	#amarillo{
		background-color:yellow
	}
	#azul{
		background-color:blue
	}
</style>
</head>
<body>
	<h1>Hundir la Flota</h1>
	<%
	HttpSession sesion = request.getSession(true);
	Partida partida = (Partida) sesion.getAttribute("partida");
	boolean disparada = (boolean) sesion.getAttribute("disparada");
	int fila=-1, col=-1;
	final int AGUA = -1, TOCADO = -2, HUNDIDO = -3;
	
	if (request.getParameter("casilla")!=null){
		String posicionesCasilla[] = request.getParameter("casilla").split("#");
		fila = Integer.valueOf(posicionesCasilla[0]);
		col = Integer.valueOf(posicionesCasilla[1]);
	}
	
	if (partida.getDisparosEfectuados()==0){
		out.println("NUEVA PARTIDA <br>");
	}
	else if (partida.getBarcosQuedan()==0){
		out.println("GAME OVER <br>");
	}
	else if(disparada){
		out.println("Pagina de resultados del disparo en("+(fila+1)+","+(char) (col+65)+"): Vuelve a intentarlo, esta casilla ya habido sido disparada <br>");
	}
	else{
		out.println("Pagina de resultados del disparo en("+(fila+1)+","+(char) (col+65)+"): Ok! <br>");
	}
	
	out.println("Barcos Navegando: " + partida.getBarcosQuedan() + "<br>");
	out.println("Barcos Hundidos: " + (6 - partida.getBarcosQuedan() + "<br>"));
	out.println("Numero de disparos efectuados:  " + partida.getDisparosEfectuados() + "<br>");
	
	out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
	out.println("<table>");
	out.println("<tr>");
	out.println("<td></td>");
	
	//Añadir la primera fila de letras
	for (int i=0; i<8; i++){
		char letra = (char) (i+65);
		out.println("<th>"+letra+"</th>");
	}
	out.println("</tr>");
	String color="blanco";
	
	for(int i=0; i<8; i++){
		out.println("<tr>");
		//Añadir la columna de numeros
		out.println("<th>"+(i+1)+"</th>");
		//Añadir el resto de celdas con radio buttom0
		for(int j=0; j<8; j++){
			if(partida.casillaDisparada(i, j)){
				switch(partida.getCasilla(i, j)){
					case AGUA:
						color="azul";
						break;
					case TOCADO:
						color="amarillo";
						break;
					case HUNDIDO:
						color="rojo";
						break;
				}
			}
			else
				color="blanco";
			out.println("<td id=\"" + color + "\""+"><input type=\"radio\" name=\"casilla\" value=\"" + i + "#" + j + "\"required "+ (partida.getBarcosQuedan()==0 ? "disabled" : "") +"> </td>");
		}
		out.println("</tr>");
	}
		
	
	out.println("</table>");
	if(partida.getBarcosQuedan()!=0)
		out.println("<input type=\"submit\" value=\"Submit\">");
	else
		out.println("<br>");
	out.println("</form>");
	%>
	<a href="">Muestra solucion</a><br>
	<a href="">Nueva partida</a><br>
	<a href="">Salir</a><br>
</body>
</html>