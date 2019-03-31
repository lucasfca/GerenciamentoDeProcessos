<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.List"%>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="model.Processo" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Animação</title>
<link rel="stylesheet" type="text/css"
	href="css/ArraySliceAnimation.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

</head>
<body onload="message()">
	<h1>Teste</h1>

	<div class="container">
	<%
	      ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos"); 
	%>

		<h2>ARRAY LIST</h2>
		
		<div class="boxes" id="processos" >
		<c:forEach var="processos" items="${processos}">
			<tr>		   
			<td><div class="box">${processos.getNomeProcesso()}</div></td>
			</tr>
		</c:forEach>
		</div>
			  

		<div class="boxInput">
			<span class="boxInp1"> <span class="num1" id="numtxt">start</span>
				<span
				style="color: #a88e32; font-size: 30px; padding: 0; margin: 0;">{</span>
				<input class="numBox" id="inputBegin" value="0" maxlength="1" /> <span
				style="color: #a88e32; font-size: 30px">}</span>
			</span><br /> <span class="boxInp2"> <span class="num2" id="numtxt">,end</span>
				<span
				style="color: #a88e32; font-size: 30px; padding: 0; margin: 0;">{</span>
				<input class="numBox" id="inputEnd" value="0" maxlength="1" /> <span
				style="color: #a88e32; font-size: 30px">}</span>
			</span><br />
		</div>

	</div>
		<script src="js/animacao.js"></script>
</body>
</html>