<html>
<head>
	<meta name="layout" content="_weatherappminussignin"/>
	<s2ui:title messageCode='spring.security.ui.forgotPassword.title'/>
</head>
<body>
<section class="container" style="margin-top: 100px">
	<g:form controller="register" action="resetPassword">
		<div class="card container">
			<div class="card-header">
				<h5>Don't worry! We'll help you reset it</h5>
			</div>
			<div class="card-body text-center">

				<div class="form-group">
					<label for="email">Please enter your email address</label>
					<input type="email" id="email" class="form-control" name="email" required />
				</div>
			</div>
			<g:submitButton name="Reset Password" action="resetPassword" class="btn btn-primary btn-default"/><br>
		</div>
	</g:form>
</section>
</body>
</html>
