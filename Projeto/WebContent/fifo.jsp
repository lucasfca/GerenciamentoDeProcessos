<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
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
			<link href="css/fifo.css" type="text/css" rel="stylesheet">
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			
		</head>
		<body>

<%-- 		<c:import url="menu.jsp"></c:import> --%>
			
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
						          <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown" 
						          		data-target="#executarProcesso">
						          		<a class="dropdown-item" href="fifoTeste.jsp"> Teste</a>
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
						<div id="page-wrapper">
	  						<h2 id="fifo" name="fifo">First Come, First Served </h2>
	  						<hr>
							<div class="controls">
								<button type="button" id="startBtn">Iniciar</button>
								<button type="button" id="stopBtn">Parar</button>
								<button type="button" id="resetBtn">Refazer</button>
	  						</div>
							<canvas id="stage" width="600" height="100"></canvas>
						</div>	
					</div>
											
						
					      	
			


	
 			<!-- Plugin JavaScript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-3.3.1.min.js"></script>
			<script src="js/jquery/jquery-migrate-3.0.1.js"></script>
			<script src="js/jquery/jquery-ui.min.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/bootstrap/bootstrap.bundle.min.js"></script>
			<script src="js/fifo.js"></script>
			
			
			
			
		</body>
	</html>