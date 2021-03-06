<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.List"%>
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
						          <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
						          		<a class="dropdown-item" href="inserirProcesso.jsp"> Inserir</a>
						          		<a class="dropdown-item" href="FCFS.jsp"> FIFO</a>						         
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
	  						<h2 id="fifo" name="fifo" style="color:#000000;">First Come, First Served </h2>
	  						<hr>
	  						
	  						<form  action="controller.do" method="post">
	  							<div class="form-group">
	  							 Insira tarefas na lista
	  							 <br>
	  							 <br>
		  							<label for="addItem">Tarefa:</label> 
<!-- 		  							<input id="addItem" type="text" name="nomeProcesso" placeholder="nome do Processo" />  -->
		  							<input type="number"name="new_a" placeholder="Tempo de chegada" />
		  							<input type="number" name="new_d" placeholder="Duração" />
		  								<input type="submit" class="btn btn-success" name="command" value="InserirProcesso">
	  							</div>
	  						</form>
	  						<ul>
	  					     <%
	  					     ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos"); 
	  					     %>
	  						<form action="controller.do" method="post">  
		  					    <button name="command" value="ListarProcessos">Mostrar Processos</button>
		  						<br>
		  						<br>
		  						<table class=" table table-striped table-hover table-bordered "  cellspacing="0" cellpadding="0">
                					<thead>
                    					<tr style="background-color: #90ee90;">
<!-- 					                        <th >Nome de Processo</th> -->
					                        <th>Tempo de Chegada</th>
					                        <th>Duração</th>
                    					</tr>
                    				</thead>                  
				                    <tbody>					                         			                     
										<c:forEach var="processos" items="${processos}">					                   		
									    	<tr>
<%-- 									        	<td>${processos.getNomeProcesso()}</td>				                  	 --%>
												<td>${processos.getTempoChegada()}</td>
									         	<td>${processos.getDuracao()} </td>					                  							                 
									        </tr>
									    </c:forEach>				               
							       </tbody>                                          
                 			</table>
		  				</form>
		  			</ul>
		  			<a class="btn btn-success" href="executar.jsp" >Executar</a>
				</div>				
			</div>	
	
											
						
					      	
			


	
 			<!-- Plugin JavaScript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-3.3.1.min.js"></script>
			<script src="js/jquery/jquery-migrate-3.0.1.js"></script>
			<script src="js/jquery/jquery-ui.min.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/bootstrap/bootstrap.bundle.min.js"></script>
			<script src="js/fifoTeste.js"></script>
			
			
			
			
			
		</body>
	</html>