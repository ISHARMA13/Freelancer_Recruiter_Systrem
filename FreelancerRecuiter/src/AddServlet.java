


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
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String author = request.getParameter("author");
		

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
 		if(rs.next()) {
 			response.setContentType("text/html");
 			PrintWriter out = response.getWriter();
 		      String docType =
 		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
 		      out.println(docType +
 		         "<html>\n" +
 		         "<head><title>Error </title></head>\n"+
 		         "<body bgcolor = \"#f0f0f0\">\n" +
 		         "<h1 align = \"center\"> Book Id Already there</h1>\n" +"</body></html>"
 		      );
			return;
 		}
 		
		//Prepared Statement to add student data
		PreparedStatement st = con .prepareStatement("insert into book values(?, ?,?,?)");
 		st.setInt(1,book_id);
		st.setString(2,title);
		st.setString(3,category);
		st.setString(4,author);
		int result=st.executeUpdate();

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("AddResult.jsp");
			rd.forward(request, response);
		}

		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}

