<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="css/home.css">
<script src="http://code.jquery.com/jquery-git2.js"></script>
<style>
	#jobseeker, #recruiter {
		border: 1px solid;
		border-radius: 5px;
		padding: 20px;
		box-shadow: 5px 10px lightgray;
		width: 40%;
		display: block;
		margin: 100px;
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
</body>
</html>