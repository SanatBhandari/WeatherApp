package sstutorial

class ResponseJSON {
    Coordinates coordinates
    Main main
    Rain rain
    Snow snow
    Sys sys
    Weather weather
    Wind wind
    String base
    Long cityId
    String cityName
    String cod
    String dt
    Integer cloudiness

    static constraints = {
        cityName nullable: false
    }

    @Override
    String toString(){
        "CITY: ${cityName}, City ID: ${cityId}"
        coordinates.toString()
        main.toString()
        rain.toString()
        snow.toString()
        sys.toString()
        wind.toString()
    }


}
