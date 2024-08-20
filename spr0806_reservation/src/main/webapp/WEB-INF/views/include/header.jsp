<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
	<link rel="stylesheet" href="../resources/css/header.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <header class="header">
        <div class="container">
            <h1 class="logo">MyWebsite</h1>
            <div class="menu-toggle" id="menu-toggle">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
            <nav class="nav" id="nav">
    <ul>
        <li>
            <c:choose>
                <c:when test="${sessionScope.loginAuthority == '관리자'}">
                    <a href="#home">admin Home</a>
                    <a href="#about">About</a>
                    <a href="#services">Services</a>
                    <a href="#contact">Contact</a>
                </c:when>
                <c:when test="${sessionScope.loginAuthority == '매니저'}">
                    <a href="#home">manager Home</a>
                    <a href="#about">About</a>
                    <a href="#services">Services</a>
                    <a href="#contact">Contact</a>
                </c:when>
                <c:when test="${sessionScope.loginAuthority == '사업자회원'}">
                    <a href="#home">vendor Home</a>
                    <a href="#about">About</a>
                    <a href="#services">Services</a>
                    <a href="#contact">Contact</a>
                </c:when>
                <c:when test="${sessionScope.loginAuthority == '일반회원'}">
                    <a href="#home">member Home</a>
                    <a href="#about">About</a>
                    <a href="#services">Services</a>
                    <a href="#contact">Contact</a>
                </c:when>
                <c:otherwise>
                    <a href="#home">default Home</a>
                    <a href="#about">About</a>
                    <a href="#services">Services</a>
                    <a href="#contact">Contact</a>
                </c:otherwise>
            </c:choose>
        </li>
        
        <!-- 로그인 상태에 따른 메뉴 표시 -->
        <li>
            n${sessionScope.loginName},e${sessionScope.loginEmail},a${sessionScope.loginAuthority}
            <c:choose>
                <c:when test="${sessionScope.loginName == null}">
                    <a href="/ex/user/login">로그인</a> | <a href="/ex/user/insert">회원가입</a>
                </c:when>
                <c:otherwise>
                    |${sessionScope.loginName}님 반갑습니다! | <a href="/ex/user/info">회원정보</a> | <a href="/ex/user/logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</nav>

        </div>
    </header>
<!-- <img src="../resources/imgs/fwr.jpg"></img> -->
<!-- 
loginName: <div id="loginName">${sessionScope.loginName}</div><br><br><br>
loginEmail: <div id="loginEmail">${sessionScope.loginEmail }</div>
<br><br>
authority: ${sessionScope.loginAuthority }
<br><br>
<br><br> -->
<!-- 
<c:forEach var="authority" items="${authorities}">
    <li>${authority.authority}</li>
</c:forEach>
 -->
<script src="../resources/js/header.js"></script>

