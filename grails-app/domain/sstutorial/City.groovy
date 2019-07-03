package sstutorial

class City {
    String cityId
    String name
    String country
    Coordinates coordinates

    static constraints = {
        name nullable: false, blank: false
        country nullable: false, blank: false
        cityId nullable: false
    }

    String toString(){
        "Name is ${name}, Country is ${country}, and the coordinates are ${coordinates.toString()}"
    }

}
