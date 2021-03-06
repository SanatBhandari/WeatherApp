<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<link>
%{--Refactor the views in the layouts. Done that but it still needs some fixing. Routing, apparently!--}%
    <meta name="layout" content="_weatherapp"/>
    <title></title>
    <asset:javascript src="jquery-3.3.1.min.js"></asset:javascript>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style src="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <asset:javascript src="dataTable.js"></asset:javascript>
</head>

<body>

%{--<g:if test="${org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream().any {r -> r.getAuthority().equals("ROLE_ADMIN")}}">--}%
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
                <g:link controller="logout" action="logout"><asset:image src="SanatConfluence.jpg" width="42" height="42" style="border-radius: 50%"></asset:image></g:link>
            </sec:ifLoggedIn>
        </div>
    </nav>

    <section style="margin-top: 150px">
        <div class="card container">
            <div class="card-header">Welcome, Nat (Admin Account)</div><br>
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
                <tr>
                    <td>Włocławek</td>
                    <td>PL</td>
                    <td>26°C</td>
                </tr>
                <tr>
                    <td>Tsiémé-Mandiélé</td>
                    <td>CG</td>
                    <td>33°C</td>
                </tr>
                <tr>
                    <td>Szigetszentmiklos</td>
                    <td>HU</td>
                    <td>23°C</td>
                </tr>
                <tr>
                    <td>Kraslava</td>
                    <td>LV</td>
                    <td>25°C</td>
                </tr>
                <tr>
                    <td>La Portanière</td>
                    <td>FR</td>
                    <td>28°C</td>
                </tr>
                <tr>
                    <td>Nizhniy Kuranakh</td>
                    <td>RU</td>
                    <td>15°C</td>
                </tr>
                <tr>
                    <td>Strasshof an der Nordbahn</td>
                    <td>AT</td>
                    <td>28°C</td>
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
        %{--    <g:form controller="logout" action="logout">--}%
        %{--        <g:actionSubmit value="${message(default: 'Logout')}" action="logout" class="btn btn-primary"/>--}%
        %{--    </g:form>--}%

    </footer>
%{--</g:if>--}%

%{--<g:if test="${org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream().any {r -> r.getAuthority().equals("ROLE_USER")}}">--}%
%{--    <g:link controller="post" action="RoleUserDashboard"/>--}%
%{--</g:if>--}%

</body>
</html>