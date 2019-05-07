<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
	<html lang="pt-br">
		<head>
			 <meta charset="UTF-8">
		    <title>e-Processos</title>
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		    <link href="imagens/icon-tab.png" rel="shortcut icon" type="image/x-icon"/>
		    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
		    <link href="css/bootstrap.bundle.min.css" type="text/css" rel="stylesheet">
		    <link rel="stylesheet" href="lib/bootstrap.min.css">
		    <link href="css/memorias.css" type="text/css" rel="stylesheet">
		    <link href="css/index.css" type="text/css" rel="stylesheet">  
		</head>
		<body class="cd-about" class="cd-about" style="background-image: url(imagens/nyan-cat.gif); background-size: contain;">

			<div class="table-wrapper">
				<div class="container">
					<div class="panel panel-default">
					  <div class="panel-heading">
					    <h1 class="panel-title" style=color:#708090;><center>Gerenciador de Memórias</center></h1>
					    	<p>Os processos serão executados aleatoriamente. 
					    		Passe o mouse em cima do Mário e entenda o que fazer para que isso aconteça:</hp>
					  </div>
					  <div class="panel-body">
					  	<div class="row">
					  		<div class="col col-xs-6">
					  			<div class="row" id="bottom-box">
								     <div id="terminal-header" style="text-align: center;">
								          <div class="col-sm-3"></div>
								               <div class="col-sm-6"></div>
								                <div class="col-sm-3"></div>
								       </div>
								        <span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover">
					  						<img src="imagens/imagem3.gif" style="width:80px;">
					  					</span>
								        <div id="terminal-body">
								
								        </div>
								   </div>
								   <br>
					  			<div class="row">
					  				<div class="col-sm-6">           						
                  						<div class="col-sm-6" id="left-box">
              								<div class="col-sm-6">
                 								 <h4 style=color:#800000>Memória Principal</h4>
                  								 <div id="block-0">
                    								<div id = "block--1"> </div>
                  								</div>
              								</div>
             	 							<div class="col-sm-6">
                  								<h4 style=color:#800000>Entrada</h4>
                  								<div id="input-q-box"></div>
                 	 							<br>
											
              								</div>
          								</div>									
					  				</div>
					  				<hr>
					  				<div class="col col-xs-6">
						  				<div class="row">
							  				<button class="btn btn-info" id="add"> Adicionar Processo </button>
							  					&nbsp;
<!-- 							  				<span 	class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover" -->
<!-- 													data-content="Este elemento executa os processos aleatoriamente. -->
<!-- 													Espere a execução terminar e clique novamente para dar espaço a outro algoritmo. "title="Rodar"> -->
<!-- 					  							<button class="btn btn-success" id="start" > Executar </button> -->
<!-- 					  						</span> -->
					  							&nbsp;
							  				<span class="d-inline-block" tabindex="0" data-toggle="popover" data-trigger="hover"
												data-content="Voltar para a tela inicial.">				  		
									  			<a class="btn btn-secondary" href="index.jsp">&#8592; Voltar </a>
									  			
									  		</span>
						  				</div>
					  					<hr/>
										<label class="checkbox-inline">
										  <input type="radio" name="type" id="first-fit-select" value="FF"> First-Fit
										</label>
										<label class="checkbox-inline">
										  <input type="radio" name="type" id="best-fit-select" value="BF"> Best-Fit
										</label>
										<label class="checkbox-inline">
											<input type="radio" name="type" id="worst-fit-select" value=WF"> Worst-Fit
										</label>
										<label class="checkbox-inline">
										  <input type="radio" name="type" id="next-fit-select" value="NF"> Next-Fit
										</label>
										<label class="checkbox-inline">
										  <input type="radio" name="type" id="outro-fit-select" value="OF"> Outro
										</label>
										<button class="btn btn-success" id="start" > Rodar </button>
										<br>
					  					<hr/> 
					  					<h3 style=color:#800000>Tabela de Saída</h3>
								  			<table class="table table-striped" id="output-table">
											  	<thead>
											  		<tr>
											  			<th style=color:#800000> Processo </th>
											  			<th style=color:#800000> Tamanho </th>
											  			<th style=color:#800000> Status de Alocação </th>
											  			<th> </th>
											  		</tr>
											  	</thead>
											  <tbody id="tbody">
											  		
											  </tbody>
										  </table>
									
					  				</div>
					  		</div>
					  	</div>
					  	<hr>
					  </div>

					
					</div>
				</div>
			</div>
		</div>
			
		
			<script type="text/javascript">

			// popover
				$(function () {
  					$('[data-toggle="popover"]').popover()
				});

			</script>
			
			<!-- Javascript -->
			<script src="js/jquery/jquery.js"></script>
			<script src="js/jquery/jquery-ui.js"></script>
			<script src="js/jquery/jquery-3.3.1..min.js"></script>
			<script src="js/bootstrap/bootstrap.min.js"></script>
			<script src="js/memorias.js"></script>
			<script src="js/typed.js"></script>
			<script src="js/typeit.js"></script>
			
		</body>
	</html>