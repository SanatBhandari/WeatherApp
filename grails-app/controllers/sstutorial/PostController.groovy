package sstutorial

import grails.plugin.springsecurity.annotation.Secured
import grails.web.Controller
import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.RequestMapping

@Controller
class PostController {
    /**
     * Render the sign in form
     */
    @Secured(['permitAll'])
    def index() {

    }

    /**
     * If successfully authenticated, it will take the user to their dashboard
     */
    @RequestMapping(value="/")
    @Secured(['permitAll'])
    def UserDashboard(){
        // TODO: Fix this bug
        // TODO: Override Exception page
        // TODO: Ability to add and show favorite cities
        // TODO: Add the search city functionality at the navbar
    }

    /**
     * Just a personal page to demonstrate different roles
     * @return
     */
    @Secured(['ROLE_ADMIN'])
    def personal(){
        render "This is personal, fam"
    }

    /**
     * Displays the home page of the app after logging in
     */
    @Secured(['permitAll'])
    def form(){

    }
}
