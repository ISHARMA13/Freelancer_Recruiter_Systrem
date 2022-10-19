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
		padding: 10px;
		box-shadow: 5px 10px lightgray;
		width: 40%;
		margin:100px auto;
		cursor: pointer;
		text-align:center;
	}
	#jobseeker:hover, #recruiter:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<div id='jobseeker'>I am searching for a job/internship.</div>
<div id='recruiter'>I am a recruiter.</div>
<div id="login"></div>
<div id="signup"></div>
<script src="javascript/home.js"></script>
</body>
</html>