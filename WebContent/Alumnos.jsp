<%@page import="AccesoDatos.PersonaDao" %>
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
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">


<title>Alumnos</title>
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

<input type="hidden" id= "AlumnoSeleccionado" name="AlumnoSeleccionado" onChange="pruebaFc()">
<input type="hidden" id= "DNISeleccionado" name="DNISeleccionado">
<input type="hidden" id= "ApNomSeleccionado" name="ApNomSeleccionado">
<input type="hidden" id= "DireccionSeleccionado" name="DireccionSeleccionado">
<input type="hidden" id= "LocalidadSeleccionado" name="LocalidadSeleccionado">
<input type="hidden" id= "ProvinciaSeleccionada" name="ProvinciaSeleccionada" >
<input type="hidden" id= "MailSeleccionado" name="MailSeleccionado">
<input type="hidden" id= "TelSeleccionado" name="TelSeleccionado">

<table id="TablaAlum" class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">DNI</th>      
      <th scope="col">Apellido y nombre</th>
      <th scope="col">Dirección</th>
      <th scope="col">Localidad</th>
      <th scope="col">Provincia</th>
      <th scope="col">Mail</th>
      <th scope="col">Teléfono</th>

    </tr>
  </thead>
  <tbody>
<%
PersonaDao persD = new PersonaDao();
ArrayList<Persona> listP = new ArrayList<Persona>();
listP = persD.obtenerTodos("'Alumno'");

if (listP != null)
{
for (Persona pers : listP) 
{
	%>
<tr> 
<td><%=pers.getLegajo() %> </td>
<td> <%= pers.getDNI() %> </td>
<td><%= pers.getApellidoNombre() %></td>
<td><%= pers.getDireccion() %> </td>
<td><%= pers.getLocalidad() %> </td>
<td><%= pers.getProvincia() %></td>
<td><%= pers.getMail() %> </td>
<td><%= pers.getTelefono() %> </td>
</tr>
<%
}
}
%>
  </tbody>

</table>
 <form method= "post" action="ServletAlumno">
</br>



</br>




<!-- Modal Nuevo -->
<div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog" aria-labelledby="modalLabelNuevo" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabelNuevo">Alta alumno</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      <%
      PersonaDao per = new PersonaDao();
      %>
      <%= per.proximoLegajo() %> 
      <%
      ;
      %>
</br>
</br>
<div style="float:left">DNI: </div> <div style="width:300px;float:right"><input type="text" id="txtDNIN" maxlength="8" name="txtDNIN" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/> </div>
</br>
</br>
<div style="float:left">Apellido y nombre: </div> <div style="width:300px;float:right"><input type="text" id="txtApNomN" name="txtApNomN" /> </div>
</br>
</br>
<div style="float:left">Dirección: </div> <div style="width:300px;float:right"><input type="text" id="txtDireccionN" name="txtDireccionN" /> </div>
</br>
</br>
<div style="float:left">Provincia: </div> <div style="width:300px;float:right"><select name="cbxProvinciaN" id="cbxProvinciaN" onChange="jsFunction()" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	<%
		 	 		 							   
		 	 		 	 	 		 			   ArrayList<Provincia> prov = per.obtenerProvincias();
								 		 	
		 	 		 	 	 		 			   for (Provincia p : prov)
		 	 		 	 	 		 			   {
							 	 		 			%><option value="<%=p.getID()%>" onclick="jsFunction()" selected="selected"> <%=p.getNombre()%> </option>
											   		<%
		 	 		 	 	 		 			   }
											   		%>
											   		
</select> </div>
</br>
</br>
<div style="float:left">Localidad: </div> <div style="width:300px;float:right"><select name="cbxLocalidadN" id="cbxLocalidadN" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	

								 		 		<%
								 		 			//int provSelec = 1;
		 	 		 							   //if ( request.getParameter("provS")!= null)
		 	 		 							   //{
		 	 		 								
		 	 		 								//provSelec = (int) request.getAttribute("provS");
		 	 		 								//ArrayList<Localidad> loc = per.obtenerLocalidades(provSelec);
		 	 		 								ArrayList<Localidad> loc = per.obtenerLocalidades();
			 	 		 	 	 		 			   
		 	 		 								for (Localidad l : loc)
			 	 		 	 	 		 			   {
								 	 		 			%><option value="<%=l.getID()%>"> <%=l.getNombre()%> </option>
												   		<%
			 	 		 	 	 		 			   }
												   				 	 		 								   
		 	 		 							   //}
		 	 		 							    %>

</select> </div>
</br>
</br>
<div style="float:left">Mail: </div> <div style="width:300px;float:right"><input type="text" name="txtMailN" id="txtMailN"/> </div>
</br>
</br>
<div style="float:left">Teléfono: </div> <div style="width:300px;float:right"><input type="text" name="txtTelN" id="txtTelN" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/> </div>
</br>
</br>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	 <input type="submit" class="btn btn-info" name="btnGuardarN" id="btnGuardarN" value="Guardar" disabled/>
      </div>
    </div>
  </div>
</div>

</form>

 <form method= "post" action="ServletAlumno">

<!-- Modal Modificación-->
<div class="modal fade" id="modalModif" tabindex="-1" role="dialog" aria-labelledby="modalLabelModif" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabelModif">Modificar alumno</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
        
<div style="float:left">Legajo: </div> <div style="width:300px;float:right"><input type="text" id="txtLegM" name="txtLegM" readonly/> </div> 
</br>
</br>
<div style="float:left">DNI: </div> <div style="width:300px;float:right"><input type="text" maxlength="8" id="txtDNIM" name="txtDNIM" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/> </div>
</br>
</br>
<div style="float:left">Apellido y nombre: </div> <div style="width:300px;float:right"><input type="text" id="txtApNomM" name="txtApNomM" /> </div>
</br>
</br>
<div style="float:left">Dirección: </div> <div style="width:300px;float:right"><input type="text" id="txtDireccionM" name="txtDireccionM" /> </div>
</br>
</br>

<div style="float:left">Provincia: </div> <div style="width:300px;float:right"><select name="cbxProvinciaM" id="cbxProvinciaM" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	<%
		 	 		 							   
		 	 		 	 	 		 			   ArrayList<Provincia> provi = per.obtenerProvincias();
								 		 	
		 	 		 	 	 		 			   for (Provincia p : provi)
		 	 		 	 	 		 			   {
							 	 		 			%><option value="<%=p.getID()%>"> <%=p.getNombre()%> </option>
											   		<%
		 	 		 	 	 		 			   }
											   		%>
											   		
</select> </div>
</br>
</br>
<div style="float:left">Localidad: </div> <div style="width:300px;float:right"><select name="cbxLocalidadM" id="cbxLocalidadM" style="width: 210px !important; min-width: 210px; max-width: 210px;">
								 		 	

								 		 		<%
		 	 		 							   //if (request.getParameter("cbxProvinciaN")!= null && request.getParameter("cbxProvinciaM")!= "")
		 	 		 							   //{
		 	 		 								
		 	 		 								//ArrayList<Localidad> loc = (ArrayList<Localidad>) request.getAttribute("lista");
		 	 		 								ArrayList<Localidad> loca = per.obtenerLocalidades();
			 	 		 	 	 		 			   for (Localidad l : loca)
			 	 		 	 	 		 			   {
								 	 		 			%><option value="<%=l.getID()%>"> <%=l.getNombre()%> </option>
												   		<%
			 	 		 	 	 		 			   }
												   				 	 		 								   
		 	 		 							   //}
		 	 		 							    %>

</select> </div>
</br>
</br>
<div style="float:left">Mail: </div> <div style="width:300px;float:right"><input type="text" id="txtMailM" name="txtMailM" /> </div>
</br>
</br>
<div style="float:left">Teléfono: </div> <div style="width:300px;float:right"><input type="text" id="txtTelM" name="txtTelM" onkeypress='return event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)'/> </div>
</br>
</br>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	 <input type="submit" class="btn btn-info" name="btnGuardarM" id="btnGuardarM" value="Guardar" disabled />
      </div>
    </div>
  </div>
</div>

</form>

<form method= "post" action="ServletAlumno">

<!-- Modal Borrar-->
<div class="modal fade" id="modalBorrar" tabindex="-1" role="dialog" aria-labelledby="modalLabelBorrar" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabelBorrar">Borrar alumno</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
        
<div style="float:left">¿Está seguro que desea borrar el registro seleccionado?</div> <div style="width:300px;float:right"></div> 
<input type="hidden" id= "txtLegB" name="txtLegB">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	 <input type="submit" class="btn btn-info" name="btnAceptarB" id="btnAceptarB" value="Borrar"/>
      </div>
    </div>
  </div>
</div>

</form>

<button type="button" class="btn btn-info" name="btnAlta" id="btnAlta" data-toggle="modal" data-target="#modalNuevo">
 Alta
</button>
<button type="button" class="btn btn-info" name="btnModificar" id="btnModificar" data-toggle="modal" data-target="#modalModif" disabled>
 Mofidicar
</button>
<button type="button" class="btn btn-info" name="btnBorrar" id="btnBorrar" data-toggle="modal" data-target="#modalBorrar" disabled>
 Borrar
</button>

<%
	if (request.getAttribute("resultadoM") != null)
{	
		boolean carga = (boolean) request.getAttribute("resultadoM");

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
	 	 	        Modificación realizada exitosamente.
	 	 	      </div>
	 	 	      <div class="modal-footer">
	 	 	        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Cerrar</button>
	 	 	      </div>
	 	 	    </div>
	 	 	  </div>
	 	 	</div>
	 	 	 	
	 	 	 	
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
	 	 	        Error en la modificación del registro.
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



if (request.getAttribute("resultado") != null)
{	
	boolean carga = (boolean) request.getAttribute("resultado");

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
	
	 	else
	 	{
	 		%>

<body onLoad="$('#modalIncorrectoN').modal('show');">

<div class="modal fade" id="modalIncorrectoN" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalCenterTitle">Error</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
      Error en la carga, ya hay un registro con ese DNI.
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
    

    

    
    $('#TablaAlum tbody').on( 'click', 'tr', function () {
    	
    	if ( $(this).hasClass('selected') ) {
           // $(this).removeClass('selected');

        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');

        }

        //$(this).toggleClass('selected');
				
              $("#AlumnoSeleccionado").val(table.rows(['.selected']).data().pluck(0).toArray());
                     var value = $("#AlumnoSeleccionado").val();
                     if(value > 0){
                    	 $('#btnModificar').removeAttr('disabled');
                    	 $('#btnBorrar').removeAttr('disabled');
                     }
              
              $("#DNISeleccionado").val(table.rows(['.selected']).data().pluck(1).toArray());
              $("#ApNomSeleccionado").val(table.rows(['.selected']).data().pluck(2).toArray());
              $("#DireccionSeleccionado").val(table.rows(['.selected']).data().pluck(3).toArray());
              $("#LocalidadSeleccionado").val(table.rows(['.selected']).data().pluck(4).toArray());              
              $("#ProvinciaSeleccionada").val(table.rows(['.selected']).data().pluck(5).toArray());       
              $("#MailSeleccionado").val(table.rows(['.selected']).data().pluck(6).toArray());   
              $("#TelSeleccionado").val(table.rows(['.selected']).data().pluck(7).toArray());   
       
    } );
   
    



    
    var table = $('#TablaAlum').DataTable();
    
    

    
    function jsFunction(){
    	

    	  var myselect = document.getElementById("cbxProvinciaN");
    	  var provSelecN = myselect.options[myselect.selectedIndex].value;
    	  $.post("ServletAlumno" ,{"provSelecN": provSelecN}, function(responseJson) {

          });
    	}
    
  
    $( "#modalNuevo" ).on('shown.bs.modal', function(){
  	  var myselect = document.getElementById("cbxProvinciaN");
	  var provSelecN = myselect.options[myselect.selectedIndex].value;
        
        $.post("ServletAlumno" ,{"provSelecN": provSelecN}, function(responseJson) {

        });
        
    });
    
    $( "#modalBorrar" ).on('shown.bs.modal', function(){
        var legajo = $("#AlumnoSeleccionado").val();

            $("#txtLegB").val(legajo);
            $("#AlumnoSeleccionado").val(null);



       // });
        
    });




    $( "#modalModif" ).on('shown.bs.modal', function(){
        var legajo = $("#AlumnoSeleccionado").val();
        var dni = $("#DNISeleccionado").val();
        var apnom = $("#ApNomSeleccionado").val();
        var direc = $("#DireccionSeleccionado").val();
        var local = $("#LocalidadSeleccionado").val();
        var prov = $("#ProvinciaSeleccionada").val();  
        var mail = $("#MailSeleccionado").val();
        var tel = $("#TelSeleccionado").val();
        
        //$.post("ServletAlumno" ,{"legajo": legajo}, function(responseJson) {
            $("#txtLegM").val(legajo);
            $("#txtDNIM").val(dni);
            $("#txtApNomM").val(apnom);
            $("#txtDireccionM").val(direc);
            $("#cbxLocalidadM").val(local);
            $("#cbxProvinciaM").val(prov);
            $("#txtMailM").val(mail);
            $("#txtTelM").val(tel);



       // });
        
    });
    
    $(document).ready(function (){
        validate();
        $("#txtDNIN").change(validate);
        $("#txtApNomN").change(validate);
        $("#txtDireccionN").change(validate);
        $("#cbxLocalidadN").change(validate);
        $("#cbxProvinciaN").change(validate);
        $("#txtMailN").change(validate);    
        $('#txtTelN').change(validate);
        $("#txtDNIM").change(validate);
        $("#txtApNomM").change(validate);
        $("#txtDireccionM").change(validate);
        $("#cbxLocalidadM").change(validate);
        $("#cbxProvinciaM").change(validate);
        $("#txtMailM").change(validate);    
        $('#txtTelM').change(validate);
        
    });

    function validate(){
        if ($('#txtDNIN').val().length   >   0 &&
        		$('#txtApNomN').val().length   >   0 &&
        		$('#txtDireccionN').val().length   >   0 &&
        		$('#cbxLocalidadN').val().length   >   0 &&
        		$('#cbxProvinciaN').val().length   >   0 &&
        		$('#txtMailN').val().length   >   0 &&
        		$('#txtTelN').val().length   >   0 
                 
        ) {
            $('#btnGuardarN').prop("disabled", false);
        }
        else {
            $('#btnGuardarN').prop("disabled", true);
        }
        
        if ($('#txtDNIM').val().length   >   0 &&
        		$('#txtApNomM').val().length   >   0 &&
        		$('#txtDireccionM').val().length   >   0 &&
        		$('#cbxLocalidadM').val().length   >   0 &&
        		$('#cbxProvinciaM').val().length   >   0 &&
        		$('#txtMailM').val().length   >   0 &&
        		$('#txtTelM').val().length   >   0 
                 
        ) {
            $('#btnGuardarM').prop("disabled", false);
        }
        else {
            $('#btnGuardarM').prop("disabled", true);
        }
        
        
        
    }



    
    
    
</script>

</html>