<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Persona"%>
<%@page import="entidades.Categoria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personas</title>
<script type="text/javascript">
    	function submitForm(met) {
    		if(document.getElementById("box").checked){
    			document.getElementById("boxHidden").disabled=true;
    		}
    		window.history.pushState({}, document.title, "/" + "TP_JAVA_WEB" + "/" );
    		document.myForm.action=met;
        }
    </script>
</head>
<body>
<h1>Bienvenido <%=((Persona)session.getAttribute("user")).getNombre() %></h1>
<table>
		<tr>
   			<th>DNI</th>
  		    <th>Apellido</th>
  		    <th>Nombre</th>
 	    </tr>
		<%
			ArrayList<Persona>listaPers= (ArrayList<Persona>)request.getAttribute("listaPer");
			for(Persona p : listaPers){
		%>
		<tr>
			<td><%=p.getDni() %></td>
			<td><%=p.getApellido() %></td>
			<td><%=p.getNombre() %></td>
		</tr>
		<%
			}
		%>
		</table>		
	
<form class="form-ABMCPersona" id="myForm" name="myForm" action="" method="post">
        <h2 class="form-ABMCPersona-heading">ABMC de Personas</h2>
        <label for="inputUser" class="sr-only">User</label>
        <input name="user" id="inputUser" class="form-control" placeholder="User" autofocus="" type=""><br>
        <label for="inputPass" class="sr-only">Password</label>
        <input name="pass" id="inputPass" class="form-control" placeholder="Password" type="Password"><br>
        <label for="lblDni" class="sr-only">DNI</label>
        <input name="dni" id="txtDni" class="form-control" placeholder="DNI" required="" autofocus="" type=""><br>
        <label for="lblApellido" class="sr-only">Apellido</label>
        <input name="apellido" id="txtApellido" class="form-control" placeholder="Apellido" autofocus="" type=""><br>
        <label for="lblNombre" class="sr-only">Nombre</label>
        <input name="nombre" id="txtNombre" class="form-control" placeholder="Nombre" autofocus="" type=""><br>
        <input type="hidden" value="no" id="boxHidden" name=habilitado>
        <input type="checkbox" id="box" value="si" name="habilitado">Habilitado<br>
        <select name="categoria">
        	<%
        		ArrayList<Categoria>listaCat=(ArrayList<Categoria>)request.getAttribute("listaCat");
        		for(Categoria c : listaCat){
        	%>
        	<option value="<%=(Categoria)c%>"><%=c%></option>
        	<%
        		}
        	%>
        </select>
        <button class="btn btn-lg " onclick="javascript: submitForm('personas/buscar')">Buscar</button>
        <button class="btn btn-lg " onclick="javascript: submitForm('personas/insertar')">Insertar</button>
        <button class="btn btn-lg " onclick="javascript: submitForm('personas/eliminar')">Eliminar</button>
        <button class="btn btn-lg " onclick="javascript: submitForm('personas/modificar')">Modificar</button>
      </form>	
</body>
</html>