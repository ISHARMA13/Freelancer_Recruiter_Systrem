<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Form</title>
<link rel="icon" href="images/logo.ico" type="image/x-icon" />
<script src="http://code.jquery.com/jquery-git2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<form action="CandidateDetailsServlet" enctype="multipart/form-data" method="post" id="DetailsForm">
	<label for="userid">Email:</label>
	<input type="email" value="<%=(String) request.getSession(false).getAttribute("userid") %>" id="userid"> <br>
	
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
	
	<hr size=3>
	
	<h1>Education details</h1>
	<div id="edu">
	<div class="inneredu">
	<label for="university">Institute:</label>
	<input type="text" name="university" id="university" required> <br>
	
	<label for="degree">Degree:</label>
	<input type="text" name="degree" id="degree"> <br>
	
	<label for="start">Start Date:</label>
	<input type="date" name="start" id="start" required> <br>
	
	<label for="end">End date (expected):</label>
	<input type="date" name="end" id="end" required> <br>
	</div>
	</div>
	<div id="edu1"></div>
	<div id="edu2"></div>
	<div style="display:flex">
	<button  id="eduadd">+ Add</button> 
	<button  id="edudel" style="display:none;">- Sub</button>
	</div>
	
	
	<hr size=3>
	
	<h1>Experience details</h1>
	<div id="exp">
	<div class="innerexp">
	<label for="company">Company:</label>
	<input type="text" name="company" id="company" required> <br>
	
	<label for="title">Title:</label>
	<input type="text" name="title" id="title"> <br>
	
	<label for="Xstart">Start Date:</label>
	<input type="date" name="Xstart" id="Xstart" required> <br>
	
	<label for="Xend">End date (expected):</label>
	<input type="date" name="Xend" id="Xend" required> <br>
	
	<label for="description">Description:</label> <br>
	<textarea id="description" name="description" rows="7" cols="50"></textarea> <br>
	</div>
	</div>
	<div id="exp1"></div>
	<div id="exp2"></div>
	<div style="display:flex">
	<button  id="expadd">+ Add</button> 
	<button  id="expdel" style="display:none;">- Sub</button>
	</div>
	
	<hr size=3>
	
	<input type="submit" value="Submit">
	<label  id="err" ></label>
	
</form>
<script src="javascript/educationAdd.js"></script>
<script src="javascript/experienceAdd.js"></script>
<script>
console.log("CandidateDetails.jsp");
</script>
</body>
</html>