<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.io.PrintStream"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Jobs</title>
	<link rel="icon" href="images/logo.ico" type="image/x-icon" />
	<script src="http://code.jquery.com/jquery-git2.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    	.iconcolor{
			color:#007bff;
		}
    </style>
</head>
<body>

<%try {	
	//HttpSession jobId = request.getSession( );
	
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	String username = "ishifree"; //MySQL username
	String password = "Freelancer@9876"; //MySQL password
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	//System.out.println("Printing connection object "+con);
	
	String lenquery = "Select Count(*) from jobs where status=1;";
	String jobquery = "Select * from jobs where status=1;";
	PreparedStatement q1 = con.prepareStatement(lenquery);
	PreparedStatement q2 = con.prepareStatement(jobquery);
	ResultSet job = q1.executeQuery();
	job.next();
	int len = job.getInt("COUNT(*)");
	out.print(len);
	job = q2.executeQuery();
%>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="margin-left:6rem;">
            <img
                src="images/logo1.png"
                alt="Avatar Logo"
                style="width: 30%"
            />
            </a>
            <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapsibleNavbar"
            >
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <a class="nav-link" href="CandidateDashboard.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link active" href="SearchAJob.jsp">Jobs</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="MyApplications.jsp">My Applications</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="SearchAJob.jsp">Refresh <i class="fa fa-refresh"></i></a>
                    </li>
                    <li class="nav-item">
                    <form action="LogoutServlet" method="post">
		                <input class="nav-link" style="color:white;background-color:black;" type="submit" value="Logout" class="iconcolor">
		            </form>
                    </li>
                </ul>
            </div>
           	<form class="d-flex" style="margin-right:6rem;">
                <input class="form-control me-2" type="text" placeholder="Search" />
                <button class="btn btn-primary" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </form>
        </div>
    </nav>

	<div class="p-5 bg-primary text-white text-center" style="margin-top: 50px">
        <h1>Find all newly posted jobs here! </h1>
        <p>Hopefully you will find a job you like ^_^</p>
    </div>
    
    <div class="container mt-5">
    	<div class="row" id="job">
			<% for(int i=0; i<len; i++) {
				if(job.next()){
			%>
			<div class="p-4 col-xl-6 bg-white">
                    <div class="shadow-lg bg-white rounded-4">
                        <div class="p-5">
                            <h2 class="text-primary m-0 text-uppercase"><%=job.getString("role") %></h2>
                            <% 
                            String empId = job.getString("emp_id");
                            String empQuery = "Select company from empdetails where Id = ?;";
                            PreparedStatement q = con.prepareStatement(empQuery);
                            q.setString(1, empId);
                            ResultSet rs = q.executeQuery();
                            rs.next();
                            %>
                            <p class="text-secondary m-0"><%=rs.getString("company") %></p>
                            <div class="d-flex justify-content-around">
                                <div class="flex-fill"><i class="p-2 fa fa-calendar iconcolor"></i><%=job.getInt("duration") %> months</div>
                                <div class="flex-fill"><i class="p-2 fa fa-money iconcolor"></i>₹<%=job.getInt("budget") %></div>
                                <div class="flex-fill"><i class="p-2 fa fa-hourglass-half iconcolor"></i><%=job.getString("exp_date") %></div>
                            </div>
                            <div><i class="p-2 fa fa-cogs iconcolor"></i><%=job.getString("skill") %></div>
                            <div><i class="p-2 fa fa-info iconcolor"></i><%=job.getString("description") %></div>
                            <div class="float-end">
                            <form action="GetJobId" method="post">
                            <input readonly type="hidden" value="<%=job.getString("job_id") %>" name="job_id">
                            <input type="submit" id="submit" value="Apply Now >" style="border:none;background-color:white;" onMouseOver="this.style.color='#6699CC'"  onMouseOut="this.style.color='#007bff'" class="iconcolor">
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
			<%		
				}
			}
			%>
        </div>
    </div>
	<div class="p-5 bg-dark text-white text-center" style="margin-top: 60px">
        <h1>Find Content!!</h1>
    </div>
    <div class="d-flex justify-content-center bg-light">
        &copy;copyrighted to IshiFree!
    </div> 
<%
//String s= (String) request.getParameter("jobId");
//out.print(s);
//jobId.setAttribute("jobId", s);
} catch (SQLException e) {
	e.printStackTrace();
}

%>
</body>
</html>