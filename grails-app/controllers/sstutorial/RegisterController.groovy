package sstutorial

import grails.plugin.springsecurity.annotation.Secured
class RegisterController {

    /**
     * Display the sign up form
     */
    @Secured(['permitAll'])
    def form(){
        render view: '../index'
    }

    /**
     * Display the GSP to register a new user if they aren't a member
     */
    @Secured(['permitAll'])
    def registerNewUser(){

    }

    /**
     * This action controls the signup form by asking for the usual parameters such as First name, Last name, email, password and its confirmation
     * First, it checks if the passwords are equal. If so, it creates a new user with the standard authority of USER and saves it in the database.
     * Also, it throws an appropriate exception handler GSP if they're not
     */
    @Secured(['permitAll'])
    def stowItInDatabase(){
        def name = params.firstName
        def lastname = params.lastName

        def email = params.email
        def password = params.password
        def passwordAgain = params.passwordRepeat

        if(password == passwordAgain){
            def role = new Role(authority: 'ROLE_USER').save()
            def user = new User(username: name + lastname, password: password)

            UserRole.create(user, role)
        } else {
            render view: 'passwordNotEqual'
            return
        }

        render view: 'successfullyRegistered', model: [firstName: name,
                                                        lastName: lastname]
    }

    @Secured(['permitAll'])
    def forgotPassword(){

    }

    @Secured(['permitAll'])
    def resetPassword(){
        def email = params.email
        User user = User.findByUsername(email)
        render view: 'passwordResetLinkSent', model: [email: email]
    }
}
