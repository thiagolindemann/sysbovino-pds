<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<!-- bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
  	<script src="js/jquery.js"></script>
  	<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	
		 <div class="page-header"><h1>Cadastro de Medicamento</h1></div> 
		 
		 <form class="form-horizontal" role="form">
		 
		 <div class="form-group">
		 <label class="control-label col-sm-2" for="codigo">Nome:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="Medicamento" placeholder="potenay">
	      </div>
	    </div>
	  
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwd">Lote:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="lote" placeholder="DWWE33242">
	      </div>
	    </div>
	    
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">Salvar</button>
	        <button type="button" class="btn btn-danger">Cancelar</button>
	      </div>
	    </div>
	  </form>
	</div>
</div> <!-- fim container principal -->
</body>
</html>