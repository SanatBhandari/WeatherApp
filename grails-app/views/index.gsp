<%--
  Created by IntelliJ IDEA.
  User: sbhandari
  Date: 6/3/2019
  Time: 9:11 AM
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <asset:javascript src="jquery-3.3.1.min.js"></asset:javascript>
    <asset:javascript src="popper.min.js"></asset:javascript>
    <asset:javascript src="bootstrap.bundle.js"></asset:javascript>
    <asset:javascript src="typeaheadFromDatabase.js"></asset:javascript>
    <asset:javascript src="typeahead.bundle.js"></asset:javascript>
    <asset:stylesheet src="bootstrap.css"></asset:stylesheet>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<sec:ifLoggedIn>
    <script>
        window.location = "/post/form"
    </script>
</sec:ifLoggedIn>


    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Weather+</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
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
            </ul>
            <g:form controller="Post" action="index" class="form-inline my-2 my-lg-0 ml-auto py-0">
                <g:actionSubmit value="Sign In" action="index" class="nav-link btn btn-outline-primary my-2 my-sm-0"/>
            </g:form>
        </div>
    </nav>

    <section style="margin-top: 120px">
        <div class="container form-group">
            <g:form controller="ResponseJSON" action="getWeatherByCityAndCountry">
                <img src="https://i.ibb.co/yB7yp6m/Capture.png" style="margin-left: 300px"/>
                <div class="input-group mb-3">
                    <g:field type="text" name="cityName" class="typeahead form-control" style="margin-left: 260px" id="city" aria-describedby="emailHelp" placeholder="Enter the name of the city" required="required" autocomplete="off"/><br>
                    <div class="input-group-append dropdown" style="margin-left: 260px">
                        <g:select class="btn btn-outline-secondary dropdown-toggle" name="user.unit" optionValue="${unit}" from="['°C', '°F', 'K']" noSelection="['':'Units']" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"/>
                    </div>
                </div>
                <g:actionSubmit code="default.getWeather" value="Get the Weather" action="getWeatherByCityAndCountry" class="btn btn-default btn-primary" style="margin-left: 430px"/>
            </g:form>
        </div>
    </section>

    <g:javascript>
    var citiesFromGSP = [
        <g:each in="${sstutorial.City.list()}" var="u">
        '${u.name}, ${u.country}',
    </g:each>
        ]
    </g:javascript>

    <footer class="fixed-bottom navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="main-inner align-content-center" style="align-content: center">
            <a class="navbar-custom navbar-brand" href="#" style="text-align: center">© Copyright</a>
        </div>
    </footer>
</body>
</html>