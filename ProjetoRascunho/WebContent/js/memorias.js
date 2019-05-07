//all global variables
window.tot = 0;
var totalMemory = 1000;
var totalMemoryQueue = 2000;
var MMfree = 0;
var IQfree = 0;
var num_of_processes = 0;
var total_blocks = 1; //incluindo/excluído
var total_blocks_queue = 1;
var num_of_blocks = 1;
var num_of_blocks_in_queue = 1;
var queue_div = 200;
var processes_in_queue = [{
  size: 0,
  divID: 0
}];
//lista de todos os blocos 
var blocks = [{
  from: 0,
  to: 999,
  size: 1000,
  isAlloc: false,
  processID: 0,
  index: 0,
  divID: 0
}];

//variáveis ​​requeridas para o terminal-caixa de texto
var collection = ['Olá! Este é o Gerenciador de Memórias. Selecione uma memória e adicione um processo para ver sua saída na tabela abaixo.'];
var write = 0;
var flag2 = false;


$(document).ready(function() {

  //Obtém memória total do usuário e define o bloco de memória
  //function getMemory() {
    $('#data-input-content-1').delay(1500).fadeIn('slow');
    $(document).on('click', '#input-memory-submit', function(e, totalMemory) {
      totalMemory = parseInt($('#memory').val());
      //Define o bloco inicial (bloco 0)
      blocks[0].to = totalMemory-1;
      blocks[0].processID = NaN;
      blocks[0].from = 0;
      blocks[0].size = totalMemory;

      var confirm = window.confirm('Memória Total: ' + totalMemory);
      e.preventDefault();
      if(confirm){
        $('#data-input-content-1').fadeOut('fast');
      }
      location.href = "memorias.jsp";
      console.log(totalMemory);
    })
  //}

  //getMemory();
  console.log(totalMemory);

  //Todas as animações iniciais
  $("#input-q-box").animate({height: '75%'}, "ease");
  $("#block-0").animate({height: '90%'}, "ease");

  //funções de depuraçã a serem removidas posteriormente
  function debugprint()
  {
    var i;
    for(i = 0; i<num_of_blocks; i++)
      console.log("Div ID: " + blocks[i].divID + " Index: " + i + " Size: " + blocks[i].size + " From:" + blocks[i].from + " To:" + blocks[i].to + " Alloc: " + blocks[i].isAlloc);
  }

  var type = 0; //Indica o tipo de memória

  
  //Mostra botões das memórias e desativa-os, uma vez que um deles esteja selecionado
  $('#worst-fit-select').removeAttr('disabled');
  $('#best-fit-select').removeAttr('disabled');
  $('#first-fit-select').removeAttr('disabled');
  $('#next-fit-select').removeAttr('disabled');
  $('#outro-fit-select').removeAttr('disabled');
  ///CODIGO ALEATORIO QUE FOI ADICIONADO
  $("#start").on("click", function() {
	  var _ret = null ;
	  var aleatorio;
	  aleatorio = Math.floor((Math.random() * 100) + 1);
	  var type; 
	  if(aleatorio > 0 && aleatorio < 50){
			type = 1;
			document.getElementById("first-fit-select").checked = true;
	  }else if(aleatorio > 50 && aleatorio < 75){
			type = 2;
			document.getElementById("best-fit-select").checked = true;
	  }
  })
  $('#first-fit-select').click(function () {
	  
      $('#best-fit-select').attr('disabled','');
      $('#worst-fit-select').attr('disabled','');
      $('#next-fit-select').attr('disabled','');
      $('#outro-fit-select').attr('disabled','');
      type = 1;
      collection.push('First-Fit selecionado.');
  });

  $('#best-fit-select').click(function(){
      $('#first-fit-select').attr('disabled','');
      $('#worst-fit-select').attr('disabled','');
      $('#next-fit-select').attr('disabled','');
      $('#outro-fit-select').attr('disabled','');
      collection.push('Best-Fit selecionado.');
      type = 2;
  });

  $('#worst-fit-select').click(function () {
      $('#best-fit-select').attr('disabled','');
      $('#first-fit-select').attr('disabled','');
      $('#next-fit-select').attr('disabled','');
      $('#outro-fit-select').attr('disabled','');
      collection.push('Worst-Fit selecionado.');
      type = 3;
  });

  
  $('#add').click(function(){
      var size = prompt('Digite o tamanho do processo: ');
      if(size)
       addNewProcess(parseInt(size));
      
  });

  function findTotalFree(){
    MMfree = 0;
    IQfree = totalMemoryQueue;
    for(var i = 0; i<num_of_blocks; i++)
      if(blocks[i].isAlloc == false)
        MMfree+=blocks[i].size;

    for(var i = 0; i<num_of_blocks_in_queue; i++)
      IQfree -= processes_in_queue[i].size;
  }

  // Adicionar um novo processo
  function addNewProcess(s){

    var flag = 0; //Para verificar se os processos podem ser alocados ou não

    for(var i = 1; i<=num_of_blocks; ++i){
      if(blocks[i-1].size >= s && blocks[i-1].isAlloc == false){
        //console.log("Processo " + num_of_processes + " can be allocated.");
        //Caso os tamanhos de bloco sejam iguais, não há necessidade de criar novas divs

        switch (type) {
          case 1: firstFit(s);
                  break;
          case 2: bestFit(s);
                  break;
          case 3: worstFit(s);
                  break;
          case 4: nextFit(s);
          		  break;
          case 5: outroFit(s);
                  break;
          default: break;
        }
        flag = 1;
        break;
      }
    }

    if (flag == 0){
      findTotalFree();
      console.log("Processo " + num_of_processes + "Não pode ser alocado para a Memória Principal.");
      if(s > MMfree+IQfree){
        collection.push("O tamanho do processo excede o espaço livre total disponível na memória principal e na fila de entrada.");
        collection.push("Não pode ser alocado.");
      }
      else{
        collection.push("O processo não pode ser alocado para a memória principal. É adicionado à fila de entrada.");
        findTotalFree();
        if(MMfree > s) collection.push("Fragmentação externa: " + (MMfree - s));
        addToQueue(s);
        debugprint();
      }
    }
    else{
      collection.push("Processo " + num_of_processes + " alocado para a memória principal.");
    }
  }


  //Adiciona nova div. Aceita uma nova div id e o id do div a ser adicionado após
  function addNewDiv(divid, size, after)
  {
    if(after == -1){
    $('<div class="memory-block" id="block-'+ divid + '"> Processo' + num_of_processes + '</div>').insertAfter('#block--1');
    }
    else if (after == 0)
      $('#block-0').append('<div class="memory-block" id="block-'+ divid + '">Processo ' + num_of_processes + '</div>');
    else
      $('<div class="memory-block" id="block-'+ divid + '">Processo' + num_of_processes + '</div>').insertAfter('#block-' + after);
    //$('#block-' + divid).css('height', 100*(size/totalMemory) + "%");
    $('#block-' + divid).animate({height: 100*(size/totalMemory) + '%'}, "fast");
    $('#block-' + divid).css({"border-color": "#FFFFFF", "border-width":"2px", "border-style":"solid"});

    $('#block-' + divid).on('click', function() {
      removeProcess(divid);
    });
  }

  //resizes a block (div)
  function resizeDiv(divid, size)
  {
    if(divid == 0){
      $('#block-0').css('height', 90+"%");
      return;
    }
    var newHt = 100*(size/totalMemory);
    $('#block-' + divid).css('height', newHt + "%");
  }

  //Exclui um bloco
  function removeDiv(divid)
  {
    console.log("Removed div id: " + divid);
    $('#block-' + divid).remove();
  }

  //A função nunca será chamada porque todo o ajuste é feito antes
  function compactSpaces()
  {
    var i;
    for(var i = 0; i<num_of_blocks-1; i++)
    {
      if(blocks[i].isAlloc == false && blocks[i+1].isAlloc == false)
      {
        console.log("Espaços livres adjacentes compactados");
        blocks[i+1].size += blocks[i].size;
        blocks[i+1].from = blocks[i].from;
        blocks[i+1].index = i;
        removeDiv(blocks[i].divID);
        resizeDiv(blocks[i+1].divID ,blocks[i+1].size);
        blocks.splice(i,1);
        num_of_blocks--;
      }
    }
  }

  //First-Fit toma o tamanho do processo como parâmetro e cria um objeto de processo
  function firstFit(s)
  {
    ++num_of_processes; //Incremento do número total de processos
    var newP = {
      from: 0,
      to: 0,
      size: 0,
      isAlloc: false,
      processID: 0,
      index: 0,
      divID: 0
    };
    for(var i = 1; i<=num_of_blocks; i++){
      console.log(blocks[i-1].size + "DIVID" + blocks[i-1].divID);
      if(blocks[i-1].size >= s && blocks[i-1].isAlloc == false)
      {
        //cria um novo bloco
        newP.size = s;
        newP.isAlloc = true;
        newP.processID = total_blocks;
        newP.from = blocks[i-1].from;
        newP.to = newP.from + newP.size - 1;
        newP.divID = total_blocks;
        newP.index = i-1;

        //Atualiza valores do novo bloco livre de onde o novo bloco é adicionado
        blocks[i-1].from = newP.to + 1;
        blocks[i-1].size -= newP.size;
        blocks[i-1].index = i;
        resizeDiv(blocks[i-1].divID, blocks[i-1].size);

        //Adiciona bloco à lista de blocos na posição correta
        blocks.splice(i-1, 0, newP);

        //O bloco é adicionado e incrementado
        ++num_of_blocks;
        ++total_blocks;

        //Cria uma nova div correspondente ao bloco com o novo código da div
        var afterWhere;
        if(i-1 == 0)
          //afterWhere = blocks[1].divID;
          afterWhere = -1;
        else
          afterWhere = blocks[i-2].divID;
        addNewDiv(newP.divID, newP.size, afterWhere);
        writeToTable(newP);
        incompleteAllocationStatus(newP.divID);
        break;
      }
    }
  }

  //Worst-Fit toma o tamanho do processo como parâmetro e cria um objeto de processo
  function worstFit(s)
  {
    ++num_of_processes; //Incremento do número total de processos
    var max = blocks[0].size;
    var max_index = 0;

    //Encontra o primeiro bloco não alocado
    for(var j = 0; j<num_of_blocks; j++)
      if(blocks[j].isAlloc == false && blocks[j].size >= s)
      {
        max = blocks[j].size;
        max_index = j;
        break;
      }


    var newP = {
      from: 0,
      to: 0,
      size: 0,
      isAlloc: false,
      processID: 0,
      index: 0,
      divID: 0
    };
    for(var i = 1; i<num_of_blocks; i++)
    {
      if(blocks[i].size > max && blocks[i].isAlloc == false)
      {
        max = blocks[i].size;
        max_index = i;
      }
    }

    //Cria um novo bloco
    newP.size = s;
    newP.isAlloc = true;
    newP.processID = total_blocks;
    newP.from = blocks[max_index].from;
    newP.to = newP.from + newP.size - 1;
    newP.divID = total_blocks;
    newP.index = max_index;

    //Atualiza valores do bloco livre de onde o novo bloco é adicionado.
    blocks[max_index].from = newP.to + 1;
    blocks[max_index].size -= newP.size;
    blocks[max_index].index = max_index+1;
    resizeDiv(blocks[max_index].divID, blocks[max_index].size);

    //Adiciona o bloco à lista de blocos na posição correta.
    blocks.splice(max_index, 0, newP);

    //O bloco é adicionado e incrementado.
    ++num_of_blocks;
    ++total_blocks;

    //Cria uma nova div correspondente ao bloco com o novo código da div.
    var afterWhere;
    if(max_index == 0)
      afterWhere = -1;
    else
      afterWhere = blocks[max_index-1].divID;
    addNewDiv(newP.divID, newP.size, afterWhere);
    writeToTable(newP);
    incompleteAllocationStatus(newP.divID);
  }

  //Best-Fit toma o tamanho do processo como parâmetro e cria um objeto de processo
  function bestFit(s)
  {
    ++num_of_processes; //Incremento do número total de processos.
    var fit = blocks[0].size;
    var fit_index = 0;

    //Encontra o primeiro bloco não alocado.
    for(var j = 0; j<num_of_blocks; j++)
      if(blocks[j].isAlloc == false && blocks[j].size >= s)
      {
        fit = blocks[j].size;
        fit_index = j;
        break;
      }

    //Cria um novo objeto de processo
    var newP = {
      from: 0,
      to: 0,
      size: 0,
      isAlloc: false,
      processID: 0,
      index: 0,
      divID: 0
    };
    for(var i = 1; i<num_of_blocks; i++)
    {
      if(blocks[i].size < fit && blocks[i].isAlloc == false && blocks[i].size > s)
      {console.log("Entered");
        fit = blocks[i].size;
        fit_index = i;
      }
    }

    //create new block
    newP.size = s;
    newP.isAlloc = true;
    newP.processID = total_blocks;
    newP.from = blocks[fit_index].from;
    newP.to = newP.from + newP.size - 1;
    newP.divID = total_blocks;
    newP.index = fit_index;

    //Atualiza valores do bloco livre de onde o novo bloco é adicionado
    blocks[fit_index].from = newP.to + 1;
    blocks[fit_index].size -= newP.size;
    blocks[fit_index].index = fit_index+1;
    resizeDiv(blocks[fit_index].divID, blocks[fit_index].size);

    //Adiciona bloco à lista de blocos na posição correta
    blocks.splice(fit_index, 0, newP);

    //O bloco é adicionado e incrementado
    ++num_of_blocks;
    ++total_blocks;

    //Cria uma nova div correspondente ao bloco com o novo código da div.
    var afterWhere;
    if(fit_index == 0)
      afterWhere = -1;
    else
      afterWhere = blocks[fit_index-1].divID;
    addNewDiv(newP.divID, newP.size, afterWhere);
    writeToTable(newP);
    incompleteAllocationStatus(newP.divID);
    debugprint();
  }

  //Remove um processo da memória principal. Leva o id do div do processo a ser removido como parâmetro.
  function removeProcess(id)
  {
    var i, j;
    for(i = 1; i<=num_of_blocks; i++)
    {
      if(blocks[i-1].divID == id && blocks[i-1].isAlloc){
        break;
      }
    }
    blocks[i-1].isAlloc = false;
    completionAllocatedStatus(blocks[i-1].divID);
    blocks[i-1].isAlloc = true;
    collection.push("Processo " + blocks[i-1].processID + " está completo.");

    //Variáveis ​​para verificar se há espaços livres antes e depois dos blocos atribuídos ao processo
    var ptrBefore = 0;
    var ptrAfter = 0;
    var beforeFlag = 0;
    var afterFlag = 0;
    for(j = 1; j<=num_of_blocks; j++)
    {
      if((blocks[j-1].to == blocks[i-1].from - 1) && blocks[j-1].isAlloc == false)
      {
        ptrBefore = j-1;
        beforeFlag = 1;
      }
      if(blocks[j-1].from == blocks[i-1].to + 1 && blocks[j-1].isAlloc == false)
      {
        ptrAfter = j-1;
        afterFlag = 1;
      }
    }

    if(afterFlag == 0 && beforeFlag == 0)
    {
      console.log("sem espaço antes e depois do bloco");
      blocks[i-1].isAlloc = false;
      $('#block-' + blocks[i-1].divID).removeClass("memory-block");
      document.getElementById('block-' + blocks[i-1].divID).innerHTML = "";
    }
    else if(beforeFlag == 1 && afterFlag == 1)
    {
      console.log("espaços livres antes e depois");
      blocks[ptrAfter].from = blocks[ptrBefore].from;
      blocks[ptrAfter].size = blocks[ptrAfter].size + blocks[ptrBefore].size + blocks[i-1].size;
      if(blocks[ptrAfter].size > totalMemory) blocks[ptrAfter].size = totalMemory;
      console.log(blocks[ptrAfter].size);
      removeDiv(blocks[ptrBefore].divID);
      removeDiv(blocks[i-1].divID);
      resizeDiv(blocks[ptrAfter].divID, blocks[ptrAfter].size);
      blocks.splice(i-1, 1);
      blocks.splice(ptrBefore, 1);
      num_of_blocks-=2;
    }
    else if (beforeFlag == 1)
    {
      console.log("Espaço livre antes de bloquear");
      blocks[ptrBefore].to = blocks[i-1].to;
      blocks[ptrBefore].size = blocks[ptrBefore].size + blocks[i-1].size;
      $('#block-' + blocks[i-1].divID).remove();

      var id2 = blocks[ptrBefore].divID;
      var height2 = 100*(blocks[ptrBefore].size/totalMemory);
      $('#block-' + id2).css('height', height2 + "%");
      blocks.splice(i-1, 1);
      num_of_blocks--;
    }
    else if(afterFlag == 1)
    {
      console.log("Espaço livre após o bloco");
      blocks[ptrAfter].from = blocks[i-1].from;
      blocks[ptrAfter].size = blocks[ptrAfter].size + blocks[i-1].size;
      $('#block-' + blocks[i-1].divID).remove();

      var id2 = blocks[ptrAfter].divID;
      if(id2 == 0)
      {
        blocks.splice(i-1, 1);
        num_of_blocks--;
        debugprint();
        checkAndAddFromQueue();
        return;
      }
      var height2 = 100*(blocks[ptrAfter].size/totalMemory);
      $('#block-' + id2).css('height', height2 + "%");
      blocks.splice(i-1, 1);
      num_of_blocks--;
    }
    //compactSpaces(); //NO NEED
    //debugprint();
    checkAndAddFromQueue();
  }

  //Toda vez que um processo é excluído, esta função é invocada. Verifica se há algum processo na fila de entrada que pode ser alocado para a memória principal.  
  function checkAndAddFromQueue(){
    for(i = 1; i<=num_of_blocks_in_queue-1; i++){
      for(j = 1; j<=num_of_blocks; j++){
        if(processes_in_queue[i-1].size <= blocks[j-1].size && blocks[j-1].isAlloc == false)
        {
          console.log("Processo adicionado da fila de entrada para a memória principal automaticamente.");
          collection.push("Processo adicionado da fila de entrada à memória principal.");
          num_of_blocks_in_queue--;
          $('#op-data-' + processes_in_queue[i-1].divID).remove();
          switch (type) {
            case 1: $('#qblock-'+processes_in_queue[i-1].divID).remove();
                    firstFit(processes_in_queue[i-1].size);
                    processes_in_queue.splice(i-1, 1);
                    break;
            case 2: $('#qblock-'+processes_in_queue[i-1].divID).remove();
                    bestFit(processes_in_queue[i-1].size);
                    processes_in_queue.splice(i-1, 1);
                    break;
            case 3: $('#qblock-'+processes_in_queue[i-1].divID).remove();
                    worstFit(processes_in_queue[i-1].size);
                    processes_in_queue.splice(i-1, 1);
                    break;
          }
          i--;
          break;
        }
      }
    }
  }

  //Se o processo não puder ser ajustado na memória principal, ele será adicionado à fila de entrada
  function addToQueue(s){
    var newVar = {
      size: s,
      divID: queue_div,
      processID: '-',
      isAlloc: false
    };
    processes_in_queue.splice(0, 0, newVar);

    $('#input-q-box').append('<div class="memory-block" id="qblock-'+ queue_div + '"></div>');
    $('#qblock-' + queue_div).animate({height: 100*(s/totalMemoryQueue) + '%'}, "fast");
    $('#qblock-' + queue_div).css({"border-color": "#FFFFFF", "border-width":"2px", "border-style":"solid"});
    writeToTable(newVar);
    $('#op-data-'+ newVar.divID).css('background','rgb(66, 134, 244)   ');
    total_blocks_queue++;
    queue_div++;
    num_of_blocks_in_queue++;
  }


  //Funções para lidar com a caixa de texto do terminal
  setInterval(callWriteTo,1000);
  setInterval(scrollTypedTextDown, 500);

   function writeTo(){
       flag2 = true;
       if(write >= collection.length){
           flag2 = false;
           return;
       }

       $('#terminal-body').append('<div id="typed-'+ write +'"></div>');

       scrollTypedTextDown();

       if(write>0){
           $('#typed-'+(write-1)).find('.ti-cursor').addClass('is-hidden');
       }

       $('#typed-'+write).typeIt({
           strings: collection[write],
           autoStart: true,
           speed: 30,
           lifelife: false,

           callback: function () {
               write++;
               writeTo();
           }
       });
   }

   function check(){
       if( write < collection.length){
           return true;
       }else return false;
   }

   function callWriteTo(){
     if (check() && (flag2 == false)) {
         writeTo();
         return;
     }else return;
   }

  function scrollTypedTextDown(){
    document.getElementById('bottom-box').scrollTop = document.getElementById('bottom-box').scrollHeight;
  }

  function scrollTableDown(){
    document.getElementById('top-box').scrollTop = document.getElementById('top-box').scrollHeight;
  }


function writeToTable(p){
     var tableBody = '#output-table > tbody';
     $(tableBody).append('<tr id="op-data-' + p.divID + '">' +
         '<td id="id">' + p.processID + '</td>' +
         '<td id="size">' + p.size + '</td>' +
         '<td id="status">' + p.isAlloc + '</td>' +
         '</tr>');
     scrollTableDown();
 }

 function editAllocationStatus(p){
     if(p.isAlloc == true){
         $('#op-data-'+ p.divID + ' #status').html('<i class="fa fa-check-circle" aria-hidden="true"></i>');
     }else if(p.isAlloc == false){
         $('#op-data-'+ p.divID +' #status').html('<i class="fa fa-times-circle" aria-hidden="true"></i>');
     }
 }

 function completionAllocatedStatus(id){
     $('#op-data-'+ id +' #status').html('<i class="fa fa-check-circle" style="color:purple" aria-hidden="true"></i>');
     $('#op-data-'+ id).css('background','rgba(0, 128, 3, 0.44)');
 }

 function incompleteAllocationStatus(id) {
     $('#op-data-'+ id +' #status').html('<i class="fa fa-times-circle" style="color:dimgray" aria-hidden="true"></i>');
     $('#op-data-'+ id).css('background','rgb(229, 50, 78)  ');
}
 

})

