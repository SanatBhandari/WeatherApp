package sstutorial

import org.springframework.boot.autoconfigure.jms.activemq.ActiveMQConnectionFactoryCustomizer

import javax.jms.*
import grails.plugin.springsecurity.annotation.Secured
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.RestController
import javax.jms.Queue
import org.apache.log4j.Logger

@RestController
class ResponseJSONController {
    def input = params.cityName                 // Parsing the params from the form.gsp to get the input and unit attributes

    OpenweathermapService openweathermapService         // Declaring the Openweathermap service to make the API request and parse the obtained JSON
    final static Logger logger = LoggerFactory.getLogger(ResponseJSONController.class)          // Logger to log the errors and exceptions


    /**
     * @return the form.gsp page that handles the input from the user
     */
    def form(){
        logger.info("Hello Loggly")
        logger.info("Welcome to Weather+")

        render(view:"../../views/form")
    }

    /**
     * The main action that handles the input of the city and the country code. This is probably the most essential part of the application and hence, must be handled properly
     * So, I added the logger functionality to it along with displaying exception.gsp to override the standard error.gsp
     *
     * @return the view handling the output when we input the city and the country
     */
    @Secured(['permitAll'])
    def getWeatherByCityAndCountry(){
        logger.info("The action of getting weather via a city name and country code")
        try{
            String cityAndCountry = params.cityName
            def unit = params.user.unit
            logger.debug("{}",input.toString())
            def splittedInput = cityAndCountry.split(',')                                           // The obtained input is split via the ',' delimiter and is trimmed to remove appending and prepending

            if(!cityAndCountry.contains(',')) {
                render view:"../conflict"
                return
            }                                                                                                // whitespaces and this is passed to the Openweather map service
            String city = splittedInput[0].trim()
            String country = splittedInput[1].trim()
            def currentWeatherByCityAndCountry = openweathermapService.currentWeatherByCityAndCountry(city, country, (String) unit)

            render(view: "../../views/searchOutput", model: [attribute: currentWeatherByCityAndCountry, unit: unit])
        } catch (Exception e){
            LOGGER.error("The error that we ran into is ", e)
            render(view:"../../views/exception")
        }
    }

    /**
     * The function to get the weather by inputting the zip code of the place. It works well for US and Canadian cities where two places can have the same name
     * Commented out since it is not necessary for the current project. In case I find the time and there is requirement, I can add this feature
     *
     * @return the view handling the output (searchOutput.gsp) with the JSON parsed as map for easy retrieval of values
     */

//    def getWeatherByZipCode(){
//        try{
//            def inputtedZipCode = params.cityName
//            ZipCode zipCode = new ZipCode()
//            zipCode.zipCode = inputtedZipCode
//            def currentWeatherByZipCode = openweathermapService.currentWeatherByZipCode(zipCode.zipCode.toInteger())
//            render(view: "../../views/searchOutput", model: [attribute: currentWeatherByZipCode])
//        } catch (Exception e){
//            render(view:"../../views/exception")
//        }
//    }
}
