

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RecruiterDetailsServlet
 */
@WebServlet("/RecruiterDetailsServlet")
public class RecruiterDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruiterDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession ses = request.getSession( );
			String Id = (String) ses.getAttribute("userid");
			
			//Personal details
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String photoURL = request.getParameter("photo");
			String gender = request.getParameter("gender");
			String company = request.getParameter("company");
			String position = request.getParameter("position");
			int workphone = Integer.parseInt(request.getParameter("workphone"));
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int pincode = Integer.parseInt(request.getParameter("pin"));
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/trial"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
	 		
	 		//All queries:	
	 		String empdetails = "insert into empdetails values (?,?,?,?,?,?,?,?,?,?,?,?,?);";
	 		String empwallet = "insert into empwallet(?,0)";
	 		
	 		//Setting values in queries:
	 		//Query1
	 		PreparedStatement query = con.prepareStatement(empdetails);
	 		query.setString(1, Id);
	 		query.setString(2, firstname);
	 		query.setString(3, lastname);
	 		query.setString(4, photoURL);
	 		query.setString(5, gender);
	 		query.setString(6, company);
	 		query.setString(7, position);
	 		query.setInt(8, workphone);
	 		query.setString(9, street);
	 		query.setString(10, city);
	 		query.setString(11, state);
	 		query.setInt(12, pincode);
	 		
	 		//Query2
	 		PreparedStatement query2 = con.prepareStatement(empwallet);
	 		query2.setString(1, Id);
	 		
	 		//Executing Queries:
	 		int Edet=query.executeUpdate();
	 		int Ewall=query2.executeUpdate();
	 		
	 		if(Edet>0 && Ewall>0) {
	 			//RequestDispatcher rd = request.getRequestDispatcher("CandidateDashboard.jsp");
 				//rd.forward(request, response);
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "0"
 	 		      );
	 		} else {
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "<h6>Fill in the correct details</h6>"
 	 		      );
	 		}
		} 
		catch (Exception e) {
 			e.printStackTrace();
 		}
	}

}
