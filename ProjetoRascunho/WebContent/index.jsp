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
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			
		</head>
		<body>
	
			<!-- Barra superior com os menus de navegação -->
<%-- 			<c:import url="menu.jsp"></c:import> --%>
			
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="container">
					    	<a class="navbar-brand" href="#">E-Processos</a>
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
						          			data-target="#executarProcesso" data-toggle="modal">
						            		<a class="dropdown-item" href="#"> First Come, First Served</a>
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
					  <h1 class="mt-5 text-white font-weight-light">Bem vindo ao E-Processos</h1>
					  <p class="lead text-white-50">Escolha o programa a ser executado no menu acima ou aperte o botão abaixo.</p>
					</div>
					<br>
					<br>
					<div>
					<!-- Botão para acionar modal -->
					<center>
						<button href="controller.do?command=IniciarProcesso" type="button" class="btn btn-primary btn-custom" 
							id="botaoAleatorio" data-toggle="modal" data-target="#executarProcesso">
								<span class="glyphicon glyphicon-ok img-circle text-primary btn-icon"></span>
							<h1>Iniciar</h1>
						</button>
						
					<center>
					</div>
					
					<!-- Modal -->
					<div class="modal fade" id="executarProcesso" tabindex="-1" role="dialog" aria-labelledby="executarBotao" aria-hidden="true">
					  	<div class="modal-dialog" role="document">
					    	<div class="modal-content">
					      		<div class="modal-header">
					        		<h5 class="modal-title" id="algoritmosAleatorio">Inserir</h5>
					        		<button type="button" class="close" data-dismiss="modal" aria-label="Cancelar">
					          			<span aria-hidden="true">&times;</span>
					        		</button>	
					      		</div>
					      		<div class="modal-body">		
									<div class="section">
	 									<div class="w3-row"> 
											<div class="col-md-11"> 
												<label for="tamanho">Tamanho</label> 
												<input class="input" id="tamanho" name="tamanho" required> 
	 										</div>
										</div> 
										<br> 
	 									<div class="row"> 
	 										<div class="col-md-11"> 
	 											<label for="quantidade">Quantidade</label> 
												<input class="input" id="quantidade" name="quantidade" required>
											</div> 
										</div> 
									</div>				
	 			        		</div> 
					      	</div>
					      	<div class="modal-footer">
					      		<form class="container" action="controller.do" method="post">
					      		<button type="button" class="btn btn-primary" href="controller.do?command=RefazerProcesso">Refazer</button>
					        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>					        		
					        	</form>
					      	</div>
					    </div>
					</div>
			


	
 			<!-- Plugin JavaScript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-3.3.1.min.js"></script>
			<script src="js/jquery/jquery-migrate-3.0.1.js"></script>
			<script src="js/jquery/jquery-ui.min.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/bootstrap/bootstrap.bundle.min.js"></script>
			
			
			
			
		</body>
	</html>