<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<!-- bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
  	
  	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  	<script src="js/bootstrap-datetimepicker.min.js"></script>
  	<script src="js/purl.js"></script>

	<style type="text/css">
		body{background-color: #F8F7FF;}
	</style>
<title>Mastrinder - Cadastro de Animal</title>

<script type="text/javascript">
	var tipoFlag = "novo";
	$(document).ready ( function(){
		var racaCombo = null;
		var loteCombo = null;
		//pega o parametros da url
		var url = $.url();
		var tipo = url.param('tipo');
		var codGado = url.param('gado');
		
		if(tipo != null){	
			carregaCampos(codGado);
			tipoFlag = "alterar";
		}else{
			populaRaca(null, null);
			populaLote();
		}
		
		//Usado no datetimepicker
        $("#datePickerNascimento").datetimepicker({
        	language: 'pt-BR',
        	pickTime: false //n�o aparecer a hora
        });

        $("#datePickerPesagem").datetimepicker({
        	language: 'pt-BR',
        	pickTime: false
        });
	});
	
	function carregaCampos(codGado){
		$.ajax({
			type:"post",
			data:{tipoFlag:"dadosGado",codLote:codGado},
			dataType: "json",
			url:"GadoController",
			success: function(result){
				populaLote(result.codLote);
				$("#codigo").val(result.codGado);
				$("#lote").val(result.codLote);
				populaRaca(result.codRaca, document.getElementById("raca"));
				$("#dataNascimento").val(result.dataNascimento); 
				populaRaca(result.racaPai, document.getElementById("racaPai")); 
				populaRaca(result.racaMae, document.getElementById("racaMae")); 
				$("#sexualidade").val(result.sexo);
				$("#observacoes").val(result.observacao);
			}
		});
	}
	
	function populaRaca(racaCombo, field){
		$.ajax({
			type:"post",
			data:{tipoFlag:"comboRaca"},
			dataType: "json",
			url:"RacaController",
			success: function(result){
				var linhas = "<option value='null'>Selecione</option>";  
		        for (var i = 0, length = result.length; i < length; i++) {  
		            var re = result[i];
		            if(racaCombo == re.nomeRaca){
		            	linhas += "<option value='"+re.codRaca+"' selected>"+re.nomeRaca+"</option>";	
		            }else{
			            linhas += "<option value='"+re.codRaca+"'>"+re.nomeRaca+"</option>";                                            
		            }
				}
		        
				if (tipoFlag == 'alterar') {
					var divCorpo = document.getElementById("raca");
					if (field == divCorpo) {
						divCorpo.innerHTML = linhas;
					}
					divCorpo = document.getElementById("racaPai");
					if (field == divCorpo) {
						divCorpo.innerHTML = linhas;
					}
					divCorpo = document.getElementById("racaMae");
					if (field == divCorpo) {
						divCorpo.innerHTML = linhas;
					}
				}else{
					var divCorpo = document.getElementById("raca");
					divCorpo.innerHTML = linhas;
					divCorpo = document.getElementById("racaPai");
					divCorpo.innerHTML = linhas;
					divCorpo = document.getElementById("racaMae");
					divCorpo.innerHTML = linhas;
				}
			}
		});
	}

	function populaLote() {
		$.ajax({
			type : "post",
			data : {
				tipoFlag : "comboLote"
			},
			dataType : "json",
			url : "LoteController",
			success : function(result) {
				var linhas = "<option value='null'>Selecione</option>";
				for (var i = 0, length = result.length; i < length; i++) {
					var re = result[i];
					linhas += "<option value='"+re.codLote+"'>"+ re.descricaoLote + "</option>";
				}
				var divCorpo = document.getElementById("lote");
				divCorpo.innerHTML = linhas;
			}
		});
	}

	function enviar() {
		//Estou pegando as informa�oes do formul�rio
		var codigo = $("#codigo").val();//document.getElementById("codigo").value;
		var lote = $("#lote").val();//document.getElementById("lote").value;
		var raca = $("#raca").val(); //document.getElementById("raca").value;
		var dataNascimento = $("#dataNascimento").val(); //document.getElementById("dataPesagem").value;
		var peso = $("#peso").val(); 
		var racaPai = $("#racaPai").val();
		var racaMae = $("#racaMae").val();
		var status = $("#status").val();
		var sexualidade = $("#sexualidade").val();
		var observacoes = $("#observacoes").val(); 
		var sisbov = $("#sisbov").val();
		var procedencia = $("#procedencia").val(); 
		$.ajax({
			type : "POST",
			dataType: "json",
			data : {
				tipoFlag : tipoFlag,
				codigo : codigo,
				lote : lote,
				dataNascimento : dataNascimento,
				raca : raca,
				peso : peso,
				status : status,
				sexualidade: sexualidade,
				procedencia: procedencia,
				status: status,
				racaPai : racaPai,
				racaMae : racaMae,
				sisbov: sisbov,
				observacoes : observacoes				
			},
			url : "GadoController",
			complete : function(result) {
				alert("Salvou");
				alert(result);
			}
		});
	}
	
</script>
</head>
<body>

<!-- container principal -->
<div class="container">
	<div class="page-header"><h1>Cadastro de Animal</h1></div> 
	
	  <form class="form-horizontal" role="form">
	    <div class="form-group">
	      <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">C�digo:</label>
	      <div class="col-sm-5">          
	        <input type="text" class="form-control" id="codigo" placeholder="">
	      </div>
	      </div>
	      <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Lote:</label>
	      <div class="col-sm-5">          
	        <select id="lote" class="form-control"> <!-- select -->
        	</select>
	      </div>
	      </div>
	      <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Ra�a:</label>
	        <div class="col-sm-5">          
	        <select id="raca" class="form-control"> <!-- select -->
        	</select>
	      </div>
	    </div>
	      
		<div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Data de Nascimento: </label>
	      <div class="col-sm-5">
	      	<div class="input-append" id="datePickerNascimento">
	      		<span class="add-on">
			        <input type="text" class="form-control" id="dataNascimento" placeholder="dd/mm/aaaa" data-format="dd-MM-yyyy"></input>
				</span>          
	      	</div>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="codigo">Peso:</label>
	        <div class="col-sm-5">
	        	<input type="text" class="form-control" id="peso" placeholder="">
	    	</div>
	    </div>

	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Ra�a do Pai:</label>
	      <div class="col-sm-5">          
	        <select id="racaPai" class="form-control">
        	</select>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Ra�a da M�e:</label>
	      <div class="col-sm-5">          
	        <select id="racaMae" class="form-control"> <!-- select -->
        	</select>
	      </div>
	    </div>
	  
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Status:</label>
	      <div class="col-sm-5">          
	        <select id="status" class="form-control"> <!-- select -->
         		<option value="A">Ativo</option> 
         		<option value="S">Sacrificado</option>
         		<option value="F">Finalizado</option>
        	</select>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Proced�ncia:</label>
	      <div class="col-sm-5">          
	        <select id="racaMae" class="form-control"> <!-- select -->
         		<option value="I">Interna</option> 	<!-- option s�o exemplos, v�o ser populados confirma��es do BD -->
         		<option value="E">Externa</option>
        	</select>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Num SISBOV: </label>
	      <div class="col-sm-5">          
	        <textarea class="form-control" rows="4" id="sisbov"></textarea>
	      </div>
	    </div>
	    
	    
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Sexualidade:</label>
	      <div class="col-sm-5">          
	        <select id="racaMae" class="form-control"> <!-- select -->
         		<option value="M">Macho</option> 	<!-- option s�o exemplos, v�o ser populados confirma��es do BD -->
         		<option value="F">F�mea</option>
        	</select>
	      </div>
	    </div>
	  
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="pwd">Observa��es: </label>
	      <div class="col-sm-5">          
	        <textarea class="form-control" rows="4" id="observacoes"></textarea>
	      </div>
	    </div>
	    
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default"; onclick="enviar()"; return false;>Salvar</button>
	        <button type="button" class="btn btn-danger"; onclick="location.href='animalDashboard.jsp';">Cancelar</button>
	      </div>
	    </div>
	    
	  </form>
</div> <!-- fim container principal -->
</body>
</html>