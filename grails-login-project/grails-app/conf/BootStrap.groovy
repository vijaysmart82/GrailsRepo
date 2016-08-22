import grails.login.project.User


class BootStrap {

    def init = { servletContext ->
		
		// Read the users data from the xml. Parse the xml data using XmlParser and load it into the domain object and 
		// save it to DB
		
		def users = new XmlParser().parse("C:/user.xml");
		users.'user'.each{ usr ->
			new User(userid:usr.'user_id'.text(), firstname:usr.'firstname'.text(), 
				lastname:usr.'lastname'.text(), email:usr.'email'.text(), 
				startdate:usr.'startdate'.text(), password:'password').save()
		}
    }
	
    def destroy = {
    }
}
