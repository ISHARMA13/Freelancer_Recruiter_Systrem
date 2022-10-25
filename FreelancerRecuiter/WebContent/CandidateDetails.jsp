<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Form</title>
</head>
<body>
<h1>Fill out personal details</h1>

<form action="CandidateDetails" method="post">
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
	<input type="tel" name="workphone" id="workphone" required> <br>
	
	<label for="street">Street:</label>
	<input type="text" name="street" id="street"> <br>
	
	<label for="city">City:</label>
	<input type="text" name="city" id="city" required> <br>
	
	<label for="state">State:</label>
	<input type="text" name="state" id="state" required> <br>
	
	<label for="pin">PINCODE:</label>
	<input type="number" name="pin" id="pin" required> <br>
	
	<hr size=3>
	
	<h1>Education details</h1>
	<label for="university">University:</label>
	<input type="text" name="university" id="university" required> <br>
	
	<label for="degree">Degree:</label>
	<input type="text" name="degree" id="degree"> <br>
	
	<label for="start">Start Date:</label>
	<input type="date" name="start" id="start" required> <br>
	
	<label for="end">End date (expected):</label>
	<input type="date" name="end" id="end" required> <br>
	
	<button>+ Add</button> <br>
	
	<hr size=3>
	
	<h1>Experience details</h1>
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
	
	<button>+ Add</button> <br>
	
	<hr size=3>
	
	<input type="submit" value="Submit">
	
</form>
</body>
</html>