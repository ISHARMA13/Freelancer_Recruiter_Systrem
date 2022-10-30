

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SubmitApplicationServlet
 */
@WebServlet("/SubmitApplicationServlet")
public class SubmitApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitApplicationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//Setting a session variable
			HttpSession ses = request.getSession(false);  
			String free_id = (String) ses.getAttribute("userid");
			System.out.println(free_id);
			String jobId = (String) ses.getAttribute("job_id");
	 		System.out.println(jobId);
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
	 		//Create a job Id:
	 		String proposalid = "pro" + System.nanoTime()+((int)Math.random()*100);
	 		ses.setAttribute("prop", proposalid);
	
	 		//getting input values from jsp page
			String cover = request.getParameter("cover");
			int duration = Integer.parseInt(request.getParameter("duration"));
			int budget = Integer.parseInt(request.getParameter("budget"));
			int status = 1;
			
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(System.currentTimeMillis());
			String posted=(String) formatter.format(date);
			
			String getEmpId = "Select Distinct(emp_id) as emp_id from jobs where job_id=?;";
			PreparedStatement stmt = con.prepareStatement(getEmpId);
			stmt.setString(1, jobId);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			String emp_id = rs.getString("emp_id");
			
			String proposal = "insert into proposals values (?,?,?,?,?,?,?,?,?);";
			stmt = con.prepareStatement(proposal);
			stmt.setString(1, proposalid);
			stmt.setString(2, jobId);
			stmt.setString(3, free_id);
			stmt.setString(4, emp_id);
			stmt.setInt(5, status);
			stmt.setInt(6, duration);
			stmt.setInt(7, budget);
			stmt.setString(8, cover);
			stmt.setString(9, posted);
			
			int r = stmt.executeUpdate();
			
			if(r>0) {
				response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "Job Posted Successfully!" 
 	 		      );
 	 		      out.println("Redirecting back to Dashboard");
 	 		    
 	 		      response.sendRedirect("CandidateDashboard.jsp");
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
