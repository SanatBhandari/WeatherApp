package sstutorial

import grails.plugin.springsecurity.annotation.Secured
import grails.web.Controller
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.RequestMapping
import grails.plugin.springsecurity.LoginController



@Controller
class PostController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass())

    /**
     * Render the sign in form
     */
    @Secured(['permitAll'])
    def index() {
        logger.info("Sign in form")
    }

    /**
     * If successfully authenticated, it will take the user to their dashboard
     */
    @Secured(['permitAll'])
    def UserDashboard(){
        // TODO: Fix this bug
        // TODO: Ability to add and show favorite cities
        // TODO: Add the search city functionality at the navbar

    }

    @Secured(['ROLE_USER'])
    def RoleUserDashboard(){

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
    @Secured(['ROLE_ADMIN'])
    def form(){

    }
}
