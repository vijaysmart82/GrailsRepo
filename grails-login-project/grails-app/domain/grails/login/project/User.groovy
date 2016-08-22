package grails.login.project

/*
 * Domain object for storing and retrieving the Users information
 */
class User {

	/*
	 * Columns are generated in the properties defined here
	 */
	String userid
	String firstname
	String lastname
	String email
	String startdate
	String password
	String imageurl
	
	/*
	 * Constraints defined here are levied on the columns generated in the run time
	 */
	static constraints =
	{
		 email(username:true)
		 password(blank:false, password:true)
		 imageurl(nullable:true)
	}
	
	
}
