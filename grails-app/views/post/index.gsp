<%--
  Created by IntelliJ IDEA.
  User: sbhandari
  Date: 6/28/2019
  Time: 3:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="_weatherappminussignin"/>
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
    <section style="margin-top: 100px">
        <s2ui:form type="login" focus="username" style="align-content: center">
            <div class="card container">
                <div class="card-header">
                    <g:message default="Sign In" code="message.signin"/>
                </div>
                <div class="card-body">
                    <div class=form-group">
                        <label for="username"><g:message default='Username' code="message.username"/></label><br>
                        <input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class="form-control" required/><br>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message default='Password' code="message.password"/></label><br>
                        <input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class='form-control'/><br>
                    </div>

                    <div class="form-group">
                        <input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked" class="form-control" required/>
                        <label for='remember_me'><g:message default='Remember Me' code="message.rememberme"/></label> |
                        <span class="forgot-link">
                            <g:link controller='register' action='forgotPassword'><g:message default='Forgot Password' code="message.forgotpassword"/></g:link>
                        </span><br>
                    </div>

                    <div class="form-group">
                        <g:submitButton name="Log In" class="btn btn-primary btn-default"/>
                    </div>
                </div>
            </div>
        </s2ui:form>

        <g:link controller="register" action="registerNewUser" style="margin-left: 10px"><g:message default="Not a member? Register here" code="message.member"/></g:link>
    </section>

%{--<sec:ifLoggedIn>--}%
%{--    <script>--}%
%{--        window.location = "/post/userDashboard"--}%
%{--    </script>--}%
%{--</sec:ifLoggedIn>--}%

</body>
</html>