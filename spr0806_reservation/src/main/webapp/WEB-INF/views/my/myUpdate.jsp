<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 400px;
	max-width: 90%;
}

h1 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	color: #555;
}

.form-group input[type="text"], .form-group input[type="email"],
	.form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group input[type="submit"] {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 10px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.form-group input[type="submit"]:hover {
	background-color: #218838;
}

.form-group .error {
	color: #dc3545;
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정</h1>
		<form action="/ex/my/updateDB" method="get">
			<div class="form-group">
				<label for="username">사용자 이름</label> <input type="text"
					id="username" name="username" value="현재 사용자 이름" required> <span
					class="error"><c:if test="${not empty error.username}">${error.username}</c:if></span>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" value="user@example.com" required> <span
					class="error"><c:if test="${not empty error.email}">${error.email}</c:if></span>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label> <input type="text"
					id="phone" name="phone" placeholder="새 전화번호"> <span
					class="error"><c:if test="${not empty error.password}">${error.password}</c:if></span>
			</div>
			<div class="form-group">
				<input type="submit" value="저장">
			</div>
		</form>
	</div>
</body>
</html>