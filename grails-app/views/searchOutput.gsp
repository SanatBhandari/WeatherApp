<%--
  Created by IntelliJ IDEA.
  User: sbhandari
  Date: 6/6/2019
  Time: 2:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="_weatherapp">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<body>

<section style="margin-top: 100px">
    <div class="container">
        <div class="card"></div>
        <div class="card text-center w-auto" style="width: 100px; align-content: center">
            <h3 class="card-header">Weather+</h3>
            <div class="card-body">
                <g:if test="${attribute}">
                    <h2><b>${attribute['name']}</b></h2><br>
                    <g:if test="${unit == '°C'}">
                        <h3>${(Integer) Math.ceil( (Double) attribute['main']['temp'])} °C</h3><br>
                    </g:if>

                    <g:if test="${unit == '°F'}">
                        <h3>${(Integer) Math.ceil( (Double) attribute['main']['temp'])} °F</h3><br>
                    </g:if>

                    <g:if test="${unit == 'K'}">
                        <h3>${(Integer) Math.ceil( (Double) attribute['main']['temp'])} K</h3><br>
                    </g:if>

                    <img src="http://openweathermap.org/img/w/${attribute['weather']['icon'].join('')}.png"/><br>
                    <h4>${attribute['weather']['description'].join('')}</h4>
                </g:if>
            </div>
        </div>
    </div>
</section>

%{--<div class="mh-100" style="background-color: rgba(0,0,255,0.1); align-content: center">--}%
%{--    <div class="d-inline-block"></div>--}%
%{--    <div class="d-inline-block" style="width:120px">--}%
%{--        <g:if test="${attribute}">--}%
%{--            <h2><b>${attribute['name']}</b></h2><br>--}%
%{--            <g:if val="°C">--}%
%{--                <h3>${attribute['main']['temp']} °C</h3><br>--}%
%{--            </g:if>--}%
%{--            <g:if val="°F">--}%
%{--                <h3>${attribute['main']['temp']} °F</h3><br>--}%
%{--            </g:if>--}%
%{--            <h3>${(Integer) Math.ceil( (Double) attribute['main']['temp'])} °C</h3><br>--}%
%{--            <img src="http://openweathermap.org/img/w/${attribute['weather']['icon'].join('')}.png"/><br>--}%
%{--            <h4>${attribute['weather']['description'].join('')}</h4>--}%
%{--        </g:if>--}%
%{--    </div>--}%
%{--</div>--}%

</body>
</html>