<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post a job</title>
<link rel="icon" href="images/logo.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
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
<h1>Enter job details below:</h1>
<form action="PostedJobServlet"  method="post">
	<label for="employer_id">Email:</label>
	<input type="email" readonly value="<%=(String) request.getSession(false).getAttribute("email") %>" id="employer_id"> <br>
	
	<label for="role">Job Title:</label>
	<input type="text" name="role" id="role" required> <br>
	
	<label for="duration">How many months do a freelancer get to complete the job?</label>
	<input type="number" name="duration" id="duration" required> <br>
	
	<label for="budget">Enter the Budget in INR:</label>
	<input type="number" name="budget" id="budget" required min="1"> <br>
	
	<label for="skills">Skills Needed to complete the task:</label>
	<input type="text" name="skills" id="skills" required> <br>
	
	<label for="description">Describe the work to be done:</label><br>
	<textarea id="description" name="description" rows="7" cols="50"></textarea> <br>
	
	<label for="expiry">Till when a person can apply?</label>
	<input type="date" name="expiry" id="expiry" required> <br>
	
	<input type="submit" value="Submit" name="submit">
	<label  id="err" ></label>
	
</form>

<script>
document.getElementById('posted').value = new Date();
</script>

</body>
</html>