package sstutorial

import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import groovy.json.JsonSlurper
import groovy.transform.CompileStatic
import org.grails.web.json.JSONObject

@CompileStatic
class OpenweathermapService {
    final String apiKey = "3a531a6be7357a0e324b807900469063"
    final String openWeatherUrl = "http://api.openweathermap.org"

    def jsonOutput = new JSONObject()
    RestBuilder rest = new RestBuilder(connectTimeout:1000, readTimeout:20000)

    String urlPrefix = "${openWeatherUrl}/data/2.5/weather?"
    String urlSuffix ="&appid=${apiKey}"

    /**
     * This action takes the city name, country name, and the unit to display the weather for the place
     * To refactor the code, I separated the 'Dirty Work' of making the calls to the API to a separate
     * function that handles it
     *
     * @param cityName
     * @param countryName
     * @param unit
     * @return
     */
    Map currentWeatherByCityAndCountry(String cityName, String countryName, String unit){
        def unitSystem = ''
        if(unit == '°C') unitSystem = "metric"
        else if(unit == '°F') unitSystem = "imperial"

        def url = urlPrefix + "q=${cityName},${countryName}&units=${unitSystem}" + urlSuffix
        dirtyWork(url)
    }

    Map currentWeatherByZipCode(Integer zipCode){
        String url = urlPrefix + "zip=${zipCode.toString()}&units=metric" + urlSuffix
        dirtyWork(url)
    }

    /**
     *
     * @param url
     * @return String
     *
     * This method takes care of the boilerplate stuff
     * by taking in the URI for executing the request to the OpenWeather API
     * and returns back the parsed response in a concise String representation
     *
     */
    Map dirtyWork(String url){
        RestResponse restResponse = rest.get(url)
        jsonOutput = restResponse.json

        def slurper = new JsonSlurper().parseText(restResponse.text)
        slurper instanceof Map

        OpenweathermapParser.ResponseJSONFromJSONElement((Map) slurper)
        (Map) slurper
    }
}

