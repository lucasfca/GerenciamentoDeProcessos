<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="model.Processo" %>
<!DOCTYPE HTML>
	<html lang="pt-br">
		<head>
		    <meta charset="UTF-8">
		    <title>e-Processos</title>
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
		    <link href="css/bootstrap.bundle.min.css" type="text/css" rel="stylesheet">
		    <link href="css/index.css" type="text/css" rel="stylesheet">
		    <link href="css/animate.min.css" type="text/css" rel ="stylesheet">
		    <script type="text/javascript" src="lib/jquery-2.1.4.min.js"></script>
		    <link href='https://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
		    <link rel="stylesheet" href="lib/bootstrap.min.css">
		    <link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/> 		    
		    <link href="css/escalonador-processos.css" type="text/css" rel="stylesheet">      
		</head>
		<body class="cd-about"  style="background-image: url(imagens/imagem4.gif); background-size: contain;">
					
 		<!--  Barra superior com os menus de navegação --> 
<%--  			<c:import url="menu.jsp"></c:import>    --%>

				<!-- Barra superior com os menus de navegação -->
<!-- 					<nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!-- 						<div class="container"> -->
<!-- 					    	<a class="navbar-brand" href="index.jsp">e-Processos</a> -->
<!-- 					    	<button class="navbar-toggler" type="button" data-toggle="collapse"  -->
<!-- 					    			data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  -->
<!-- 					    			aria-expanded="false" aria-label="Toggle navigation"> -->
<!-- 					    		<span class="navbar-toggler-icon"></span> -->
<!-- 					 		</button> -->
					
<!-- 						    <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 						    	<ul class="navbar-nav ml-auto"> -->
<!-- 						       		<li class="nav-item dropdown"> -->
<!-- 						          		<a 	class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"  -->
<!-- 						          			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Gerenciar -->
<!-- 						        		</a> -->
						          
<!-- 						         		 menu -->
<!-- 						          		<div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown"> -->
<!-- 						          			<a class="dropdown-item" href="processo.jsp"> Processos</a> -->
<!-- 						          			<a class="dropdown-item" href="memoria.jsp"> Memórias</a> -->
<!-- 						            		<div class="dropdown-divider"></div> -->
<!-- 						            		<a class="dropdown-item" href="sobre.jsp">Sobre</a> -->
<!-- 						          		</div> -->
<!-- 						        	</li> -->
<!-- 						      	</ul> -->
<!-- 						   </div> -->
<!-- 						</div> -->
<!-- 					</nav> -->

			<div class="table-wrapper">
				<div class="container"> 
					<div class="panel panel-default"> 
					  <div class="panel-heading"> 
					    <h3 class="panel-title">Precisamos executar os processos. Passe o mouse em cima do Mário e entenda o que fazer para que isso aconteça:</h3>
					  </div>
					  <%
					  	ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos"); 
	  					%>
					  <div class="panel-body">				  
					  	<div class="row">
					  		<div class="col col-xs-6">
					  		<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover"
									data-content="Você terá que adicionar os processos e selecionar um dos algoritmos. 
									O meu amigo Escalonador irá organiza-lo para que você veja como ocorre o seu funcionamento.">
					  			<img src="imagens/imagem3.gif" style="width:60px;">
					  			</span>
						  			<table class="table">
									  	<thead>
									  		<tr>
									  			<th> Processo </th>
									  			<th> Tempo de Chegada </th>
									  			<th> Tempo de Duração </th>
									  			<th> </th>
									  		</tr>
									  	</thead>
									  	
									  	<tbody id="tbody">				  			
<%-- 									  		<c:forEach var="processos" items="${processos}"> --%>
<!-- 									  		<tr> -->
<%-- <%-- 										        	<td>${processos.getNomeProcesso()}</td>				                  	 --%> 
<%-- 													<td>${processos.getTempoChegada()}</td> --%>
<%-- 										         	<td>${processos.getDuracao()} </td>					                  							                  --%>
<!-- 										        </tr> -->
<%-- 										    </c:forEach> --%>
									  	</tbody>
								  </table>
							
					  		</div>
					  		
				  		<div class="col col-xs-6">
					  			<div class="row">
						  			<button class="btn btn-danger" id="addProc"> Adicionar Processo </button>
						  			&nbsp;
						  			<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover"
											data-content="Voltar para a tela inicial.">					  		
						  				<a class="btn btn-secondary" href="index.jsp">&#8592; Voltar </a>
						  			</span>
					  			</div>
					  			<hr/>
			
			<!-- 		  			<label class="checkbox-inline"> -->
			<!-- 					  <input type="radio" name="type" value="LIFO" checked> LIFO -->
			<!-- 					</label> -->
								<label class="checkbox-inline">
								  <input type="radio" name="type" id="1" value="FIFO"> FCFS
								</label>
								<label class="checkbox-inline">
								  <input type="radio" name="type" id="2" value="SJF"> SJF
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="type" value="Prioridade" checked> Prioridade
								</label> 
								<label class="checkbox-inline"> 
								  <input type="radio" name="type" value="RR"> Round-Robin 
			 					  <input type="number" value="1" min="1" id="RRQ" style="width: 40px">  
								</label>
								<label class="checkbox-inline"> 
								  <input type="radio" name="type" value="LIFO" checked> LIFO 
			 					</label>
								
								<br>
					  			<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover"
									data-content="Este elemento executa os processos ao selecionar um dos algoritmos.
									Espere a execução terminar e clique novamente para dar espaço a outro. "title="Executar">
					  			<button class="btn btn-success" id="start" > Executar </button>
					  			</span>
					  			<hr/> 
					  			<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover"
									data-content="Este elemento exibe o cálculo do resultado dos processos executados."title="Exibir / Ocultar">
					  			<button type="button" class="btn btn-success" onclick="Mudarestado('exibirOcultar')">Exibir / Ocultar</button>
					  			</span>
					  			
					  			<br>
					  			<br>
					  			<div id="exibirOcultar" style="display:none">
						  			<p class="sum"> Tempo médio de Espera : <span id="awt"> </span></p>
						  			<p class="sum"> Tempo médio de resposta : <span id="art"> </span></p>
						  			<p class="sum"> Tempo de resposta : <span id="tt"> </span></p>
					  			</div>
					  		</div>
					  	</div>
					  	<hr>
						
							<div class ="row">
							<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover" data-placement="top"
									data-content="Olá, eu sou o Escalonador, responsável por organizar os processos que serão executados
									conforme o algoritmo selecionado."title="Escalonador de Processos">
							<div id="cat-cpu" style="display:none"> <span><img class='cat-cpu' src='imagens/Simon-CPU.gif' alt=''></span></div>
							</span>
							<div class="view-wrapper"></div>
							</div>
													
						  	
						  </div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function Mudarestado(el) {
	  				var display = document.getElementById(el).style.display;
	  				if (display == "none")
	    				document.getElementById(el).style.display = 'block';
	  				else
	    				document.getElementById(el).style.display = 'none';
				}
				
				$("#start").click(function(){
					  $("#cat-cpu").show();
					});
					
					// popover
				$(function () {
  					$('[data-toggle="popover"]').popover()
				});

				
			</script>
	
		<!-- Plugin JavaScript -->
	<script src="js/escalonador-processos.js"></script>
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