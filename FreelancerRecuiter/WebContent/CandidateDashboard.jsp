<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.io.PrintStream"%>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Candidate Dashboard</title>
	<link rel="icon" href="images/logo.ico" type="image/x-icon" />
	<script src="http://code.jquery.com/jquery-git2.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      .fakeimg {
        height: 20rem;
        background: #aaa;
      }
    </style>
</head>
<body>
<% 
try {
	String Userid=(String) request.getSession().getAttribute("userid");
	
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	String username = "ishifree"; //MySQL username
	String password = "Freelancer@9876"; //MySQL password
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	//System.out.println("Printing connection object "+con);
	
	String query = "Select * from freedetails where Id=?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1,Userid);
	ResultSet details = stmt.executeQuery();
	details.next();
	byte[] imgData = details.getBytes("photo");
	String encode = Base64.getEncoder().encodeToString(imgData);
    request.setAttribute("imgBase", encode);
	String gender=details.getString("gender");
	if(gender.equals("M")){
		gender="Male";
	} else if(gender.equals("F")) {
		gender="Female";
	} else{
		gender="Not selected";
	}
	
	String[] university = new String[3];
	String[] degree = new String[3];
	String[] start = new String[3];
	String[] end = new String[3];
	query = "Select * from freeeducation where Id=?";
	stmt = con.prepareStatement(query);
	stmt.setString(1,Userid);
	ResultSet details1 = stmt.executeQuery();
	for(int i=0; i<3; i++){
		if(details1.next()){
			university[i]=details1.getString("university");
			degree[i]=details1.getString("degree");
			start[i]=details1.getString("year_start");
			end[i]=details1.getString("year_end");
		}
	}
	
	String[] company = new String[3];
	String[] title = new String[3];
	String[] Xstart = new String[3];
	String[] Xend = new String[3];
	String[] description = new String[3];
	query = "Select * from freeexperience where Id=?";
	stmt = con.prepareStatement(query);
	stmt.setString(1,Userid);
	ResultSet details2 = stmt.executeQuery();
	for(int i=0; i<3; i++){
		if(details2.next()){
			company[i]=details2.getString("company");
			title[i]=details2.getString("title");
			Xstart[i]=details2.getString("start_date");
			Xend[i]=details2.getString("end_date");
			description[i]=details2.getString("description");
		}
	}
%>
	<div class="p-5 bg-primary text-white text-center" style="margin-top: 60px">
        <h1>Welcome to IshiFree!</h1>
        <p>Resize this responsive page to see the effect!</p>
    </div>

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
                    <a class="nav-link active" href="CandidateDashboard.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="SearchAJob.jsp">Jobs</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="MyApplications.jsp">My Applications</a>
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top fakeimg" src="data:image/jpeg;base64,${imgBase}" alt="Card image" />
                    <div class="card-body">
                        <h4 class="card-title">
                        	<%=details.getString("first_name")+ " " + details.getString("last_name") %>
						</h4>
                        <p class="card-text"><%=Userid %></p>
                        <a href="SearchAJob.jsp" class="btn btn-primary">Search Jobs</a>
                    </div>
                </div>
            </div>
            <!-- All Personal Details ahead -->
            <div class="col-md-8">
                <h2>PERSONAL</h2>
                <div class="p-1 bg-dark container-fluid">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Name:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=details.getString("first_name")+ " " + details.getString("last_name") %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Email:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Userid%>
                        </div>
                    </div>               
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Gender:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=gender %>
                        </div>
                    </div>                
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Mobile:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=details.getInt("work_phone") %>
                        </div>
                    </div>            
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Address:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=details.getString("street")+ ", " + details.getString("city")+ ", " + details.getString("state")+ " - " + details.getString("pincode")%>
                        </div>
                    </div>
                </div>
                
                <!-- All Educational Details ahead -->
                <h2 class="mt-5">EDUCATION</h2>
                <div class="p-1 bg-dark container-fluid" id="edu0">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">University:</div>
                        <div class="p-3 flex-fill fw-bold" id="university0">
                            <%=university[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Degree:</div>
                        <div class="p-3 flex-fill fw-bold" id="degree0">
                            <%=degree[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start year:</div>
                        <div class="p-3 flex-fill fw-bold" id="start0">
                            <%=start[0] %>
                        </div>
                    </div>                
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End year:</div>
                        <div class="p-3 flex-fill fw-bold" id="end0">
                            <%=end[0] %>
                        </div>
                    </div>
                </div>
                
                <div class="p-1 bg-dark container-fluid" id="edu1" style="display:none;margin-top:1rem;">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">University:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=university[1] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Degree:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=degree[1] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start year:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=start[1] %>
                        </div>
                    </div>                
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End year:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=end[1] %>
                        </div>
                    </div>
                </div>
                
                <div class="p-1 bg-dark container-fluid" id="edu2" style="display:none;margin-top:1rem;">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">University:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=university[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Degree:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=degree[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start year:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=start[2] %>
                        </div>
                    </div>                
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End year:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=end[2] %>
                        </div>
                    </div>
                </div>
                
                <!-- All Experience Details ahead -->
                <h2 class="mt-5">EXPERIENCE</h2>
                <div class="p-1 bg-dark container-fluid" id="exp0">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Company:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=company[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Title:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=title[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xstart[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End: </div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xend[0] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Description:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=description[0] %>
                        </div>
                    </div>
                </div>
                
                <div class="p-1 bg-dark container-fluid" id="exp1" style="display:none;margin-top:1rem;">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Company:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=company[1] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Title:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=title[1] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xstart[1] %> 
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End: </div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xend[1] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Description:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=description[1] %>
                        </div>
                    </div>
                </div>
                
                <div class="p-1 bg-dark container-fluid" id="exp2" style="display:none;margin-top:1rem;">
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Company:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=company[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justify-content-around">
                        <div class="p-3 flex-fill">Title:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=title[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Start:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xstart[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">End: </div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=Xend[2] %>
                        </div>
                    </div>
                    <div class="d-flex bg-light justfy-content-around">
                        <div class="p-3 flex-fill">Description:</div>
                        <div class="p-3 flex-fill fw-bold">
                            <%=description[2] %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%if(university[1]!=null) { %>
	<script type="text/javascript">
		document.getElementById("edu1").style.display="block";
	</script>
<%} 
if(university[2]!=null) { %>
	<script type="text/javascript">
		document.getElementById("edu2").style.display="block";
	</script>
<%} %>

<%if(company[1]!=null) { %>
	<script type="text/javascript">
		document.getElementById("exp1").style.display="block";
	</script>
<%} 
if(company[2]!=null) { %>
	<script type="text/javascript">
		document.getElementById("exp2").style.display="block";
	</script>
<%} 
con.close();%>

<% } catch (SQLException e) {
	e.printStackTrace();
}
%>

    <div class="p-5 bg-dark text-white text-center" style="margin-top: 60px">
        <h1>Find Content!!</h1>
    </div>
    <div class="d-flex justify-content-center bg-light">
        &copy;copyrighted to IshiFree!
    </div>
</body>
</html>