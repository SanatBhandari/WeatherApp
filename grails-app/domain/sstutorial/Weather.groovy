package sstutorial

class Weather {
    String weatherId
    String main
    String description
    String icon

    static constraints = {
        id blank: false
        main nullable: false
        description blank: false
        icon blank: false
    }

    @Override
    String toString(){
        "ID: ${weatherId}\n\n" +
                "Main: ${main.toString()}\n\n" +
                "Description: ${description}\n\n" +
                "Icon: ${icon}"
    }


}
