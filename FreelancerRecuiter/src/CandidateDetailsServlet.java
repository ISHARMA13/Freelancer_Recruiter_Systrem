

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
 * Servlet implementation class CandidateDetailsServlet
 */
@WebServlet("/CandidateDetailsServlet")
public class CandidateDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateDetailsServlet() {
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
			int workphone = Integer.parseInt(request.getParameter("workphone"));
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int pincode = Integer.parseInt(request.getParameter("pin"));
			
			//Education Details
			String university = request.getParameter("university");
			String degree = request.getParameter("degree");
			int start = Integer.parseInt(request.getParameter("start"));
			int end = Integer.parseInt(request.getParameter("end"));
			
			//Experience details
			String company = request.getParameter("company");
			String title = request.getParameter("title");
			int Xstart = Integer.parseInt(request.getParameter("Xstart"));
			int Xend = Integer.parseInt(request.getParameter("Xend"));
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
	 		String freeeducation = "insert into freeeducation values (?,?,?,?,?);";
	 		String freeexperience = "insert into freeexperience values (?,?,?,?,?);";
	 		String freewallet = "insert into freewallet(?,0)";
	 		
	 		//Setting values in queries:
	 		//Query1
	 		PreparedStatement query1 = con.prepareStatement(freedetails);
	 		query1.setString(1, Id);
	 		query1.setString(2, firstname);
	 		query1.setString(3, lastname);
	 		query1.setString(4, photoURL);
	 		query1.setString(5, gender);
	 		query1.setInt(6, workphone);
	 		query1.setString(7, street);
	 		query1.setString(8, city);
	 		query1.setString(9, state);
	 		query1.setInt(10, pincode);
	 		
	 		//Query2
	 		PreparedStatement query2 = con.prepareStatement(freeeducation);
	 		query2.setString(1, Id);
	 		query2.setString(2, university);
	 		query2.setString(3, degree);
	 		query2.setInt(4, start);
	 		query2.setInt(5, end);
	 		
	 		//Query3
	 		PreparedStatement query3 = con.prepareStatement(freeexperience);
	 		query3.setString(1, Id);
	 		query3.setString(2, company);
	 		query3.setString(3, title);
	 		query3.setInt(4, Xstart);
	 		query3.setInt(5, Xend);
	 		query3.setString(6, description);
	 		
	 		//Query4
	 		PreparedStatement query4 = con.prepareStatement(freewallet);
	 		query4.setString(1, Id);
	 		
	 		//Executing Queries:
	 		int Fdet=query1.executeUpdate();
	 		int Fed=query2.executeUpdate();
	 		int Fexp=query3.executeUpdate();
	 		int Fwall=query4.executeUpdate();
	 		
	 		if(Fdet>0 && Fed>0 && Fexp>0 && Fwall>0) {
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
