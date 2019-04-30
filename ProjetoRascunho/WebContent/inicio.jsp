<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
  	
	<title>Animated Page Transition | CodyHouse</title>
</head>
<body>
<main>
	<div class="cd-index cd-main-content">
		<div>
			<h1>Animated Page Transition</h1>

			<a class="cd-btn" href="processo.jsp" data-type="page-transition">Start animation</a>
		</div>
	</div>
</main>

<div class="cd-cover-layer"></div>
<div class="cd-loading-bar"></div>
<script src="js/jquery/jquery-2.1.1.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>