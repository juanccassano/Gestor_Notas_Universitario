<%@page import="Dominio.Usuario" %>
<%@page import="AccesoDatos.UsuarioDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
</br>

<div class="row">
 <div class="col-1">

 </div>
 <div class="col-3">
<h2> Ingreso </h2>
 </div>
 </div>

</br>

<form method= "post" action="ServletLogin">

<div class="row">
 <div class="col-1">
 Legajo:
 </div>
 <div class="col-3">
 <input type="text" name="txtUser" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/>
 </div>
 </div>
</div>
</br>



<div class="row">
 <div class="col-1">
 Clave:
 </div>
 <div class="col-3">
 <input type="password" name="txtPass" maxlength="8" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/>
 </div>
 </div>
</div>

</br>
</br>

<div class="row">
 <div class="col-1">

 </div>
 <div class="col-3">
 <input type="submit" class="btn btn-info" name="btnLogin" value="Ingresar" />
 </div>
 </div>

</br>
</br>
</form>

 <%   
 
 	

 	if (request.getAttribute("resultado") != null)
 	{
 		boolean res = false;
 		res = (boolean) request.getAttribute("resultado");
 		
 	 	if (res)
 	 	{
 	%>
 	
 	<script type="text/javascript">
 	window.location.href = "Inicio.jsp";
 	</script>
 	
 	
 	<% 
 	 	}
 	 	
 	 	else
 	 	{
 	 		%>

<body onLoad="$('#modalIncorrecto').modal('show');">
<div class="modal fade" id="modalIncorrecto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Error</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        El usuario o contraseña no coinciden con ningún registro del sistema.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

 	<% 
 	 	}
 	 	
 	 	
 	 	
 	}


 	
 		  %>
 		
 		





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>