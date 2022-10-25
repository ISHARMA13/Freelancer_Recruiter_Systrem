<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	#jobseeker, #recruiter {
		border: 1px solid;
		border-radius: 5px;
		padding: 20px;
		box-shadow: 5px 10px lightgray;
		width: 40%;
		margin: auto;
		cursor: pointer;
		text-align:center;
		text-decoration:none;
	}
	#jobseeker:hover, #recruiter:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<a id='jobseeker' href="CandidateLogin.jsp">I am job seeker.</a>
<a id='recruiter' href="RecruiterLogin.jsp">I am a recruiter.</a>
<div id='login' style="margin:0;padding:0;"></div>
<div id='signup' style="margin:0;padding:0;"></div>
<script type="module" src="javascript/home.js"></script>
</body>
</html>