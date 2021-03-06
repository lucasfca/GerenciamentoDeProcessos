<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
    
</head>
<body>
<div class="table-wrapper">
	<div class="container">
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Insira um dos processos abaixo:</h3>
		  </div>
		  <div class="panel-body">
		  	<div class="row">
		  		<div class="col col-xs-6">
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
					  		
					  	</tbody>
				  </table>
		  		</div>
		  		<div class="col col-xs-6">
		  			<button class="btn btn-danger" id="addProc"> Adicionar Processo </button>
		  			<hr/>
		  			<label class="checkbox-inline">
					  <input type="radio" name="type" value="LIFO" checked> LIFO
					</label>
					<label class="checkbox-inline">
					  <input type="radio" name="type" value="FIFO"> FIFO
					</label>
					<label class="checkbox-inline">
					  <input type="radio" name="type" value="SJF"> SJF
					</label>
					<label class="checkbox-inline">
					  <input type="radio" name="type" value="RR"> RR
					  <input type="number" value="1" min="1" id="RRQ" style="width: 40px"> 
					</label>
					
					<br>
		  			<button class="btn btn-success" id="start" > Executar </button>
		  			<hr/> 
		  			<p class="sum"> Tempo médio de Espera : <span id="awt"> </span></p>
		  			<p class="sum"> Tempo médio de resposta : <span id="art"> </span></p>
		  			<p class="sum"> Tempo de resposta : <span id="tt"> </span></p>
		  		</div>
		  	</div>
		  	<hr>
		<div class="view-wrapper">
</div>
		  	
		  </div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var FIFO = function ( conf ) {
	var grunt = [] ; 
	time = 0 ; 

	var findNext = function () {
		var _conf = JSON.parse(JSON.stringify(conf)) ; 
		_conf = _conf.filter(function (obj) {
			return obj.r > 0 && obj.a <= time  
		}) ;
		_conf.sort(function (a , b ) { return a.a > b.a } ) ;  
		return _conf[0] ; 
	}

	_init(conf);

	while ( !_isFinish(conf) ) {
		var _next = findNext() ;
		if ( _next != undefined ) {
			var _nextIdx = _next.idx ;
			var _duration = _next.d ;
			
			conf[_nextIdx].r = 0  ;
			if ( conf[_nextIdx].fr == null ) { conf[_nextIdx].fr = time }
			time += _duration ; 
			conf[_nextIdx].f = time  ; 

			for ( var i = 0 ; i < _duration ; i++ ) {
				grunt.push(_next.idx) ; 
			}
		}

		else {
			grunt.push(-1) ; 
			time += 1 ; 
		}
	}
	return { grunt : grunt , conf : conf } ;  

	} ; 

	var LIFO = function ( conf ) {
		var grunt = [] ; 
		time = 0 ; 

		var findNext = function () {
			// Strategy For FIFO 
			var _conf = JSON.parse(JSON.stringify(conf)) ; 
			_conf = _conf.filter(function (obj) {
				return obj.r > 0 && obj.a <= time  
			}) ;
			_conf.sort(function (a , b ) { return a.a < b.a } ) ;  
			return _conf[0] ; 
		}

		_init(conf);

		while ( !_isFinish(conf) ) {
			var _next = findNext() ;
			if ( _next != undefined ) {
				//console.log(time , _next) ;
				var _nextIdx = _next.idx ;
				var _duration = _next.d ;
				
				conf[_nextIdx].r = 0  ;
				if ( conf[_nextIdx].fr == null ) { conf[_nextIdx].fr = time }
				time += _duration ; 
				conf[_nextIdx].f = time  ; 

				for ( var i = 0 ; i < _duration ; i++ ) {
					grunt.push(_next.idx) ; 
				}
				//console.log("g : " , grunt) ; 
			}

			// appned a Stall 
			else {
				grunt.push(-1) ; 
				time += 1 ; 
			}
		}
		return { grunt : grunt , conf : conf } ;  
	} ; 


	var SJF = function (conf) {
		var grunt = [] ; 
		time = 0 ; 

		var findNext = function () {
			var _conf = JSON.parse(JSON.stringify(conf)) ; 
			_conf = _conf.filter(function (obj) {
				return obj.r > 0 && obj.a <= time  
			}) ;
			_conf.sort(function (a , b ) { return a.d > b.d } ) ;  
			return _conf[0] ; 
		}

		_init(conf);

		while ( !_isFinish(conf) ) {
			var _next = findNext() ;
			if ( _next != undefined ) {
				//console.log(time , _next) ;
				var _nextIdx = _next.idx ;
				var _duration = _next.d ;
				
				conf[_nextIdx].r = 0  ;
				if ( conf[_nextIdx].fr == null ) { conf[_nextIdx].fr = time }
				time += _duration ; 
				conf[_nextIdx].f = time  ; 

				for ( var i = 0 ; i < _duration ; i++ ) {
					grunt.push(_next.idx) ; 
				}
				//console.log("g : " , grunt) ; 
			}

			// appned a Stall 
			else {
				grunt.push(-1) ; 
				time += 1 ; 
			}
		}
		return { grunt : grunt , conf : conf } ; 

	} ; 

	var RR = function ( q , conf ) { 
		var grunt = [] ; 
		time = 0 ; 
		var queue = [] ; 

		var checkArrival = function () {
			for ( var i = 0 ; i < conf.length ; i++ ) {
				if ( conf[i].a == time ) {
					queue.push(conf[i]) ;
				}
			}
			for ( var i = 0 ; i < queue.length ; i++ ) {
				if ( queue[i].r == 0 ) {
					queue.splice(i , 1 ) ; 
				}
			}
		} 

		var findNext = function () {
			console.log("find next ," , time , queue) ; 
			if ( queue.length < 1 ) {
				return undefined ; 
			}
			else if ( queue.length == 1 ) {
				return queue[0] 
			} 
			else {
				return queue[0]; 
			}
		}

		_init(conf);
		checkArrival() ; 

		while ( !_isFinish(conf) ) {
			var _next = findNext() ;
			var _stall = 0 ;
			console.log("++++" , time , _next) ;
			if ( _next != undefined ) {
				var _nextIdx = _next.idx ;
			

				if ( conf[_nextIdx].r > q ) {
					conf[_nextIdx].r -= q  ; 
					for ( var i = 0 ; i < q ; i++ ) {
						grunt.push(_next.idx) ; 
					}
				}
				else if ( conf[_nextIdx].r == q ) {
					console.warn("!!" , _next.r) ;
					for ( var i = 0 ; i < _next.r ; i++ ) {
						grunt.push(_nextIdx) ; 

					}
					conf[_nextIdx].r = 0 ; 
					conf[_nextIdx].f = Number(time + q) ; 
				}
				else {
					for ( var i = 0 ; i < conf[i].r ; i++ ) {
						grunt.push(_nextIdx) ; 
					}
					_stall = q - _next.r ; 
					for ( var i = 0 ; i < _stall ; i++ ) {
						grunt.push(-1) ; 
					}
					console.warn("stall adding"); 
					conf[_nextIdx].f = Number(time + conf[_nextIdx].r) ; 
					conf[_nextIdx].r = 0 ; 
				}

				if ( conf[_nextIdx].fr == null ) { conf[_nextIdx].fr = time }
				for ( var i = 0 ; i < q ; i++ ) {
					time++ ; 
					checkArrival() ;
				} 
				
				queue.push(queue.shift()) ; 
			}

			// appned a Stall 
			else {
				grunt.push(-1) ; 
				time += 1 ; 
				checkArrival() ;
			}
			console.log("g : " , grunt) ; 

		}
		return { grunt : grunt , conf : conf } ; 
	}

	var _init = function (conf) {
		for ( var i = 0 ; i < conf.length ; i ++ ) {
			conf[i].fr = null ;
			conf[i].f = null ; 
			conf[i].idx = i ; 
			conf[i].r = conf[i].d ;
		}
	}

	var _sum = function (conf) {
		var _avgrespTime = 0 ; 
		var _avgWaitingTime = 0 ; 
		var _turnaroundTime = 0 ; 

		var __avgrespTime = "(" ; 
		var __avgWaitingTime = "(" ; 
		var __turnaroundTime = "(" ; 

		for ( var i = 0 ; i < conf.length ; i++ ){
			_avgWaitingTime += ( conf[i].f - conf[i].d - conf[i].a ) ;
			__avgWaitingTime  += ( " <span style='color: " + conf[i].color + " '>( " + String(conf[i].f) + "-" + String(conf[i].d) + "-" + String(conf[i].a) + " ) </span>" + ( i != conf.length-1 ? " + " : "") );  
			_avgrespTime += ( conf[i].fr - conf[i].a ) ; 
			__avgrespTime += " <span style='color: " + conf[i].color + " '>( " + String(conf[i].fr) + "-" + String(conf[i].a) + " ) </span>" + ( i != conf.length-1 ? " + " : "")    
			_turnaroundTime += ( conf[i].f - conf[i].a ) ; 
			__turnaroundTime += " <span style='color: " + conf[i].color + " '>( " + String(conf[i].f) + "-" + conf[i].a + " ) </span>"+ ( i != conf.length-1 ? " + " : "") ; 
		} ; 

		var _count = conf.length ;
		__avgrespTime += " ) / " + _count ; 
		__turnaroundTime += " ) / " + _count ;
		__avgWaitingTime += " ) / " + _count ; 
		console.log(__avgWaitingTime) ; 
		return { 
			avgWaitingTime : _avgWaitingTime/_count , 
			turnaroundTime : _turnaroundTime/_count ,
			avgrespTime : _avgrespTime/_count , 
			avgWaitingTimeF : __avgWaitingTime ,
			turnaroundTimeF : __turnaroundTime ,
			avgrespTimeF : __avgrespTime  
		}
	} ; 

	var _isFinish = function ( conf ) {
		for ( var i = 0 ; i < conf.length ; i++ ) {
			if ( conf[i].r > 0 ) {
				return false ; 
			} 
		}
		return true ; 
	}

	var assignTime = function ( idx , procId , color ) {
		var _newNode ; 
		if ( procId == -1 ) {
			_newNode = $("<div class='time-block'><span class='proc-id'>Stall</span></div>") ; 
			_newNode.css('left' , _leftMargin + 5 + idx * _blockWidth ) ; 
			_newNode.addClass('stall') ; 
		}
		else {
			_newNode = $("<div class='time-block'><span class='proc-id'>P" + procId + "</span></div>") ; 
			_newNode.css('left' , _leftMargin + 5 + idx * _blockWidth ) ; 
			_newNode.css('background-color' , color) ; 
		}
		$wrapper.append(_newNode) ;
		setTimeout(function() {
			_newNode.addClass('show') ; 
		}, 50);
	} ; 

	var chartSimulator = function ( grunt , conf ) {
		if ( grunt.length == 0 ) {
			_simIdx = 0 ;
			renderSummery(conf) ; 
			return 
		}
		var _next = grunt.shift() ;
		var _c ; 
		if ( _next != -1 ) { _c = conf.filter(function ( obj ){ return obj.idx == _next })[0].color }
		assignTime(_simIdx , _next , _c ) ;
		_simIdx += 1 ; 
		setTimeout(function () { chartSimulator(grunt , conf )} , 1000)
	}

	var renderSummery = function (conf) {
		var _summery = _sum(conf) ; 
		console.log(_summery) ; 

		$("#awt").html(_summery.avgWaitingTimeF + " = " + _summery.avgWaitingTime) ; 
		$("#art").html(_summery.avgrespTimeF + " = " + _summery.avgrespTime) ; 
		$("#tt").html(_summery.turnaroundTimeF + " = " + _summery.turnaroundTime) ; 

	}

	var initView = function () {
		for ( var i = 0 ; i < _timeLimit ; i++ ) {
			var _newNode = $("<div class='time-sep'><span class='time-axis'>" + i +"</span></div>") ; 
			_newNode.css("left" , _blockWidth*i + _leftMargin ) ; 
			$wrapper.append(_newNode) ;
		} ; 

		setTimeout(function() {
			$("div.time-sep").addClass('show') ; 
		}, 500);
	} ; 

	var addProcess = function (conf) {
		var _new = { a : Number($("#new_a").val()) , d : Number($("#new_d").val()) , color : color[conf.length%color.length] } ; 
		conf.push(_new) ; 
		renderProcess(conf) ; 
	} ; 

	var renderProcess = function ( conf ) {
		$tbody.empty() ;
		for ( var i = 0 ; i < conf.length ; i ++ ) {
			var _tr = $("<tr> <td style='color : " + conf[i].color + "'>" + ("P"+i) + "</td> <td> " + conf[i].a + " </td> <td> " + conf[i].d + "</td> <td> <button class='removeProcess btn btn-danger btn-xs' onclick=removeProcess(" + i + ")> Remove </button></td> </tr>")
			$tbody.append(_tr) ; 
		} ; 
		var _add = $("<tr> <td>P"+ conf.length +"</td> <td> <input id='new_a' class='form-control' min='0' type='number'/> </td> <td> <input id='new_d' class='form-control' type='number' min='1'/> </td> </tr>") ; 
		console.log(_add) ;
		$tbody.append(_add) ; 
	}

	var removeProcess = function (idx) {
		conf.splice(idx , 1 ) ; 
		renderProcess(conf) ; 
	} ; 

	var _timeLimit = 50 ;
	var _topMargin = 100 ; 
	var _leftMargin = 20 ; 
	var _blockWidth = 50 ; 
	var $wrapper = $(".view-wrapper") ; 
	var $tbody = $('#tbody') ;
	var _simIdx = 0 ; 
	var color = ["#e51c23" , "#9c27b0" , "#673ab7" , "#7c4dff" , "#3f51b5" , "#00bcd4" , "#259b24" , "#ff9800" , "#ff5722" , "#009688"] ;
	var conf = [
		{ a : 5 , d : 3  , color : color[0] } , 
		{ a : 1 , d : 1  , color : color[1] } , 
		{ a : 2 , d : 5  , color : color[2] } 
	] ; 

	$(document).ready(function(){

		$("#addProc").click(function(){ addProcess( conf ) }) ; 
		$("button.removeProcess").bind('click' , function () {
			console.log($(this).attr('data-idx')) ; 
		})
		$("#start").click(function () {
			$('div.time-block').remove() ;
			initView();
			var _ret = null ;  
			var _type = $("input[type=radio]:checked").val() ; 
			switch ( _type ) {
				case "LIFO" :
					_ret = LIFO(conf) ;
					break ;  
				case "FIFO" :
					_ret = FIFO(conf) ;
					break ;
				case "SJF" :
					_ret = SJF(conf) ; 
					break ; 
				case "RR" :
					_q = $("#RRQ").val() ; 
					_ret = RR(_q , conf) ;
					break ; 
			}

			console.log(_ret) ;
			console.log(_sum(_ret.conf)) ; 
			setTimeout(function() {
				chartSimulator(_ret.grunt , _ret.conf) ;
				
			}, 1000);
		}) 
		renderProcess(conf) ;  
		
	})	; 
</script>


<style type="text/css">
	body{
		font-family: 'Ubuntu', sans-serif;
	}
	div.table-wrapper {
		padding: 5px ;
		border-bottom: 1px solid #e2e2e2 ; 
		height: 500px ; 
	}
	div.table-wrapper div.container {
		height: 100% ;
	}
	body > div.table-wrapper > div > div {
		height: 100% ;
		overflow :scroll ;
	}
	div.view-wrapper{
		/*border: 1px solid black ;*/
		position: relative;
		top : 30px ;
	}
	div.time-sep{
		position: absolute; 
		margin: 0 ; 
		left: 20px ; 
		background: black ; 
		width: 0 ; 
		height: 30px ; 
		border-right: 1px solid #e2e2e2 ;
		transition : all .3s ease ;
		opacity: 0 ; 
		top : 20px ; 
	} 
	div.time-sep.show {
		top : 0px ;
		opacity: 1 ;
	}
	span.time-axis {
		position: absolute; 
		top : 40px ;
		font-size: 9px ;
		right: -4px ;  
	}

	div.time-block{
		overflow: hidden;
		font-size: 11px ; 
		width: 0 ;
		text-align: center;
		line-height: 30px ;
		height: 50px ; 
		background: black ;
		position: absolute; 
		left: 25px ; 
		height: 30px ;
		transition : all .98s ease-in-out ;
	} 
	div.time-block.stall {
		background-color: transparent;
		border: 1px dashed #e4e4e4 ; 
	}
	div.time-block.stall span {
		color: gray ; 
	}

	span.proc-id {
		color: white ; 

	}

	div.time-block.show {
		width: 40px ; 
		
	}
	p.sum {
		font-size: 10px ;
	}
</style>
</body>
</html>