<%@page import="AccesoDatos.IngresoDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

<title>Profesores</title>
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

<table id="TablaProf" class="table table-bordered table-dark">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">Apellido y nombre</th>
      <th scope="col">Dirección</th>
      <th scope="col">Localidad</th>
      <th scope="col">Provincia</th>
      <th scope="col">Mail</th>
      <th scope="col">Teléfono</th>

    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">21992</th>
      <td>José Gibs</td>
      <td>Av. Cazón 1590</td>
      <td>Pacheco</td>
      <td>Buenos Aires</td>
      <td>jgibs@utnfrgp.edu.ar</td>
      <td>45124425</td>

    </tr>
  </tbody>
</table>
</br>

<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal">
 Alta
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alta profesor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
Legajo: 1
</br>
</br>
<div style="float:left">Apellido y nombre: </div> <div style="width:300px;float:right"><input type="text" name="txtApNom" /> </div>
</br>
</br>
<div style="float:left">Dirección: </div> <div style="width:300px;float:right"><input type="text" name="txtDireccion" /> </div>
</br>
</br>
<div style="float:left">Localidad: </div> <div style="width:300px;float:right"><input type="text" name="txtLocalidad" /> </div>
</br>
</br>
<div style="float:left">Provincia: </div> <div style="width:300px;float:right"><input type="text" name="txtProvincia" /> </div>
</br>
</br>
<div style="float:left">Mail: </div> <div style="width:300px;float:right"><input type="text" name="txtMail" /> </div>
</br>
</br>
<div style="float:left">Teléfono: </div> <div style="width:300px;float:right"><input type="text" name="txtTel" /> </div>
</br>
</br>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-info">Guardar</button>
      </div>
    </div>
  </div>
</div>
<button type="button" class="btn btn-info">Modificar</button>
<button type="button" class="btn btn-info">Borrar</button>

</body>

    <script type="text/javascript">
    $('#TablaProf').DataTable({
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