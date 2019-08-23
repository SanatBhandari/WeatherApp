package sstutorial

import grails.plugin.springsecurity.annotation.Secured

class LogoutController {

    @Secured(['permitAll'])
    def index() {
    }

    def logout(){
        session.invalidate()
        redirect(action: "index")
    }

    def home(){
//        render(view:'../../views/index')
        redirect(view: "../../views/index")
    }
}
