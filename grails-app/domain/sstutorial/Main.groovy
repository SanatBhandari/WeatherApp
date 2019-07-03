package sstutorial

class Main {
    double temperature
    double pressure
    double humidity
    double temperature_min
    double temperature_max
    double seaLevel
    double groundLevel

    static constraints = {
        temperature nullable: false, blank: false
        pressure nullable: false, blank: false, range: 0..1000000
        temperature_max nullable: false, blank: false
        temperature_min nullable: false, blank: false
    }

    @Override
    String toString(){
        "Temperature: ${temperature}" +
        "Pressure: ${pressure}" +
        "Minimum Temperature for the day: ${temperature_min}" +
        "Maximum Temperature for the day: ${temperature_max}" +
        "Sea Level: ${seaLevel}" +
        "Ground Level: ${groundLevel}"
    }


}
