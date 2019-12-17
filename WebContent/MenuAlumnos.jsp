<%@page import="AccesoDatos.IngresoDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

<title>Inscriptos</title>

</head>
<body>




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
        <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Reportes</a>
      </li>
    </ul>

  </div>
            <p style="text-align:right; color:white"">
      <%
      IngresoDao ing = new IngresoDao();
      %>
      <%= ing.obtenerNombre() %> 
      <%
      ;
      %>
      
      </p>
</nav>
</br>



<table id="TablaAlumnos" class="table table-bordered table-dark">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">Apellido y nombre</th>
      <th scope="col">Parcial 1</th>
      <th scope="col">Parcial 2</th>
      <th scope="col">Recuperatorio 1</th>
      <th scope="col">Recuperatorio 2</th>
      <th scope="col">Promedio</th>
      <th scope="col">Estado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">21992</th>
      <td>Cassano Juan Cruz</td>
      <td><p style="text-align:center";><input type="text" name="parcialUno" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style="width: 30px;"/></p></td>
      <td><p style="text-align:center";><input type="text" name="parcialDos" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style="width: 30px;"/></p></td>
      <td><p style="text-align:center";><input type="text" name="recupUno" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style="width: 30px;"/></p></td>
      <td><p style="text-align:center";><input type="text" name="recupDos" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)' style="width: 30px;"/></p></td>
      <td><p style="text-align:center";>8</p></td>
      <td>
      <select class="custom-select" style="width: 150px;">
	  <option value="0" class="dropdown-item">Regular</option> 
	  <option value="1" class="dropdown-item">Libre</option> 
	  </select>
    </tr>
  </tbody>
</table>
</br>

<button type="button" class="btn btn-info">Guardar cambios</button>






</body>

    <script type="text/javascript">
    $('#TablaAlumnos').DataTable({
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