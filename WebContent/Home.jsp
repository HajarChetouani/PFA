<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="css/form.css" />
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">PlainKPI</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home.jsp">Home</a></li>
      <li><a href="Projects.jsp">Mes Projets</a></li>
      <li><a href="Sprint.jsp">Mes Sprints</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="Home.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<form method="post" action="LoginServlet">
		<div class="form-style-8">

			<h2>Authentification</h2>
			Veuillez s'authentifier pour utiliser PlainKPI <br /> <br />
			<div style="margin-top: 20px;">
				<h3>Nom d'utilisateur :</h3>
				<input name="userId" class="form-login" type="text" title="Username"
					value="" size="30" maxlength="50">
			</div>

			<br /> <br />
			<div>
				<h3>Mot de passe :</h3>
				<input name="password" type="password" class="form-login"
					title="Password" value="" size="30" maxlength="48">
			</div>

			<br /> <input style="margin-left: 100px;" type="submit"
				value="Login" />

			<script type="text/javascript">
									//auto expand textarea
									function adjust_textarea(h) {
										h.style.height = "20px";
										h.style.height = (h.scrollHeight)
												+ "px";
									}
								</script>


		</div>

	</form>
</body>
</html>