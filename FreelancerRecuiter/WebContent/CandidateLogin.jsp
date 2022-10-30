<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Login Form</title>
<link rel="icon" href="images/logo.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/home.css">
<script src="http://code.jquery.com/jquery-git2.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	<span id="login" onclick="LoginForm(0)">Login</span> <span id="signup" onclick="SignUpForm(0)">Sign Up</span>
	</div>
	<div id="displayForm">
		<form action="#" method="post" id="LoginForm" name="LoginForm" >
			<div class="form-element">
				<label for="emailid">Email:</label><br>
				<input type="email" name="username" id="emailid">
			</div>
			<div class="form-element">
				<label for="pass">Password:</label><br>
				<input type="password" name="password" id="pass">
			</div>
			<div class="form-element">
				<input type="submit" value="Login" name="submit">
			</div>
			
		</form>
	<label id="err" style="font-size:1rem;color:red;"></label>	
	</div>
</div>
</section>
<footer></footer>
<div id="jobseeker"></div>
<div id="recruiter"></div>
</div>
<script>
console.log("CandidateLogin.jsp");

const form = document.getElementById("LoginForm");
form.addEventListener("submit", (e) => {
 	e.preventDefault();
	const data = $('form').serialize();
	axios
	  .post("CandidateLoginServlet",data , {
	    headers: {
	      "Content-Type": "application/x-www-form-urlencoded"
	    },
	  })
	  .then((res) => {
		if(res.data=="0"){
			window.location="CandidateDashboard.jsp";
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