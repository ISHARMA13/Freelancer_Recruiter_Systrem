

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CandidateDetailsServlet
 */
@WebServlet("/CandidateDetailsServlet")
@MultipartConfig(maxFileSize = 16177215)

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
			String Id = ses.getAttribute("userid").toString();
			
			//Getting a connection object
			Connection con = null;
	 		String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	 		String username = "ishifree"; //MySQL username
	 		String password = "Freelancer@9876"; //MySQL password
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	 		System.out.println("Printing connection object "+con);
			
			//Personal details
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String gender = request.getParameter("gender");
			int workphone = Integer.parseInt(request.getParameter("workphone"));
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int pincode = Integer.parseInt(request.getParameter("pin"));
			
			InputStream photoURL = null;
	        Part filePart = request.getPart("photo");
	        if (filePart != null) {
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	            // Obtains input stream of the upload file
	            photoURL = filePart.getInputStream();
	        }
	        
	        String freedetails = "insert into freedetails values (?,?,?,?,?,?,?,?,?,?);";
	 		PreparedStatement query1 = con.prepareStatement(freedetails);
	 		query1.setString(1, Id);
	 		query1.setString(2, firstname);
	 		query1.setString(3, lastname);
//	 		query1.setString(4, photoURL);
	 		if (photoURL != null) {
	 			query1.setBlob(4,photoURL);
            }
	 		query1.setString(5, gender);
	 		query1.setInt(6, workphone);
	 		query1.setString(7, street);
	 		query1.setString(8, city);
	 		query1.setString(9, state);
	 		query1.setInt(10, pincode);
	 		int personal=query1.executeUpdate();
			
			//Education Details
	        String[] university = new String[3];
	        String[] degree = new String[3];
	        String[] start = new String[3];
	        String[] end = new String[3];
	        String[] freeeducation = new String[3];
	        int[] results= new int[3];
	        int eduresult=0;
	        String count;
	        for(int i=0;i<3;i++) { 
	        	if(i==0) {count="";} 
	        	else if(i==1){count="1";} 
	        	else {count="2";}
	        	university[i] = request.getParameter("university"+count);
	        	degree[i] = request.getParameter("degree"+count);
	        	start[i] = request.getParameter("start"+count);
				end[i] = request.getParameter("end"+count);
				if(university[i]!=null) {
					freeeducation[i] = "insert into freeeducation values (?,?,?,?,?);";
					PreparedStatement edu = con.prepareStatement(freeeducation[i]);
					edu.setString(1, Id);
					edu.setString(2, university[i]);
					edu.setString(3, degree[i]);
					edu.setString(4, start[i]);
					edu.setString(5, end[i]);
					results[i]=edu.executeUpdate();
					eduresult+=results[i];
				}
	        }
	        
			
			//Experience details
			String[] company= new String[3];
			String[] title=new String[3];
			String[] Xstart=new String[3];
			String[] Xend=new String[3];
			String[] description=new String[3];
			String[] freeexperience = new String[3];
	        int expresult=0;
	        count="";
	        for(int i=0;i<3;i++) { 
	        	if(i==0) {count="";} 
	        	else if(i==1){count="1";} 
	        	else {count="2";}
	        	company[i] = request.getParameter("company"+count);
	        	title[i] = request.getParameter("title"+count);
	        	Xstart[i] = request.getParameter("Xstart"+count);
				Xend[i] = request.getParameter("Xend"+count);
				description[i] = request.getParameter("description"+count);
				if(company[i]!=null) {
					freeexperience[i] = "insert into freeexperience values (?,?,?,?,?,?);";
					PreparedStatement exp = con.prepareStatement(freeexperience[i]);
					exp.setString(1, Id);
					exp.setString(2, company[i]);
			 		exp.setString(3, title[i]);
			 		exp.setString(4, Xstart[i]);
			 		exp.setString(5, Xend[i]);
			 		exp.setString(6, description[i]);
					results[i]=exp.executeUpdate();
					expresult += results[i];
				}
	        }
	 		
	 		//Wallet Details
	 		String freewallet = "insert into freewallet values(?,0)";
	 		PreparedStatement query4 = con.prepareStatement(freewallet);
	 		query4.setString(1, Id);
	 		int Fwall=query4.executeUpdate();
	 		
	 		//Check all results
	 		if(personal>0 && eduresult>0 && expresult>0 && Fwall>0) {
	 			response.setContentType("text/html");
 	 			PrintWriter out = response.getWriter();
 	 		      out.println(
					 "0"
 	 		      );
 	 		      
 	 		  response.sendRedirect("CandidateDashboard.jsp");
// 	 		  RequestDispatcher rd = request.getRequestDispatcher("CandidateDashboard.jsp");
// 	 		  rd.forward(request, response);
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
 			PrintWriter out = response.getWriter();
		      out.println(
		    		 e.toString()
		      );
 		}
	}

}
