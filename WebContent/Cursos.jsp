<%@page import="AccesoDatos.PersonaDao" %>
<%@page import="AccesoDatos.IngresoDao" %>
<%@page import="AccesoDatos.CursoDao" %>
<%@page import="Dominio.Curso" %>
<%@page import="Dominio.Persona" %>
<%@page import="Dominio.Persona" %>
<%@page import="Dominio.Materia" %>
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


<title>Cursos</title>
<style type="text/css">
.selected {
	background-color: #5aaaff;
	color: white;
}
</style>
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




<table id="TablaCurso" class="table table-hover table-dark">
  <thead>
    <tr>
    <th scope="col">ID</th>
      <th scope="col">Materia</th>
      <th scope="col">Semestre</th>
      <th scope="col">Año</th>
      <th scope="col">Docente</th>

    </tr>
  </thead>
  <tbody>
<%
CursoDao curD = new CursoDao();
ArrayList<Curso> listC = new ArrayList<Curso>();
listC = curD.obtenerTodos();

if (listC != null)
{
for (Curso cur : listC) 
{
	%>
<tr> 
<td><%=  cur.getID() %> </td>
<td><%=  curD.obtenerMateria(cur.getIDmateria()) %> </td>
<td> <%= cur.getSemestre() %> </td>
<td><%= cur.getAnio() %></td>
<td><%= cur.getLegDocente()+ " - "+ curD.obtenerProf(cur.getLegDocente()) %> </td>
</tr>
<%
}
}
%>
  </tbody>
</table>
</br>



 <form method= "post" action="ServletCurso">

<!-- Modal -->
<div class="modal fade" id="modalAlta" tabindex="-1" role="dialog" aria-labelledby="modalLabelAlta" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabelAlta">Alta curso</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        

<div style="float:left">Materia: </div> <div style="width:300px;float:right"><select name="cbxMateria" id="cbxMateria" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	<%
		 	 		 							   
								 		 			ArrayList<Materia> mat = curD.obtenerMaterias();
		 	 		 	 	 		 			  
								 		 	
		 	 		 	 	 		 			   for (Materia m : mat)
		 	 		 	 	 		 			   {
							 	 		 			%><option value="<%=m.getID()%>"> <%=m.getNombre()%> </option>
											   		<%
		 	 		 	 	 		 			   }
											   		%>
											   		
</select> </div>
</br>
</br>
<div style="float:left">Semestre: </div> <div style="width:300px;float:right"><select name="cbxSemestre" id="cbxSemestre" style="width: 210px !important; min-width: 210px; max-width: 210px;">
<option value="1">1º</option>
<option value="2">2º</option>
</select> </div>
</br>
</br>
<div style="float:left">Año: </div> <div style="width:300px;float:right"><input type="text" name="txtAnio" id="txtAnio"/> </div>
</br>
</br>
<div style="float:left">Docente: </div> <div style="width:300px;float:right"><select name="cbxDocente" id="cbxDocente" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	<%
		 	 		 							   
								 		 		PersonaDao pDao = new PersonaDao();	
								 		 		ArrayList<Persona> per = pDao.obtenerTodos("'Profesor'");
		 	 		 	 	 		 			  
								 		 	
		 	 		 	 	 		 			   for (Persona p : per)
		 	 		 	 	 		 			   {
							 	 		 			%><option value="<%=p.getLegajo()%>"> <%= p.getLegajo() + " - " + p.getApellidoNombre() %> </option>
											   		<%
		 	 		 	 	 		 			   }
											   		%>
											   		
</select> </div>
</br>
</br>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <input type="submit" class="btn btn-info" name="btnGuardarAlta" id="btnGuardarAlta" value="Guardar"/>
      </div>
    </div>
  </div>
</div>
<input type="hidden" id= "CursoSeleccionado" name="CursoSeleccionado" onChange="pruebaFc()">
<input type="hidden" id= "ProfCurso" name="ProfCurso" onChange="pruebaFc()">
<input type="submit" class="btn btn-info" name="btnCargarAlumnos" id="btnCargarAlumnos" value="Cargar alumnos" disabled/>
<input type="submit" class="btn btn-info" name="btnCargarNotas" id="btnCargarNotas" value="Cargar notas" disabled/>


</form>
</br>
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAlta">
 Nuevo curso
</button>

	 	 	 	<% 



if (request.getAttribute("resultadoA") != null)
{	
	boolean carga = (boolean) request.getAttribute("resultadoA");

	if (carga)
		 	 	{
 	 	 	%>
 	 	 	
 	 	<body onLoad="$('#modalCorrecto').modal('show');">

 	 	<div class="modal fade" id="modalCorrecto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 	 	  <div class="modal-dialog modal-dialog-centered" role="document">
 	 	    <div class="modal-content">
 	 	      <div class="modal-header">
 	 	        <h5 class="modal-title" id="exampleModalCenterTitle">Éxito</h5>
 	 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
 	 	          <span aria-hidden="true">&times;</span>
 	 	        </button>
 	 	      </div>
 	 	      <div class="modal-body">
 	 	        Alta realizada exitosamente.
 	 	      </div>
 	 	      <div class="modal-footer">
 	 	        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Cerrar</button>
 	 	      </div>
 	 	    </div>
 	 	  </div>
 	 	</div>
 	 	 	
 	 	 	
 	 	 	<% 
		 	 	}
}
	 	 	 	if (request.getAttribute("resultadoACF") != null)
	 	 	 	{	
	 	 	 		boolean carga = (boolean) request.getAttribute("resultadoACF");

	 	 	 		if (carga)
	 	 	 			 	 	{
	 	 	 	 	 	 	%>
	 	 	 	 	 	 	
	 	 	 	 	 	<body onLoad="$('#modalCorrecto').modal('show');">

	 	 	 	 	 	<div class="modal fade" id="modalCorrecto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 	 	 	 	 	  <div class="modal-dialog modal-dialog-centered" role="document">
	 	 	 	 	 	    <div class="modal-content">
	 	 	 	 	 	      <div class="modal-header">
	 	 	 	 	 	        <h5 class="modal-title" id="exampleModalCenterTitle">Éxito</h5>
	 	 	 	 	 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	 	 	 	 	 	          <span aria-hidden="true">&times;</span>
	 	 	 	 	 	        </button>
	 	 	 	 	 	      </div>
	 	 	 	 	 	      <div class="modal-body">
	 	 	 	 	 	        La carga fue realizada con éxito.
	 	 	 	 	 	      </div>
	 	 	 	 	 	      <div class="modal-footer">
	 	 	 	 	 	        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Cerrar</button>
	 	 	 	 	 	      </div>
	 	 	 	 	 	    </div>
	 	 	 	 	 	  </div>
	 	 	 	 	 	</div>
	 	 	 	 	 	 	
	 	 	 	 	 	 	
	 	 	 	 	 	 	<% 
	 	 	 			 	 	}
	 	 	 	}
	 	 	 	 	 	 	%> 

</body>

    <script type="text/javascript">
    $('#TablaCurso').DataTable({
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
    
    $('#TablaCurso tbody').on( 'click', 'tr', function () {
    	
    	if ( $(this).hasClass('selected') ) {
           // $(this).removeClass('selected');

        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');

        }

        //$(this).toggleClass('selected');
				
              $("#CursoSeleccionado").val(table.rows(['.selected']).data().pluck(0).toArray());
              $("#ProfCurso").val(table.rows(['.selected']).data().pluck(4).toArray());
                     var value = $("#CursoSeleccionado").val();
                     if(value > 0){
                    	 $('#btnCargarAlumnos').removeAttr('disabled');
                    	 $('#btnCargarNotas').removeAttr('disabled');
                     }
 
       
    } );
    
    var table = $('#TablaCurso').DataTable();
    
    $(document).ready(function (){
        validate();
        $("#txtAnio").change(validate);
        $("#cbxDocente").change(validate);
        $("#cbxMateria").change(validate);
        $("#cbxSemestre").change(validate);


        
    });

    function validate(){
        if ($('#txtAnio').val().length   >   0 &&
        		$('#cbxDocente').val().length   >   0 &&
        		$('#cbxMateria').val().length   >   0 &&
        		$('#cbxSemestre').val().length   >   0
                 
        ) {
            $('#btnGuardarAlta').prop("disabled", false);
        }
        else {
            $('#btnGuardarAlta').prop("disabled", true);
        }     
        
    }
    

</script>
</html>