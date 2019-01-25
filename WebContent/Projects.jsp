<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Projets</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular-animate.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function confirmation(id) {
	var conf = confirm("Etes-vous sûr de vouloir supprimer ce projet ?");
	if (conf==true){
		document.location="ProjectServlet?action=supp&id="+id;		
	}
}
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">PlainKPI</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="Home.jsp">Home</a></li>
      <li class="active"><a href="Projects.jsp">Mes Projets</a></li>
      <li ><a href="Sprint.jsp">Mes Sprints</a></li>
        
      <li><a href="graphe.jsp"></a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
	<form method="POST" action="ProjectServlet">

		
		<div class="col-lg-12">
			<div class="well">
				<h3>Liste de mes projets :</h3>

			</div>
		</div>
		<div class="col-lg-12">
			<div class="well">
				<table class="table table-striped">

					<tr>

						<th>Nom du Projet</th>
						<th>Description</th>
					</tr>
					<p:forEach items="${Projets}" var="p">
						<tr>

							<td onclick="document.location='Sprint.jsp'" style="cursor:pointer">${p.nom}</td>
							<td>${p.description}</td>
							<td><a href="javascript:confirmation('${p.projetID}')" class="btn btn-danger">
									Delete </a></td>
							<td><a href="ProjectServlet?action=edit&id=${p.projetID}" class="btn btn-info">
									Edit </a></td>
						</tr>
					</p:forEach>
				</table>

			</div>
		</div>
		
		
		<div class="col-lg-12">
			<div class="well">
				<h3 style="display: none;">
					ID : ${projet.projetID} <input type="hidden" name="projetID"
						value="${projet.projetID}">
				</h3>
				<h3>
					Nom du projet</h3> <br> <input type="text" name="nom" value="${projet.nom}" class="form-control input-lg">
				
				<h3>
					Description </h3><br> <input type="text" name="description"
						value="${projet.description}" class="form-control input-lg"><br>
				


				<p:if test="${projet==null}">
					<input class="btn btn-info" type="submit" name="action" value="save">
				</p:if>
				<p:if test="${projet!=null}">
					<input class="btn btn-info" type="submit" name="action" value="Update">
				</p:if>

			</div>
		</div>
		
	</form>
</body>
</html>