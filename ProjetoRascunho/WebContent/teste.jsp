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
		<body class="cd-about" >
 
<style type="text/css">
    .block1 {
    display: inline-block;
    width: 8em
    }
</style>
 
 
<h1>GetJson</h1>
 
<form Name="PostForm">
    
    <input type="button" id="btt" onclick="FirstCheck()" value="Puxar Dados" />
</form>
 
<h2>Resultado:</h2>
 
<div id="sample-result"></div>
 
 


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