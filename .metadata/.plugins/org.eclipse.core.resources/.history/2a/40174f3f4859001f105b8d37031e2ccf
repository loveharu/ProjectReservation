<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>업체 등록</title>
<link rel="stylesheet" href="/ex/resources/css/uploadStyle.css">
</head>
<body>
	<div class="container">
		<h1>서비스 업체 등록</h1>
		<form action="/ex/file/UploadDB" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="companyName">업체명:</label> <input type="text"
					name="companyName" id="companyName" required>
			</div>

			<div class="form-group">
				<label for="category">카테고리:</label> <select name="category"
					id="category" required>
					<option value="호텔">호텔</option>
					<option value="레스토랑">레스토랑</option>
					<option value="투어">투어</option>
					<option value="교통">교통</option>
				</select>
			</div>

			<div class="form-group">
				<label for="description">업체 설명:</label>
				<textarea name="description" id="description" rows="4" required></textarea>
			</div>

			<div class="form-group">
				<label for="contact">연락처:</label> <input type="text" name="contact"
					id="contact" required>
			</div>

			<div class="form-group">
				<label for="location">위치:</label> <input type="text" name="location"
					id="location" required>
			</div>

			<div class="form-group">
				<label for="file">로고 또는 파일 업로드:</label> <input type="file"
					name="file" id="file">
				<p class="note">업로드할 파일은 최대 5MB 크기 제한이 있습니다.</p>
			</div>

			<input type="submit" value="등록">
		</form>
	</div>
</body>
</html>
