

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
 * Servlet implementation class RecruiterSignUp
 */
@WebServlet("/RecruiterSignUp")
public class RecruiterSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruiterSignUp() {
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
			HttpSession ses = request.getSession();  
	
			//getting input values from jsp page
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/trial"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String pass = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, pass); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
	 		
	 		PreparedStatement st1 = con .prepareStatement("select Id from employer where Id=?;");
	 		st1.setString(1, email);
	 		ResultSet rs=st1.executeQuery();
	 		
	 		if(!rs.next()) {
		 		if (confirmPassword.equals(password)) {
		 			ses.setAttribute("email", email);
		 			String query = "INSERT INTO employer (?,?)";
		 			PreparedStatement stmt = con.prepareStatement(query);
		 			stmt.setString(1, email);
		 			stmt.setString(2, password);
		 			int r=stmt.executeUpdate();
		 			if(r > 0) {
			 			RequestDispatcher rd = request.getRequestDispatcher("RecruiterDetails.jsp");
		 				rd.forward(request, response);
		 			}
		 		} 
		 		else {
		 			response.setContentType("text/html");
	 	 			PrintWriter out = response.getWriter();
	 	 		      String docType =
	 	 		         "<!doctype html>\n";
	 	 		      out.println(docType +
	 	 		         "<html><head><title>Error</title></head>"+
						 "<body><h1>Incorrect Password</h1></body></html>"
	 	 		      );
		 		}
	 		} else {
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      String docType =
 	 		         "<!doctype html>\n";
 	 		      out.println(docType +
 	 		         "<html><head><title>Error</title></head>"+
					 "<body><h1>Email already exists!</h1></body></html>"
 	 		      );
	 		}
	 	}
		 catch (Exception e) {
 			e.printStackTrace();
 		}
	}

}
