package sstutorial

import groovy.transform.CompileDynamic
import groovy.transform.CompileStatic

@CompileStatic
/**
 * This class parses the JSON response from the API into POGOs and stores them in the database
 */
class OpenweathermapParser {

    @CompileDynamic
    static Coordinates coordinatesFromJSONElement(Map json){
        Coordinates coordinates = new Coordinates()
        if(json['coord']['lon']) coordinates.setLatitude((BigDecimal) json['coord']['lon'])
        if(json['coord']['lat']) coordinates.setLongitude((BigDecimal) json['coord']['lat'])
        coordinates.save()
        coordinates
    }

    @CompileDynamic
    static Main mainFromJSONElement(Map json){
        Main main = new Main()
        if(json['main']['temp']) main.setTemperature((Double) json['main']['temp'])
        if(json['main']['pressure']) main.setPressure((Double) json['main']['pressure'])
        if(json['main']['humidity']) main.setHumidity((Double) json['main']['humidity'])
        if(json['main']['temp_min']) main.setTemperature_min((Double) json['main']['temp_min'])
        if(json['main']['temp_max']) main.setTemperature_max((Double) json['main']['temp_max'])
        if(json['main']['sea_level']) main.setSeaLevel((Double) json['main']['sea_level'])
        if(json['main']['grnd_level']) main.setTemperature((Double) json['main']['grnd_level'])
        main.save()
        main
    }

    @CompileDynamic
    static Wind windFromJSONElement(Map json){
        Wind wind = new Wind()
        if(json['wind']['speed']) wind.setWindSpeed((Double) json['wind']['speed'])
        if(json['wind']['deg']) wind.setWindDirection((Double) json['wind']['deg'])
        wind.save()
        wind
    }

    @CompileDynamic
    static Sys sysFromJSONElement(Map json){
        Sys sys = new Sys()
        if(json['sys']['type']) sys.setType((String) json['sys']['type'])
        if(json['sys']['id']) sys.setSysId((Long) json['sys']['id'])
        if(json['sys']['message']) sys.setMessage((String) json['sys']['message'])
        if(json['sys']['country']) sys.setCountry((String) json['sys']['country'])
        if(json['sys']['sunrise']) sys.setSunrise((Double) json['sys']['sunrise'])
        if(json['sys']['sunset']) sys.setSunset((Double) json['sys']['sunset'])
        sys.save()
        sys
    }

    @CompileDynamic
    static Weather weatherFromJSONElement(Map json){
        Weather w = new Weather()
        if(json['weather']['id']) w.setWeatherId((String) json['weather']['id'])
        if(json['weather']['description'])w.setDescription((String) json['weather']['description'])
        if(json['weather']['icon'])w.setIcon((String) json['weather']['icon'])
        if(json['weather']['main'])w.setMain((String) json['weather']['main'])
        w.save()
        w
    }

    @CompileDynamic
    static ResponseJSON ResponseJSONFromJSONElement(Map json){
        ResponseJSON responseJSON = new ResponseJSON()
        if(json.coord) responseJSON.coordinates = coordinatesFromJSONElement(json)
        if(json.main) responseJSON.main = mainFromJSONElement(json)
        if(json.wind) responseJSON.wind = windFromJSONElement(json)
        if(json.sys) responseJSON.sys = sysFromJSONElement(json)
        if(json.id) responseJSON.cityId = json['id'] as Long
        if(json.base) responseJSON.base = json['base']
        if(json.name) responseJSON.cityName = json['name']
        if(json.cod) responseJSON.cod = json['cod']
        if(json.clouds) responseJSON.cloudiness = json['clouds']['all'] as Integer
        if(json.dt) responseJSON.dt = json['dt'] as Integer
        if(json.weather)responseJSON.setWeather(weatherFromJSONElement(json))
        responseJSON.save()
        responseJSON
    }
}
