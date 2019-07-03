package sstutorial

import grails.plugin.springsecurity.annotation.Secured

class PostController {

    /**
     * Render the sign in form
     */
    @Secured(['permitAll'])
    def index() {
//        render view: '../../views/post/index'
    }

    /**
     * If successfully authenticated, it will take the user to their dashboard
     */
    @Secured(['permitAll'])
    def UserDashboard(){
//        render view:'userDashboard'
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
