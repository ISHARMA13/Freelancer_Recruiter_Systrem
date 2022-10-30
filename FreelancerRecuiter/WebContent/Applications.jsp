<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.io.PrintStream"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply here</title>
<style>
form{
padding:1rem;
margin:0.5rem;
}
input{
padding:0.5rem;
margin:0.5rem;
}
label{
padding:1rem;
margin:0.5rem;
}
button{
padding:0.5rem;
margin:0.5rem;
width:7rem;
}
select{
padding:0.5rem;
margin:0.5rem;
width:7rem;
}
</style>
</head>
<body>
<%
try{
	String job_id = (String) request.getSession(false).getAttribute("job_id");
	out.print(job_id);
}
catch(Exception e)
{
e.printStackTrace();
}
%>
<h1>Fill out the Application Form:</h1>
<form action="SubmitApplicationServlet" method="post" id="DetailsForm">
	<label for="jobid">Job Id:</label>
	<input type="email" readonly value="<%=(String) request.getSession(false).getAttribute("job_id") %>" id="jobid"> <br>
	
	<label for="duration">How much time (in months) do you require to get task done?</label>
	<input type="number" name="duration" id="duration" required> <br>
	
	<label for="budget">How much is your bid?</label>
	<input type="number" name="budget" id="budget" required> <br>
	
	<label for="cover">Add a Cover Letter:</label><br>
	<textarea id="cover" name="cover" rows="7" cols="50"></textarea> <br>
	
	<input type="submit" value="Submit" name="submit">
	<label  id="err" ></label>
	
</form>

</body>
</html>