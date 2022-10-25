

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CandidateDetails
 */
@WebServlet("/CandidateDetails")
public class CandidateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//getting input values from jsp page
		try {
			HttpSession ses = request.getSession( );
			String Id = (String) ses.getAttribute("userid");
			
			//Personal details
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String photoURL = request.getParameter("photo");
			String gender = request.getParameter("gender");
			int workphone = Integer.parseInt(request.getParameter("workphone"));
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int pincode = Integer.parseInt(request.getParameter("pin"));
			
			//Education Details
			String university = request.getParameter("university");
			String degree = request.getParameter("degree");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			//Experience details
			String company = request.getParameter("company");
			String title = request.getParameter("title");
			String Xstart = request.getParameter("Xstart");
			String Xend = request.getParameter("Xend");
			String description = request.getParameter("description");
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/trial"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
	 		
	 		//All queries:	
	 		String freedetails = "insert into freedetails values (?,?,?,?,?,?,?,?,?,?,?);";
	 		String freeeducation = "insert into freeeducation values (?,?,?,?);";
	 		String freeexperience = "insert into freeexperience values (?,?,?,?,?);";
	 		
	 		//Setting values in queries:
	 		
	 		//Executing Queries:
	 		PreparedStatement st1 = con .prepareStatement("select * from freelancers where Id=?;");
	 		st1.setString(1,userid);
	 		ResultSet rs=st1.executeQuery();
		} 
		catch (Exception e) {
 			e.printStackTrace();
 		}
	}

}
