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
				return obj.r < 0 && obj.a <= time  
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
			_newNode = $("<div class='time-block'><span class='proc-id'>Stall</span><img class='proc-anime' src='imagens/giphy.gif' alt=''></div>") ; 
			_newNode.css('left' , _leftMargin + 5 + idx * _blockWidth ) ; 
			_newNode.addClass('stall') ; 
		}
		else {
			_newNode = $("<div class='time-block'><span class='proc-id'>P" + procId + "</span><img class='proc-anime' src='imagens/giphy.gif' alt=''></div>") ;  
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
 		{ a : 0 , d : 3  , color : color[0] } , 
 		{ a : 1 , d : 1  , color : color[1] } , 
 		{ a : 2 , d : 5  , color : color[2] } 
	] ; 

	$(document).ready(function(){

		$("#addProc").click(function(){ addProcess( conf ) }) ; 
		$("button.removeProcess").bind('click' , function () {
			console.log($(this).attr('data-idx')) ; 
		})
		
		// executa os algoritmos aleatoriamente
		$("#start").click(function () {
			$('div.time-block').remove() ;
			initView();
			var _ret = null ;
			var r;
			r = Math.floor((Math.random() * 100) + 1);
			var _type; 
			
			if(r > 0 && r < 50){
				_type = "FIFO";
				document.getElementById("1").checked = true;
			
			}else if(r > 50 && r < 75) {
				_type = "RR";
//				document.getElementById("1").checked = false;
				document.getElementById("3").checked = true;
				
			}else if(r > 75 && r < 100){
				_type = "PP";
				document.getElementById("4").checked = true;
			}
						
//			else if(r > 25 && r < 50 ){
//				_type = "RR";
////				document.getElementById("1").checked = false;
//				document.getElementById("3").checked = true;
//				
//			} else if (r > 50 && r <75){
//				_type = "PP";
//				document.getElementById("4").checked = true;
//
//			}
//			else {
//				_type = "SJF";
//				document.getElementById("2").checked = true;
//
//			}
//			
			console.log(r);
			
			
			switch (_type) {
				case "PP" :
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
		
	}); 