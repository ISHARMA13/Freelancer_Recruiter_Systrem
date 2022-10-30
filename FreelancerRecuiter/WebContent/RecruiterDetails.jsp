<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-git2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>Details Form</title>
<link rel="icon" href="images/logo.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<h1>Fill out personal details</h1>

<form action="RecruiterDetailsServlet" enctype="multipart/form-data"  method="post" id="DetailsForm">
	<label for="email">Email:</label>
	<input type="email" value="<%=(String) request.getSession(false).getAttribute("email") %>" id="email"> <br>
	
	<label for="firstname">First Name:</label>
	<input type="text" name="firstname" id="firstname" required> <br>
	
	<label for="lastname">Last Name:</label>
	<input type="text" name="lastname" id="lastname" required> <br>
	
	<label for="photo">Upload photo:</label>
	<input type="file" name="photo" id="photo"> <br>
	
	<label for="gender">Gender:</label>
	<select name="gender" id="gender" required>
	  <option value="M">Male</option>
	  <option value="F">Female</option>
	  <option value="O">Choose not to answer</option> 
	</select> <br>
	
	<label for="company">Company:</label>
	<input type="text" name="company" id="company"> <br>
	
	<label for="position">Position:</label>
	<input type="text" name="position" id="position"> <br>
	
	<label for="workphone">Work Phone:</label>
	<input type="number" name="workphone" id="workphone" required min="1000000000" max="9999999999"> <br>
	
	<label for="street">Street:</label>
	<input type="text" name="street" id="street"> <br>
	
	<label for="city">City:</label>
	<input type="text" name="city" id="city" required> <br>
	
	<label for="state">State:</label>
	<input type="text" name="state" id="state" required> <br>
	
	<label for="pin">PINCODE:</label>
	<input type="number" name="pin" id="pin" required min="100000" max="999999"> <br>
	
	<input type="submit" value="Submit" name="submit">
	<label  id="err" ></label>
	
</form>
<script>
console.log("RecruiterDetails.jsp");
</script>
</body>
</html>