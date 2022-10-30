

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PostedJobServlet
 */
@WebServlet("/PostedJobServlet")
public class PostedJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostedJobServlet() {
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
			String emp_id = request.getSession(false).getAttribute("email").toString();
			System.out.println(emp_id);
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
			//Create a job Id:
	 		String jobId = "job" + System.nanoTime()+((int)Math.random()*100);
	 		
			//getting input values from jsp page
			String role = request.getParameter("role");
			int duration = Integer.parseInt(request.getParameter("duration"));
			int budget = Integer.parseInt(request.getParameter("budget"));
			String skills = request.getParameter("skills");
			String description = request.getParameter("description");
			String expiry = request.getParameter("expiry");
			int status = 1;
			
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(System.currentTimeMillis());
			String posted=(String) formatter.format(date);
			
	 		PreparedStatement stmt = con .prepareStatement("Insert into jobs values (?,?,?,?,?,?,?,?,?,?);");
	 		stmt.setString(1,jobId);
	 		stmt.setString(2,role);
	 		stmt.setString(3,emp_id);
	 		stmt.setInt(4,status);
	 		stmt.setInt(5,duration);
	 		stmt.setInt(6,budget);
	 		stmt.setString(7,skills);
	 		stmt.setString(8,description);
	 		stmt.setString(9,posted);
	 		stmt.setString(10,expiry);
	 		
	 		int rs=stmt.executeUpdate();
	 		if(rs>0) {
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "Job Posted Successfully!" 
 	 		      );
 	 		      out.println("Redirecting back to Dashboard");
 	 		      response.sendRedirect("MyPostedJobs.jsp");
// 	 		  RequestDispatcher rd = request.getRequestDispatcher("Succesful.jsp");
// 	 		  rd.forward(request, response);
	 		} else {
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "<h6>Fill in the correct details</h6>"
 	 		      ); 
	 		}
		} 
			 catch (Exception e) 
	 		{
	 			e.printStackTrace();
	 		}
		}

}
