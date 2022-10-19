<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
	.box {
		border: 1px solid;
		border-radius: 5px;
		padding: 10px;
		box-shadow: 5px 10px lightgray;
		width: 40%;
		margin:100px auto;
		cursor: pointer;
		text-align:center;
	}
	a {
		text-decoration:none;
		color:black;
    	font-weight:bold;
	}
	a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<div class='box'><a href="candidate.jsp">I am searching for a job/internship.</a></div>
<div class='box'><a href="recruiter.jsp">I am a recruiter.</a></div>
</body>
</html>