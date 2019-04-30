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
			<link href="css/bootstrap.bundle.min.css" type="text/css" rel="stylesheet">
			<link href="css/index.css" type="text/css" rel="stylesheet">
			<link href="css/animate.min.css" type="text/css" rel ="stylesheet">
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			
		</head>
		<body>
    
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
						          			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Programas
						        		</a>
						          
						         		 <!-- menu -->
						          		<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
						          			<a class="dropdown-item" href="processo.jsp"> Processos</a>
						            		<div class="dropdown-divider"></div>
						            		<a class="dropdown-item" href="sobre">Sobre</a>
						          		</div>
						        	</li>
						      	</ul>
						   </div>
						</div>
					</nav>
					
					
					
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
		