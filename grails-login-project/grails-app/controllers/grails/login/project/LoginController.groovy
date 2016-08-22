package grails.login.project

class LoginController {

	// Default block which gets called before directing to the view index.jsp
    def index() { 
	}
	
	// This block of action gets called, when we click the Store button in the home page, after we login
	def storeurl(){
		
		// Only save the image link to DB, if a user is logged in. 
		if(session.user != null){
			String imageUrl = request.getParameter("hdnSelectedURL");
			
			def user = User.where {
				email == session.user
			}.list().get(0);
			
			user.imageurl = user.imageurl == null ? imageUrl : user.imageurl+","+imageUrl;
			user.save(flush: true)
			System.out.println("User Id : "+user.properties);
			
		}
		else {
			flash.message = "No user logged in. Cannot save the data."
		}
		
		redirect action:'index'
	}
	
}
