<%--
  Created by IntelliJ IDEA.
  User: sbhandari
  Date: 6/28/2019
  Time: 3:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="_weatherappwithoutfooter"/>
	<title></title>
	<s2ui:title messageCode='spring.security.ui.login.title'/>
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<asset:javascript src="jquery-3.3.1.min.js"></asset:javascript>
	<asset:javascript src="typeahead.bundle.js"></asset:javascript>
	<asset:stylesheet src="bootstrap.css"></asset:stylesheet>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<section style="margin-top: 100px" class="container">
	<g:form controller="register" action="stowItInDatabase">
		<div class="card container">
			<div class="card-header">
				Join our community!
			</div>
			<div class="card-body">
				<div class="form-group">
					<label for="firstName">First Name</label>
					<input type="text" id="firstName" class="form-control" name="firstName" required />
				</div>

				<div class="form-group">
					<label for="lastName">Last Name</label>
					<input type="text" id="lastName" class="form-control" name="lastName" required />
				</div>

				<div class="form-group">
					<label for="email">Email Address</label>
					<input type="email" id="email" class="form-control" name="email" required />
				</div>

				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" id="password" class="form-control" name="password" required />
				</div>

				<div class="form-group">
					<label for="passwordAgain">Please enter the password again</label>
					<input type="password" id="passwordAgain" class="form-control" name="passwordRepeat" required />
				</div>
			</div>
			<g:form controller="register" action="stowItInDatabase">
				<g:submitButton name="Register" action="stowItInDatabase" class="btn btn-primary btn-default"/>
			</g:form>
		</div>
	</g:form>
</section>
</body>
</html>