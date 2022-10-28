<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Login</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="javascript/Forms.js"></script>
</head>
<body>
<div id="home" class="w3-padding w3-xlarge w3-teal">
	<a href="home.jsp"><i class="fa fa-home"></i></a>
</div>
<div id="root">
<section>
<div id="content">
	<div id="head">
	<span id="login" onclick="LoginForm(1)">Login</span> <span id="signup" onclick="SignUpForm(1)">Sign Up</span>
	</div>
	<div id="displayForm">
		<form action="#" method="post" id="LoginForm">
			<div class="form-element">
				<label for="emailid">Email:</label><br>
				<input type="text" name="username" id="emailid">
			</div>
			<div class="form-element">
				<label for="pass">Password:</label><br>
				<input type="password" name="password" id="pass">
			</div>
			<div class="form-element">
				<input type="submit" value="Login" name="submit">
			</div>
		</form>
	</div>
</div>
</section>
<footer></footer>
<div id="jobseeker"></div>
<div id="recruiter"></div>
</div>
<script>
console.log("RecuiterLogin.jsp");

const form = document.getElementById("LoginForm");
form.addEventListener("submit", (e) => {
 	e.preventDefault();
	const data = $('form').serialize();
	axios
	  .post("RecruiterLoginServlet",data , {
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