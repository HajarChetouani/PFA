<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<title>Error</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">PlainKPI</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home.jsp">Home</a></li>
      <li ><a href="Projects.jsp">Mes Projets</a></li>
      <li ><a href="Projects.jsp">Mes Sprints</a></li>
        
      <li><a href="graphe.jsp"></a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div class="col-lg-12"></div>
<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="well"><h1><strong>Nom d'utilisateur ou mot de passe incorrect</strong></h1><br>
		 <a href="Home.jsp" class="btn btn-danger">Réessayer</a>
		</div>
	</div>
	<div class="col-lg-4"></div>
</body>
</html>