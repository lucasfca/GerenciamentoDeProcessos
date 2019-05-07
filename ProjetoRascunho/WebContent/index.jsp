<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE HTML>
	<html lang="pt-br">
		<head>
			<title>e-Processos</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
			<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
			<link href="css/index.css" type="text/css" rel="stylesheet">
			<link href="css/animate.min.css" type="text/css" rel ="stylesheet">
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			
		</head>
		<body id="img2">
    
<!--     	Barra superior com os menus de navegação -->
<%-- 			<c:import url="menu.jsp"></c:import>  --%>
			
					<!-- Barra superior com os menus de navegação -->
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="container">
					    	<a class="navbar-brand" href="index.jsp">e-Processos</a>
					    	<button class="navbar-toggler" type="button" data-toggle="collapse" 
					    			data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
					    			aria-expanded="false" aria-label="Toggle navigation">
					    		<span class="navbar-toggler-icon"></span>
					 		</button>
					
						    <div class="collapse navbar-collapse" id="navbarSupportedContent">
						    	<ul class="navbar-nav ml-auto">
						       		<li class="nav-item dropdown">
						          		<a 	class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
						          			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Gerenciar
						        		</a>
						          
						         		 <!-- menu -->
						          		<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
						          			<a class="dropdown-item" href="processo.jsp"> Processos</a>
						          			<a class="dropdown-item" href="memorias.jsp"> Memórias</a>
						            		<div class="dropdown-divider"></div>
						            		<a class="dropdown-item" href="sobre.jsp">Sobre</a>
						          		</div>
						        	</li>
						      	</ul>
						   </div>
						</div>
					</nav>
				
					<div class="container text-center">
					  <h1 id="eProcessos" class="mt-5 text-white font-weight-light animated infinite bounce">Simulador de Processos e Memórias</h1>
					  <h2 class="lead text-white-50 animated infinite pulse">Olá, eu sou o Mário. Seja bem vindo ao e-Processos.
										A partir de agora serei o seu guia neste game.
										Escolha o programa a ser executado no menu acima ou aperte o botão abaixo para executar os processos aleatoriamente:</h2>
					
						<span>
						  	<img src="imagens/imagem3.gif" style="width:100px;">
						</span>				
					</div>
					<br>
					<br>
					<div>
						<!-- Botão para acionar modo randomico -->
						<center>
							<div class="cd-about cd-main-content">
								<div>
									<a href="randomico.jsp" class="cd-btn btn "  
										id="start" data-type="page-transition">Animação Randômica &#8594;
									</a>
								</div>
							</div>	
						<center>
						
<!-- 						<div class="load"> <img src="imagens/loading.gif"></div> -->
						
						<div class="cd-cover-layer"></div>
						<div class="cd-loading-bar"></div>
					
					</div>
					
			
	

	
 			<!-- Plugin JavaScript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-3.3.1.min.js"></script>
			<script src="js/jquery/jquery-migrate-3.0.1.js"></script>
			<script src="js/jquery/jquery-ui.min.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/bootstrap/bootstrap.bundle.min.js"></script>
			<script src="js/modernizr.js"></script>
			<script src="js/index.js"></script>
			
			
			
			
		</body>
	</html>