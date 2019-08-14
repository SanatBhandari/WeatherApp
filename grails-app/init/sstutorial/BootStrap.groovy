package sstutorial

class BootStrap {

    def init = { servletContext ->
//        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
//        def userRole = new Role(authority: 'ROLE_USER').save()
//
//        def admin = new User(username: 'admin', password: 'password').save()
//        def user = new User(username: 'user', password: 'password').save()
//
//        UserRole.create(admin, adminRole)
//        UserRole.create(user, userRole)
//
//        UserRole.withSession {
//            it.flush()
//            it.clear()
//        }
    }
    def destroy = {
    }
}
