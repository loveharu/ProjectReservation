<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4; /* 연한 회색 배경 */
	color: #333;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff; /* 하얀색 배경 */
	border-radius: 10px; /* 둥근 모서리 */
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
}

.profile-header {
	display: flex;
	align-items: center;
	border-bottom: 2px solid #d84315; /* 진한 주황색 테두리 */
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.profile-header .profile-picture {
	width: 120px;
	height: 120px;
	border-radius: 50%; /* 둥근 프로필 사진 */
	overflow: hidden;
	margin-right: 20px;
}

.profile-header .profile-picture img {
	width: 100%;
	height: auto;
}

.profile-header .profile-info {
	display: flex;
	flex-direction: column;
}

.profile-header .profile-info h1 {
	margin: 0;
	font-size: 24px;
	color: #d84315; /* 진한 주황색 */
}

.profile-header .profile-info p {
	margin: 5px 0;
	font-size: 16px;
}

.section {
	margin-bottom: 20px;
}

.section h2 {
	border-bottom: 2px solid #d84315; /* 진한 주황색 테두리 */
	padding-bottom: 10px;
	margin-bottom: 10px;
	font-size: 20px;
}

.account-settings, .order-history, .coupons-points {
	background-color: #fff; /* 하얀색 배경 */
	border: 1px solid #d84315; /* 진한 주황색 테두리 */
	border-radius: 10px; /* 둥근 모서리 */
	padding: 20px;
}

.account-settings form input, .account-settings form button {
	display: block;
	width: 50%;
	hieght: 50%;
	margin-bottom: 10px;
	padding: 10px;
	font-size: 16px;
}

.account-settings form button {
	background-color: #d84315; /* 진한 주황색 배경 */
	color: #fff; /* 흰색 글씨 */
	border: none;
	cursor: pointer;
	border-radius: 5px; /* 둥근 모서리 */
}

.order-history table, .coupons-points table {
	width: 100%;
	border-collapse: collapse;
}

.order-history th, .coupons-points th, .order-history td,
	.coupons-points td {
	padding: 10px;
	border-bottom: 1px solid #d84315; /* 진한 주황색 테두리 */
}

.order-history th, .coupons-points th {
	background-color: #f4f4f4; /* 연한 회색 배경 */
}

.order-history tr:nth-child(even), .coupons-points tr:nth-child(even) {
	background-color: #f9f9f9; /* 더 연한 회색 배경 */
}

.logout-button {
	background-color: #d84315; /* 진한 주황색 배경 */
	color: #fff; /* 흰색 글씨 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px; /* 둥근 모서리 */
	display: block;
	margin: 20px auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="profile-header">
			<div class="profile-picture">
				<img src="profile-picture.jpg" alt="프로필 사진">
			</div>
			<div class="profile-info">
				<h1>사용자 이름</h1>
				<p>이메일: user@example.com</p>
				<p>가입일: YYYY-MM-DD</p>
			</div>
		</div>

		<div class="section account-settings">
			<h2>계정 설정</h2>
				<form action="/ex/my/myUpdate" method="get">
				<input type="hidden" value="${userId}" name="userId">
				<button type="submit">회원정보 수정하러 가기</button>
			</form>
		</div>

		<div class="section order-history">
			<h2>주문 내역</h2>
			<table>
				<thead>
					<tr>
						<th>주문 번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>#12345</td>
						<td>상품 1</td>
						<td>1</td>
						<td>₩10,000</td>
						<td>배송 중</td>
					</tr>
					<tr>
						<td>#12346</td>
						<td>상품 2</td>
						<td>2</td>
						<td>₩20,000</td>
						<td>배송 완료</td>
					</tr>
					<!-- 추가 주문 내역이 있다면 여기에 삽입 -->
				</tbody>
			</table>
		</div>

		<div class="section coupons-points">
			<h2>쿠폰 및 포인트</h2>
			<table>
				<thead>
					<tr>
						<th>쿠폰 코드</th>
						<th>할인 금액</th>
						<th>만료일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>COUPON123</td>
						<td>₩5,000</td>
						<td>YYYY-MM-DD</td>
					</tr>
					<!-- 추가 쿠폰이 있다면 여기에 삽입 -->
				</tbody>
			</table>
		</div>

		<button class="logout-button">로그아웃</button>
	</div>
</body>
</html>
