<%--
  Created by IntelliJ IDEA.
  User: sbhandari
  Date: 8/22/2019
  Time: 1:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="_weatherapp"></meta>
    <title></title>
</head>

<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Weather+</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <sec:ifLoggedIn>
                <li class="nav-item active">
                    <a class="nav-link" href="form">Home <span class="sr-only">(current)</span></a>
                </li>
            </sec:ifLoggedIn>

            <li class="nav-item">
                <a class="nav-link" href="#">Documentation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Careers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Manage Users</a>
            </li>
        </ul>
        <sec:ifLoggedIn>
            <asset:image src="SanatConfluence.jpg" width="42" height="42" style="border-radius: 50%"></asset:image>
        </sec:ifLoggedIn>
    </div>
</nav>

<section style="margin-top: 150px">
    <div class="card container">
%{--        <h2 class="lead align-content-md-start">User Account</h2>--}%
        <div class="card-header">Welcome, Nat (User Account)</div><br>
        <table id="table_id" class="display">
            <thead>
            <tr>
                <th>City</th>
                <th>Country</th>
                <th>Temperature</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>London</td>
                <td>UK</td>
                <td>29°C</td>
            </tr>
            <tr>
                <td>Miami</td>
                <td>US</td>
                <td>28°C</td>
            </tr>
            <tr>
                <td>Prague</td>
                <td>CZ</td>
                <td>19°C</td>
            </tr>
            </tbody>
        </table><br>
    </div><br>
</section>

<section>

</section>

<section>
    <div class="container form-group">
        <g:form controller="ResponseJSON" action="getWeatherByCityAndCountry">
            <div class="center">
                <h3 class="lead">Make another search</h3>
                <p>HELLO</p>

            </div>
            <div class="input-group mb-3">
                <g:field type="text" name="cityName" class="typeahead form-control" id="city" aria-describedby="emailHelp" placeholder="${message(default: 'Enter the name of the city', code: 'message.entercityname')}" required="required" autocomplete="off"/><br>
                <g:select class="btn btn-outline-secondary dropdown-toggle" name="user.unit" optionValue="${unit}" from="['°C', '°F', 'K']" noSelection="['':'Units']" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"/>
            </div>
            <g:actionSubmit code="default.getWeather" value="${message(default: 'Get the Weather', code: 'message.getweather')}" action="getWeatherByCityAndCountry" class="btn btn-default btn-primary" style="margin-left: 430px"/>
        </g:form>
    </div>
</section>

<g:javascript>
    var citiesFromGSP = [
        <g:each in="${sstutorial.City.list(max: 100)}" var="u">
    '${u.name}, ${u.country}',
</g:each>0
        ]
</g:javascript>

<footer class="fixed-bottom navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="main-inner align-content-center" style="align-content: center">
        <a class="navbar-custom navbar-brand" href="#" style="text-align: center">© Copyright</a>
    </div>

</footer>


</body>
</html>