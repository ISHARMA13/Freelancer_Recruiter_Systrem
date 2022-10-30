

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetJobId
 */
@WebServlet("/GetJobId")
public class GetJobId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetJobId() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession ses = request.getSession();  
			
			//getting input values from jsp page
			String job_id = request.getParameter("job_id");
			ses.setAttribute("job_id", job_id);
			System.out.println(job_id);
			response.sendRedirect("Applications.jsp");
			
		} catch (Exception e) {
 			e.printStackTrace();
 		}
	}

}
