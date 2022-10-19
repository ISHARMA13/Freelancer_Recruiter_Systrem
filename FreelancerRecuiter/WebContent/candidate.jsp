<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Login</title>
<style>
	body {
		margin:0;
	}
	#root{margon:auto;}
	section {
		width:50%;
		display:block;
		margin: 50px auto;	
		padding: 32px;	
		border-radius:10%;
		border-color:transparent;
		box-shadow:0px 0px 36px -20px #515151;
	}
	#content {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	#head {
		display:flex;
		flex-direction:row;
		padding:20px;
	}
	#login, #signup {
		padding:20px;		
	}
	#login:hover, #signup:hover {
		background-color:#fff;
		border-radius:10%;
		border-color:transparent;
		box-shadow:0px 0px 36px -20px #515151;
	}
	#LoginForm {
		display:flex;
		flex-direction: column;
		justify-content: space-around;
		margin: 0 40px;
	}
	.form-element {
		margin-top:20px;
	}
	footer {
		height: 30%;
		width:100%;
		position: fixed;
		bottom: 0;
		left:0;
		margin:0;
		border-radius: 25% 25% 0px 0px;
		background-color: #388EE9;
		z-index:-1;
	}
</style>
</head>
<body>
<div id="root">
<section>
<div id="content">
	<div id="head">
	<span id="login">Login</span> <span id="signup">Sign Up</span>
	</div>
	<div id="displayForm">
		<form action="login.java" method="post" id="LoginForm">
			<div class="form-element">
				<span>Username / Email</span><br>
				<input type="text" name="username">
			</div>
			<div class="form-element">
				<span>Password:</span><br>
				<input type="password" name="password">
			</div>
			<div class="form-element">
				<input type="submit" value="Login">
			</div>
		</form>
	</div>
</div>
</section>
<footer></footer>
</div>


<script>
document.getElementById("login").addEventListener("click", LoginForm);
document.getElementById("signup").addEventListener("click", SignUpForm);
function LoginForm() {
	var myForm = `<form action="login.java" method="post" id="LoginForm">
				<div class="form-element">
					<span>Username / Email</span><br>
					<input type="text" name="username">
				</div>
				<div class="form-element">
					<span>Password:</span><br>
					<input type="password" name="password">
				</div>
				<div class="form-element">
					<input type="submit" value="Login">
				</div>
</form>`;
	document.getElementById("displayForm").innerHTML=myForm;
}

function SignUpForm() {
	var myForm = `<form action="signup.java" method="post" id="LoginForm">
				<div class="form-element">
					<span>Email</span><br>
					<input type="email" name="email">
				</div>
				<div class="form-element">
					<span>Username / Email</span><br>
					<input type="text" name="username">
				</div>
				<div class="form-element">
					<span>Password:</span><br>
					<input type="password" name="password">
				</div>
				<div class="form-element">
					<input type="submit" value="Sign Up">
				</div>
			</form>`;
	document.getElementById("displayForm").innerHTML=myForm;
}
</script>

</body>
</html>