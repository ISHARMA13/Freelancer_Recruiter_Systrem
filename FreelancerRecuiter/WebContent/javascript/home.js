document.getElementById("jobseeker").addEventListener('click', CandidateLogin);
document.getElementById("recruiter").addEventListener('click', RecruiterLogin);

let isCandidate=0;
let isRecruiter=0;

function home() {
	var code=`<div id='jobseeker'>I am searching for a job/internship.</div>
		<div id='recruiter'>I am a recruiter.</div>
		<script src="javascript/home.js"></script>`;
	document.querySelector("body").innerHTML=code;
	document.getElementById("jobseeker").addEventListener('click', CandidateLogin);
	document.getElementById("recruiter").addEventListener('click', RecruiterLogin);
}

function CandidateLogin() {
	isCandidate=1;
	isRecruiter=0;
	console.log("CandidateLogin");
	var code = `<div id="home" class="w3-padding w3-xlarge w3-teal">
			<i class="fa fa-home"></i>
		</div>
		<div id="root">
		<section>
		<div id="content">
			<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="CandidateLogin.java" method="post" id="LoginForm">
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
		<script src="javascript/home.js"></script>`;
	document.querySelector("body").innerHTML=code;
	document.getElementById("login").addEventListener("click", LoginForm);
	document.getElementById("signup").addEventListener("click", SignUpForm);
	document.getElementById("home").addEventListener("click", home);
}


function RecruiterLogin() {
	isRecruiter=1;
	isCandidate=0;
	console.log("RecruiterLogin");
	var code = `<div id="home" class="w3-padding w3-xlarge w3-teal">
			<i class="fa fa-home"></i>
		</div>
		<div id="root">
		<section>
		<div id="content">
			<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="RecuiterLogin.java" method="post" id="LoginForm">
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
		<script src="javascript/home.js"></script>`;
	document.querySelector("body").innerHTML=code;
	document.getElementById("login").addEventListener("click", LoginForm);
	document.getElementById("signup").addEventListener("click", SignUpForm);
	document.getElementById("home").addEventListener("click", home);
}

function LoginForm() {
	var word;
	if(isRecruiter) {
		word=`Recruiter`;
	} else {
		word=`Candidate`;
	}
	console.log("LoginForm");
	var first = `<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="`;
	var last = `Login.java" method="post" id="LoginForm">
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
		</div>`;
	let myForm = first.concat(word, last);
	document.getElementById("content").innerHTML=myForm;
	document.getElementById("signup").addEventListener("click", SignUpForm);
}

function SignUpForm() {
	var word;
	if(isRecruiter) {
		word=`Recruiter`;
	} else {
		word=`Candidate`;
	}
	console.log("SignUpForm");
	var first = `<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="`;
	var last = `SignUp.java" method="post" id="LoginForm">
		<div class="form-element">
			<span>Email</span><br>
			<input type="email" name="email">
		</div>
		<div class="form-element">
			<span>Username</span><br>
			<input type="text" name="username">
		</div>
		<div class="form-element">
			<span>Password:</span><br>
			<input type="password" name="password">
		</div>
		<div class="form-element">
			<input type="submit" value="Sign Up">
		</div>
		</form></div>`;
	let myForm = first.concat(word, last);
	document.getElementById("content").innerHTML=myForm;
	document.getElementById("login").addEventListener("click", LoginForm);
}

