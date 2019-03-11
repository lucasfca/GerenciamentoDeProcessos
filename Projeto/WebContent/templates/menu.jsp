<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
	<html lang="pt-br">
		<head>
			<title>E-Mananger</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
			<link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
			<link rel="stylesheet" type="text/css" href="css/menu.css">
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
			<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">		
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  			
		</head>
		<body>
		<!-- topo -->
		<div class="w3-bar w3-top w3-default w3-large" style="z-index:4">
			<nav class="navbar navbar-default">
  				<div class="container-fluid">
  					<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i></button> 
			  		<span class="w3-bar-item w3-left">E-Processos</span>	
  				</div>
			</nav>
		</div>

       <!-- menu -->
			<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
				<br>
				<br>
			 	   	<div class="col-md-8 w3-bar">
				  		<a href="index.jsp" class="w3-bar-item w3-button"><i class="fa fa-home"></i> Início</a>
			      		<a href="#" class="w3-bar-item w3-button"><i class="fa fa-info"></i> Sobre</a>
    				</div>
    				<br>
    				<hr>
	    			<div class="w3-container w3-row">
		    			<h5 style="text-align:center; color:#610B21;"><center>Programas a executar</center></h5>
		   				 <hr>
	  				</div>
	  		
			  	<div class="w3-bar-block" data-toggle="modal" data-target="#algoritmosModal">
				    <a href="#"  class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>	First Come, First Served</a>
				    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>  Shortest Job First</a>
				    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>  Por Prioridade</a>
				    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>  Round-Robin</a>
				    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>  Outro Algoritmo</a>
				    <br>
				    <br>
			  	</div>
			</nav>
			
			<!-- Efeito de sobreposição ao abrir a barra lateral em telas pequenas -->
			<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
			
			<!-- Modal -->
				<div class="modal fade" id="algoritmosModal" role="dialog">
			    	<div class="modal-dialog">
			      		<div class="modal-content">
			        		<div class="modal-header">
			         			 <button type="button" class="close" data-dismiss="modal">&times;</button>
			          				<h4 class="modal-title">Inserir Processo</h4>
			        		</div>
			        		<div class="modal-body">
			          			<form class="w3-container" action="controller.do" method="post">
									<div class="w3-section">
										<div class="w3-row">
											<div class="w3-col s11">
												<label for="tamanho">Tamanho</label> 
												<input class="w3-input" id="tamanho" name="tamanho" required>
											</div>
										</div>
										<br>
										<div class="w3-row">
											<div class="w3-col s11">
												<label for="quantidade">Quantidade</label> 
												<input class="w3-input" id="quantidade" name="quantidade" required>
											</div>
										</div>
									</div>
								</form>

			        		</div>
			        		<div class="modal-footer">
			          			<a href="controller.do?command=IniciarProcesso" type="button" class="btn btn-default" data-dismiss="modal">Iniciar</a>
			        		</div>
			      		</div>			      
			    	</div>
			  	</div>
				
		    <script src="js/jquery-3.3.1.min.js"></script>
		    <script src="js/bootstrap.min.js"></script>
		    <script src="js/menu.js"></script>
		    <script src="js/npm.js"></script>
  			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

		</body>

	</html>
			