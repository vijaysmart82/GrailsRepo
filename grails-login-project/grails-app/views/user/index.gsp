<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css">
			label{
				float:left;
				width:65px;
			}
		</style>
	</head>
	<body>
			${flash.message}
	
		<g:form action="login" style="padding-left:200px">
			<div style="width:220px">
				<label>Username:</label><input type="text" name="username"/>
				<label>Password:</label><input type="password" name="password"/>
				<label>&nbsp; </label><input type="submit" value="Login"/>
			</div>
		</g:form>
	</body>
</html>
