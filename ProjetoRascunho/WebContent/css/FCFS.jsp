<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@ page import="java.util.ArrayList" %>
		<%@ page import="model.Processo" %>
	
<!DOCTYPE HTML>
	<html lang="pt-br">
		<head>
			<title>E-Processos</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
			<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
			<link href="css/bootstrap.bundle.min.css" type="text/css" rel="stylesheet">
			<link href="css/index.css" type="text/css" rel="stylesheet">
			<link href="css/FCFS.css" type="text/css" rel="stylesheet">
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			
		</head>
		<body>
		
		
		<%-- 			<c:import url="menu.jsp"></c:import> --%>
			
					<!-- Barra superior com os menus de navegação -->
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="container">
					    	<a class="navbar-brand" href="index.jsp">E-Processos</a>
					    	<button class="navbar-toggler" type="button" data-toggle="collapse" 
					    			data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
					    			aria-expanded="false" aria-label="Toggle navigation">
					    		<span class="navbar-toggler-icon"></span>
					 		</button>
					
						    <div class="collapse navbar-collapse" id="navbarSupportedContent">
						    	<ul class="navbar-nav ml-auto">
						       		<li class="nav-item dropdown">
						          		<a 	class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
						          			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Programas
						        		</a>
						          
						         		 <!-- menu -->
						          		<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
						          			<a class="dropdown-item" href="inserirProcesso.jsp"> Inserir</a>
						          			<a class="dropdown-item" href="FCFS.jsp"> FIFO</a>
						          			<a class="dropdown-item" href="inserirProcesso.jsp"> Teste</a>
						            		<a class="dropdown-item" href="fifo.jsp"> First Come, First Served</a>
						            		<a class="dropdown-item" href="#">Shortest Job First</a>
						            		<a class="dropdown-item" href="#">Por Prioridade</a>
						            		<a class="dropdown-item" href="#">Round-Robin</a>
						            		<a class="dropdown-item" href="#">Outro Algoritmo</a>
						            		<div class="dropdown-divider"></div>
						            		<a class="dropdown-item" href="sobre">Sobre</a>
						          		</div>
						        	</li>
						      	</ul>
						   </div>
						</div>
					</nav>
					
					<div class="container text-center">
					
						<%
	      					ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos"); 
						%>

						<h2 id="fifo" name="fifo">FIRST COME, FIRST SERVED</h2>
						<form action="controller.do" method="POST">
								<c:forEach var="processos" items="${processos}">
									<div class="boxes" id="processos">
											<div class="box">${processos.getNomeProcesso()}</div>
<%-- 											<div class="box">${processos.getTempoChegada()}</div> --%>
<%-- 											<div class="box">${processos.getDuracao()}</div>				 --%>
									</div>
								</c:forEach>
							</form>
						<div class="boxInput">
							<span class="boxInp1"> <span class="num1" id="numtxt">Início</span>
								<span
								style="color: #ffffff; font-size: 30px; padding: 0; margin: 0;">{</span>
								<input class="numBox" id="inputBegin" value="0" maxlength="1" /> <span
								style="color: #ffffff; font-size: 30px">}</span>
							</span><br /> <span class="boxInp2"> <span class="num2" id="numtxt">,Fim</span>
								<span
								style="color: #ffffff; font-size: 30px; padding: 0; margin: 0;">{</span>
								<input class="numBox" id="inputEnd" value="0" maxlength="1" /> <span
								style="color: #ffffff; font-size: 30px">}</span>
							</span><br />
						</div>
					</div>
					
					
	
		
		<!-- Plugin JavaScript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-3.3.1.min.js"></script>
			<script src="js/jquery/jquery-migrate-3.0.1.js"></script>
			<script src="js/jquery/jquery-ui.min.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/bootstrap/bootstrap.bundle.min.js"></script>
			<script src="js/FCFS.js"></script>
			
			
			
			
		</body>
	</html>