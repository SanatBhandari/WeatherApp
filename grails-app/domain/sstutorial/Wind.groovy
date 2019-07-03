package sstutorial

class Wind {
    double windSpeed
    double windDirection

    static constraints = {
        windSpeed nullable: false, blank: false
    }

    @Override
    String toString(){
        "-----Wind Speed is ${windSpeed}<br>" +
        "-----Wind Direction is ${windDirection}"
    }


}
