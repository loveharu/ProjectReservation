<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<link rel="stylesheet" href="/ex/resources/css/mainStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 메뉴 토글 기능
		function toggleMenu() {
			var dropdownMenu = $("#dropdown-menu");
			dropdownMenu.toggle();
		}

		// 메뉴 버튼 클릭 이벤트
		$(".menu-button").click(toggleMenu);

		// 검색 기능 AJAX
		$(".search-form").submit(function(e) {
			e.preventDefault(); // 폼의 기본 동작 중단
			var searchQuery = $(this).find("input").val();
			$.ajax({
				url : "/ex/search", // 서버의 검색 처리 URL로 변경해야 함
				method : "GET",
				data : {
					query : searchQuery
				},
				success : function(response) {
					// 검색 결과를 표시할 HTML 업데이트
					$(".content-container").html(response);
				},
				error : function() {
					alert("검색에 실패했습니다.");
				}
			});
		});

		// 공지사항 AJAX 로드
		function loadNotices() {
			$.ajax({
				url : "/ex/notices", // 공지사항 데이터를 가져올 URL로 변경해야 함
				method : "GET",
				success : function(response) {
					$("section").html(response);
				},
				error : function() {
					alert("공지사항 로드에 실패했습니다.");
				}
			});
		}

		// 사용자 정보 AJAX 로드
		function loadUserInfo() {
			$.ajax({
				url : "/ex/userInfo", // 사용자 정보를 가져올 URL로 변경해야 함
				method : "GET",
				success : function(response) {
					$("aside").html(response);
				},
				error : function() {
					alert("사용자 정보 로드에 실패했습니다.");
				}
			});
		}

		// 페이지 로드 시 공지사항과 사용자 정보 로드
		loadNotices();
		loadUserInfo();
	});
</script>
</head>
<body>
	<header>
		<div class="header-left">
			<a href="#" class="logo">A</a>
		</div>
		<div class="header-center">
			<form class="search-form">
				<input type="text" placeholder="검색어를 입력하세요...">
				<button type="submit">검색</button>
			</form>
			<div class="icon-buttons">
				<div class="icon">아이콘 1</div>
				<div class="icon">아이콘 2</div>
				<div class="icon">아이콘 3</div>
				<div class="icon">아이콘 3</div>
				<div class="icon">아이콘 3</div>
				<!-- 추가 아이콘을 여기서 추가하세요 -->
			</div>
		</div>
		<div class="header-right">
			<button class="menu-button">☰</button>
			<div id="dropdown-menu" class="dropdown-menu">
				<a href="/ex/my/myPage">마이 페이지</a> <a href="/ex/my/myCart">장바구니</a>
				<a href="/ex/my/myCoupon">쿠폰함</a> <a href="/ex/file/fileUpload">업체
					등록하러 가기</a>
			</div>
		</div>
	</header>

	<div class="content-container">
		<!-- 슬라이더와 섹션, 사이드바는 AJAX로 로드된 콘텐츠로 대체됩니다. -->
		<nav>
			<div class="slider-container">
				<div class="slider-wrapper">
					<div class="slider-item">
						<!-- <img src="/ex/resources/img/image1.jpg" alt="슬라이드 이미지 1"> -->
					</div>
					<div class="slider-item">
						<!-- <img src="/ex/resources/img/image2.jpg" alt="슬라이드 이미지 1"> -->
					</div>
					<div class="slider-item">
						<!-- <img src="/ex/resources/img/image3.jpg" alt="슬라이드 이미지 1"> -->
					</div>
					<!-- 추가 이미지가 있다면 여기에 삽입 -->
				</div>
			</div>
		</nav>
		<section>
			<h2>지도 서비스</h2>
			<button onclick="location.href='/ex/map/mapService'">지도 서비스로
				이동</button>
			<!-- 지도 서비스 페이지로 이동하는 버튼 -->
		</section>
		<section>
			<h2>공지사항</h2>
			<!-- 공지사항이 AJAX로 로드됩니다. -->
		</section>
		<aside>
			<h3>사용자 정보</h3>
			<!-- 사용자 정보가 AJAX로 로드됩니다. -->
		</aside>
	</div>
</body>
</html>

