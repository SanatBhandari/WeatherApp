package sstutorial

class Rain {
    double lastThreeHours
    double lastHour

    static constraints = {
        lastHour range: 0..100000
        lastThreeHours range: 0..100000
    }

    @Override
    String toString(){
        "Rain in the last 3 hours: ${lastThreeHours}" +
        "Rain in the last hour: ${lastHour}"
    }


}
