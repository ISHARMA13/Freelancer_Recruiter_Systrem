<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Form</title>
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
.inneredu{
border-bottom: 1px solid black;
}
.innerexp{
border-bottom: 1px solid black;
}
</style>
</head>
<body>

<h1>Fill out personal details</h1>

<form action="CandidateDetailsServlet" method="post" id="DetailsForm">
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
	<input type="tel" name="workphone" id="workphone" required> <br>
	
	<label for="street">Street:</label>
	<input type="text" name="street" id="street"> <br>
	
	<label for="city">City:</label>
	<input type="text" name="city" id="city" required> <br>
	
	<label for="state">State:</label>
	<input type="text" name="state" id="state" required> <br>
	
	<label for="pin">PINCODE:</label>
	<input type="number" name="pin" id="pin" required oninput=""> <br>
	
	<input type="submit" value="Submit" name="submit">
	
</form>
<script>
console.log("RecruiterDetails.jsp");

const form = document.getElementById("DetailsForm");
form.addEventListener("submit", (e) => {
 	e.preventDefault();
	const data = $('form').serialize();
	axios
	  .post("RecruiterDetailsServlet",data , {
	    headers: {
	      "Content-Type": "application/x-www-form-urlencoded"
	    },
	  })
	  .then((res) => {
		if(res.data=="0"){
			window.location="RecruiterDashboard.jsp";
		}
		else{
		document.getElementById("err").innerHTML=res.data;
		}
		console.log(res);
	  })
	  .catch((err) => {
	    console.log(err);
	  });
});
</script>
</body>
</html>