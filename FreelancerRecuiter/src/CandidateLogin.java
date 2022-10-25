

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class CandidateLogin
 */
@WebServlet("/CandidateLogin")
public class CandidateLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			//Setting a session variable
			HttpSession ses = request.getSession();  
	
		//getting input values from jsp page
		String userid = request.getParameter("username");
		String userpassword = request.getParameter("password");
		
		//Getting a connection object
		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/trial"; //MySQL URL and followed by the database name
 		String username = "ishifree"; //MySQL username
 		String password = "Freelancer@9876"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		PreparedStatement st1 = con .prepareStatement("select * from freelancers where Id=?;");
 		st1.setString(1,userid);
 		ResultSet rs=st1.executeQuery();
 		if(rs.next()) 
		{
 			if(rs.getString("password").equals(userpassword)) 
			{
 				ses.setAttribute("userid", userid);
 				RequestDispatcher rd = request.getRequestDispatcher("CandidateDetails.jsp");
 				rd.forward(request, response);
 			}
 			else 
			{
 				response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      String docType =
 	 		         "<!doctype html>\n";
 	 		      out.println(docType +
 	 		         "<html><head><title>Error </title></head>"+
					 "<body><h1>Incorrect Password</h1></body></html>"
 	 		      );

 			}
 			
 		}
 		else 
		{
// 			RequestDispatcher rd = request.getRequestDispatcher("CandidateLogin.jsp");
//			rd.forward(request, response);
 			response.setContentType("text/html");
 			PrintWriter out = response.getWriter();
 		      String docType =
 		         "<!doctype html>\n";
 		      out.println(docType +
 		         "<html><head><title>Error </title></head>"+
				 "<body><h1>Login Failed - Invalid User</h1></body></html>"
 		      );
 		}
	
	}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}
	}

}
