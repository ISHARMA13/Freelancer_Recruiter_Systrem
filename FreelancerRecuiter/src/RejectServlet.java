

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RejectServlet
 */
@WebServlet("/RejectServlet")
public class RejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {  
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String pass = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, pass); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
			//getting input values from jsp page
			String proposal_id = request.getParameter("proposal_id");
//			String job_id = request.getParameter("job_id");
//			System.out.println(proposal_id);
			
			String queryProps="Update proposals set status=0 where proposal_id=?";
			PreparedStatement s1 = con.prepareStatement(queryProps);
			s1.setString(1, proposal_id);
			int r1 = s1.executeUpdate();
			
			if(r1>0) {
				response.sendRedirect("MyPostedJobs.jsp");
			} else {
				response.setContentType("text/html");
	 			PrintWriter out = response.getWriter();
	 		      out.println(
					 "Not Accepted"
	 		      );
			}
			
			
			
		} catch (Exception e) {
 			e.printStackTrace();
 		}
	}

}
