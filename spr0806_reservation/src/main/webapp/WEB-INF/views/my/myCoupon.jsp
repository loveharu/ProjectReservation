<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보유한 쿠폰 목록</title>
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
	width: 80%;
	max-width: 1000px;
	box-sizing: border-box;
}

h1 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

table th {
	background-color: #f4f4f4;
	font-weight: bold;
}

table tr:hover {
	background-color: #f9f9f9;
}

.no-coupons {
	text-align: center;
	color: #666;
	font-size: 18px;
	padding: 20px;
}

.coupon-status {
	font-weight: bold;
}

.expired {
	color: #dc3545;
}

.valid {
	color: #28a745;
}
</style>
</head>
<body>
	<div class="container">
		<h1>보유한 쿠폰 목록</h1>
		<c:if test="${empty coupons}">
			<p class="no-coupons">보유한 쿠폰이 없습니다.</p>
		</c:if>
		<c:if test="${not empty coupons}">
			<table>
				<thead>
					<tr>
						<th>쿠폰 코드</th>
						<th>쿠폰 이름</th>
						<th>할인 금액</th>
						<th>유효 기간</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="coupon" items="${coupons}">
						<tr>
							<td>${coupon.code}</td>
							<td>${coupon.name}</td>
							<td>${coupon.discount}원</td>
							<td>${coupon.expiryDate}</td>
							<td
								class="${coupon.status == 'Expired' ? 'expired coupon-status' : 'valid coupon-status'}">
								${coupon.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>
