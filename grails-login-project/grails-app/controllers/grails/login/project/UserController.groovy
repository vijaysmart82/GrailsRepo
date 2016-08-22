package grails.login.project

import java.lang.ProcessBuilder.Redirect;

/*
 * Controller class for the User domain object where all the business logic lies here
 */
class UserController {

	// Default block which gets called before directing to the view index.jsp
    def index() { }
	
	// Specific Action block which gets called, on the various actions  performed on the view page(gsp page)
	def login() {
		
		// Checking for the valid username and pwd against the User table in the H2 db
		if(User.findAllWhere(email:params.username, password:params.password)){
			
			flash.message = "Login succeed"
			// Setting the value to session to re-use it in the gsp pages also
			session.user = params.username
			System.out.println("User Id : "+User);
			
			// Controller and view to be redirected to after the course of action 
			redirect action:'index',controller:'login'
		}	
		else{			
			
			flash.message = "Login failure"	
			
			redirect action:'index'
		}	
			
	}
	
	
}
