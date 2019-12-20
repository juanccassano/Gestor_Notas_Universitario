<%@page import="AccesoDatos.PersonaDao" %>
<%@page import="AccesoDatos.CursoDao" %>
<%@page import="AccesoDatos.IngresoDao" %>
<%@page import="Dominio.Persona" %>
<%@page import="Dominio.Provincia" %>
<%@page import="Dominio.Localidad" %>
<%@page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

<title>Inscriptos</title>
<style type="text/css">
.selected {
	background-color: #5aaaff;
	color: white;
}
</style>
</head>
<body>
      <%
      IngresoDao ing = new IngresoDao();
      if (ing.esAdmin())
{
%> 

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="./Inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">

      
        <a class="nav-link" href="./Alumnos.jsp">Alumnos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./Profesores.jsp">Profesores</a>
      </li>
            <li class="nav-item">
        <a class="nav-link" href="./Cursos.jsp">Cursos</a>
      </li>      
      <li class="nav-item">
        <a class="nav-link" href="./Reporte.jsp">Reportes</a>
      </li>
    </ul>

  </div>
            <p style="text-align:right; color:white"">

      <%= ing.obtenerNombre() %> 

      
      </p>
</nav>

<%
}
      else
      {
    	  
      
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="./Inicio.jsp">Inicio <span class="sr-only">(current)</span></a>
      </li>
                  <li class="nav-item">
        <a class="nav-link" href="./Cursos.jsp">Cursos</a>
      </li> 
      
    </ul>

  </div>
            <p style="text-align:right; color:white"">

      <%= ing.obtenerNombre() %> 

      
      </p>
</nav>
      
      
      
      <%
      }
      %>
</br>


<form method= "post" action="ServletCurso">
<table id="TablaAlum" class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">Apellido y nombre</th>
      <th scope="col">Parcial 1</th>
      <th scope="col">Parcial 2</th>
      <th scope="col">Recuperatorio 1</th>
      <th scope="col">Recuperatorio 2</th>
      <th scope="col">Estado</th>
    </tr>
  </thead>
  <tbody>
    
            		<%
			String listadoAlumnos = null;
			if(request.getAttribute("tablaAlumnosCurso")!=null)
			{
				listadoAlumnos = (String)request.getAttribute("tablaAlumnosCurso");
			}		
				%>
		        <%=listadoAlumnos %>
    
 
 
  </tbody>
</table>


<!-- Modal Cargar-->
<div class="modal fade" id="modalCargar" tabindex="-1" role="dialog" aria-labelledby="modalLabelCargar" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabelCargar">Cargar notas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
        
<div style="float:left">�Est� seguro que desea guardar los cambios en las notas?</div> <div style="width:300px;float:right"></div> 


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	 <input type="submit" class="btn btn-info" name="btnAceptarCN" id="btnAceptarCN" value="Cargar"/>
      </div>
    </div>
  </div>
</div>

<input type="hidden" id= "AlumnosSeleccionados" name="AlumnosSeleccionados" onChange="pruebaFc()">


</form>
	 	
<button type="button" class="btn btn-info" name="btnCargarNotas" id="btnCargarNotas" data-toggle="modal" data-target="#modalCargar">
Cargar notas
</button>	






</body>

    <script type="text/javascript">
    $('#TablaAlum').DataTable({
		"ordering":false,
		"bInfo": false,
		"lengthChange": false,
		"dom":'frtip',
		"oLanguage": {
			   "sSearch": "Buscar:",
			 },
	 	"language": {
			   "zeroRecords": "No hay registros para mostrar.",
				"paginate": {
				       "next": "Siguiente",
					   "previous": "Anterior"
				},
	 	}
	});
</script>

</html>