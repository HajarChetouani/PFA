<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Sprints</title>
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

<script src="app/chart.js"></script>
<script src="app/App.js"></script>

<script type="text/javascript">
function confirmation(id) {
	var conf = confirm("Etes vous sûr de vouloir supprimer ce sprint ?");
	if (conf==true){
		document.location="SprintServlet?action=supprimer&id="+id;		
	}
}
</script>
</head>
<body ng-app="myApp" ng-controller="Ctrl1">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">PlainKPI</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="Home.jsp">Home</a></li>
      <li ><a href="Projects.jsp">Mes Projets</a></li>
     <li class="active"><a href="Sprint.jsp">Mes Sprints</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<!-- ***** -->
	<div class="col-lg-12">
		<div class="row">
			<div class="well"><strong><h2>La listes des Sprints</h2></strong> </div>
		</div>
	</div>
	<form ng-submit="addRow()"  method="post" > <!-- action="controleur.php" pour l'insertion à la base de données -->
		<div class="col-lg-5" >
			<div class="row">
					<div class="well">
					<strong><h3>Ajouter un sprint réel</h3></strong><br>
						<strong><h4>Nombre de jours</h4></strong>
						<input type="number" ng-model="nj" class="form-control" name="duree" required>
						
						<strong><h4>Nombre de Personne</h4></strong>
						<input type="number" ng-model="np" class="form-control" name="nbrPer" required>
						
						<strong><h4>Nombre de point</h4></strong>
						<input type="number" ng-model="ndp" class="form-control" name="nbrPo" required>
						
						<strong><h4>Anomalie</h4></strong>
            			<input type="number" ng-model="an" class="form-control" name="nbrAno" required> 

						<strong><h3>Charge:</h3></strong>
						<p ng-model="charge">{{nj * np| number:3}}</p><br>
						<input type="submit" name="" value="Générer les KPIs réels" class="btn btn-success btn-lg right">

					</div>
				</div>
			</div>
		</form>
		<div class="col-md-1"></div>
		<form ng-submit="addRowE()"  method="post">
		<div class="col-lg-6">
			<div class="row">
					<div class="well">
					<strong><h3>Ajouter un sprint prévisionnel</h3></strong><br>
						<input type="hidden" name="id" ng-model="id">
						<strong><h4>Nombre de jours</h4></strong>
						<input type="number" ng-model="nje" class="form-control" required>
						
						<strong><h4>Nombre de Personne</h4></strong>
						<input type="number" ng-model="npe" class="form-control" required>
						
						<strong><h4>Nombre de point</h4></strong>
						<input type="number" ng-model="ndpe" class="form-control" required>
						
						<strong><h4>Anomalie</h4></strong>
            			<input type="number" ng-model="ane" class="form-control" required> 

						<strong><h3>Charge:</h3></strong>
						<p ng-model="charge">{{nje * npe| number:3}}</p><br>
						<input type="submit" name="" value="Générer les KPIs estimés" class="btn btn-success btn-lg right">

					</div>
				</div>
			</div>
		</form>

			<div class="row">
				<div class="col-lg-12">
					<div class="well">
					<strong><h3>Plan de charge réelle</h3></strong><br>
						<table class="table table-striped">
							<tr>
								<th>Sprint</th>
								<th>Nombre De Jours</th>
								<th>Nombre De Personne</th>
								<th>Nombre De Point</th>
								<th>Nombre d'Anomalies</th>
								<th ng-click="add()">Vélocité</th>
								<th ng-click="add()">Dette technique</th>
							</tr>
							<tr ng-repeat="e in items">
								<td>Sprint{{$index + 1 }}</td>
								<td>{{e.nj}}</td>
								<td>{{e.np}}</td>
								<td>{{e.ndp}}</td>
								<td>{{e.an}}</td>
								<td>{{e.ndp/(e.nj * e.np) | number:3}}</td>
								<td>{{(e.nj * e.np)/e.an | number:3}}</td> 
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<div class="row">
				<div class="col-lg-12">
					<div class="well">
					<strong><h3>Plan de charge prévisionnelle</h3></strong><br>
						<table class="table table-striped">
							<tr>
								<th>Sprint</th>
								<th>Nombre De Jours</th>
								<th>Nombre De Personne</th>
								<th>Nombre De Point</th>
								<th>Nombre d'Anomalies</th>
								<th ng-click="add()">Vélocité</th>
								<th ng-click="add()">Dette technique</th>
							</tr>

							<tr ng-repeat="ee in itemsE">
								<td>Sprint{{$index + 1 }}</td>
								<td>{{ee.nje}}</td>
								<td>{{ee.npe}}</td>
								<td>{{ee.ndpe}}</td>
								<td>{{ee.ane}}</td>
								<td>{{ee.ndpe/(ee.nje * ee.npe) | number:3}}</td>
								<td>{{(ee.nje * ee.npe)/ee.ane | number:3}}</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="well">
						<chart title="La mesure de la vélocité" xData="lineChartXData"
							yData="lineChartYData" xName="Date" yName="velocity"
							subtitle="Line chart For Velocity"> </chart>
					</div>
					</div>
				<div class="col-sm-6">
					<div class="well">
						<chart title="La mesure de la dette technique" xData="lineChartXData1"
							yData="lineChartYData1" xName="Date" yName="Story Points"
							subtitle="Line chart For Anomaly"> </chart>
					</div>
				</div>
</body>
</html>