

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RecruiterLoginServlet
 */
@WebServlet("/RecruiterLoginServlet")
public class RecruiterLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruiterLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			//Setting a session variable
			HttpSession ses = request.getSession(true);  
	
			//getting input values from jsp page
			String userid = request.getParameter("username");
			String userpassword = request.getParameter("password");
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		PreparedStatement st1 = con .prepareStatement("select * from employer where Id=?;");
	 		st1.setString(1,userid);
	 		ResultSet rs=st1.executeQuery();
	 		if(rs.next()) 
			{
	 			if(rs.getString("password").equals(userpassword)) 
				{
	 				ses.setAttribute("email", userid);
	 				response.setContentType("text/html");
	 	 			PrintWriter out = response.getWriter();
	 	 		      out.println(
						 "0"
	 	 		      );
//	 				RequestDispatcher rd = request.getRequestDispatcher("RecruiterDetails.jsp");
//	 				rd.forward(request, response);
	 			}
	 			else 
				{
	 				response.setContentType("text/html");
	 	 			PrintWriter out = response.getWriter();
	 	 		      out.println(
						 "<h6>Incorrect Password</h6>"
	 	 		      );
	
	 			}
	 			
	 		}
	 		else 
			{
	// 			RequestDispatcher rd = request.getRequestDispatcher("CandidateLogin.jsp");
	//			rd.forward(request, response);
	 			response.setContentType("text/html");
	 			PrintWriter out = response.getWriter();
	 		      out.println(
					 "Login Failed - Invalid User"
	 		      );
	 		}
		
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}
	}

}
