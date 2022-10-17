


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;;
/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public IssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String issue_date = request.getParameter("issue_date");
		String return_date = request.getParameter("return_date");		

		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/Library"; //MySQL URL and followed by the database name
 		String username = "universityDB0035"; //MySQL username
 		String password = "Niteesh@123"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		PreparedStatement stcheck = con .prepareStatement("select * from book where book_id=?;");
 		
 		stcheck.setInt(1,book_id);
 		ResultSet rs=stcheck.executeQuery();
 		if(!rs.next()) {
 			response.setContentType("text/html");
 			PrintWriter out = response.getWriter();
 		      String docType =
 		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
 		      out.println(docType +
 		         "<html>\n" +
 		         "<head><title>Error </title></head>\n"+
 		         "<body bgcolor = \"#f0f0f0\">\n" +
 		         "<h1 align = \"center\"> Invalid Book Id</h1>\n" +"</body></html>"
 		      );
			return;
 		}
 		stcheck = con .prepareStatement("select * from student where student_id=?;");
 		stcheck.setInt(1,student_id);
 		rs=stcheck.executeQuery();
 		
 		if(!rs.next()) {
 			response.setContentType("text/html");
 			PrintWriter out = response.getWriter();
 		      String docType =
 		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
 		      out.println(docType +
 		         "<html>\n" +
 		         "<head><title>Error </title></head>\n"+
 		         "<body bgcolor = \"#f0f0f0\">\n" +
 		         "<h1 align = \"center\"> Invalid Student Id</h1>\n" +"</body></html>"
 		      );
			return;
 		}
 		int result=0;
 		if(return_date==null || return_date=="") {
 			PreparedStatement st = con .prepareStatement("insert into issue(student_id,book_id,issue_date) values(?, ?,?)");
 	 		st.setInt(1,student_id);
 	 		st.setInt(2,book_id);
 			st.setString(3,issue_date);
 			result=st.executeUpdate();
		}
 		else {
 			PreparedStatement st = con .prepareStatement("insert into issue values(?, ?,?,?)");
 	 		st.setInt(1,student_id);
 	 		st.setInt(2,book_id);
 			st.setString(3,issue_date);
 			st.setString(4,return_date);
 			result=st.executeUpdate();
 		}
		//Prepared Statement to add student data
		

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("IssueResult.jsp");
			rd.forward(request, response);
		}

		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}

