<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카카오맵 서비스</title>
<link rel="stylesheet" href="/ex/resources/css/mapServiceStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c441b3b3b2ef1a8131497b58ac1bae64&libraries=services,clusterer,drawing"></script>
<script>
	$(document)
			.ready(
					function() {
						var mapContainer = document.getElementById('map');
						var mapOption = {
							center : new kakao.maps.LatLng(37.4911, 126.7221), // 맵의 중심 좌표
							level : 3
						// 맵의 확대 레벨
						};
						var map = new kakao.maps.Map(mapContainer, mapOption); // 맵을 생성
						var geocoder = new kakao.maps.services.Geocoder();
						var markers = []; // 마커 배열

						// 기존 마커들을 삭제하는 함수
						function clearMarkers() {
							markers.forEach(function(marker) {
								marker.setMap(null); // 맵에서 마커 제거
							});
							markers = []; // 마커 배열 초기화
						}

						// 주소를 좌표로 변환하여 마커를 찍는 함수
						function addMarkerFromAddress(address, name, imageUrl) {
							geocoder
									.addressSearch(
											address,
											function(result, status) {
												if (status === kakao.maps.services.Status.OK) {
													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													var marker = new kakao.maps.Marker(
															{
																position : coords,
																map : map
															});
													markers.push(marker);

													// HTML 특수 문자를 이스케이프하여 안전하게 표시합니다.
													var safeName = encodeHTML(name);
													var safeImageUrl = encodeHTML(imageUrl);

													// InfoWindow를 생성합니다.
													var infowindow = new kakao.maps.InfoWindow();

													// 마커를 클릭하면 인포윈도우에 이미지와 텍스트가 표시되도록 설정합니다.
													var infowindow = new kakao.maps.InfoWindow(
															{
																content: '<div style="padding:5px; font-size:12px;">'
															        + '<div style="margin-bottom:5px;">' // 텍스트 공간
															        + '<strong>' + encodeHTML(name) + '</strong>'
															        + '</div>'
															        + '<hr style="border:1px solid #ddd; margin:5px 0;">' // 선 추가
															        + '<div>' // 이미지 공간
															        + '<img src="' + encodeHTML(imageUrl) + '" style="width:100px; height:auto; display:block;">'
															        + '</div>'
															        + '</div>',
																removable : true
															// InfoWindow 닫기 버튼 활성화
															});

													// 마커에 마우스 오버 시 InfoWindow를 열고 마우스 아웃 시 닫도록 설정합니다.
													kakao.maps.event
															.addListener(
																	marker,
																	'mouseover',
																	function() {
																		infowindow
																				.open(
																						map,
																						marker);
																	});

													kakao.maps.event
															.addListener(
																	marker,
																	'mouseout',
																	function() {
																		infowindow
																				.close();
																	});

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
													map.setCenter(coords);
												} else {
													console.error('주소 변환 실패:',
															address);
												}
											});
						}
						// HTML 특수 문자를 이스케이프하는 함수
						function encodeHTML(str) {
							return str.replace(/&/g, "&amp;").replace(/</g,
									"&lt;").replace(/>/g, "&gt;").replace(/"/g,
									"&quot;").replace(/'/g, "&#039;");
						}
						// 검색 버튼 클릭 시 마커 업데이트
						$('#searchButton')
								.click(
										function() {
											var query = $('#searchInput').val();

											$
													.ajax({
														url : '/ex/searchMarkers',
														method : 'GET',
														data : {
															query : query
														}, // 검색어를 쿼리 파라미터로 전송
														dataType : 'json',
														success : function(data) {
															console
																	.log(
																			'Received data:',
																			data); // 서버에서 받은 데이터를 출력
															if (Array
																	.isArray(data)) {
																clearMarkers(); // 기존 마커 제거
																$(
																		'.search-results')
																		.empty(); // 기존 검색 결과 삭제
																data
																		.forEach(function(
																				markerData) {
																			console
																					.log(
																							'Processing marker:',
																							markerData); // 각 마커 데이터 출력
																			// DTO 필드에 맞게 수정
																			addMarkerFromAddress(
																					markerData.place_address,
																					markerData.place_name,
																					markerData.place_image_url // 이미지 URL
																			);

																			// 검색 결과를 리스트에 추가
																			$(
																					'.search-results')
																					.append(
																							'<li class="search-result-item">'
																									+ '<strong>'
																									+ encodeHTML(markerData.place_name)
																									+ '</strong><br>'
																									+ encodeHTML(markerData.place_address)
																									+ '<br>'
																									+ '<img src="'
																									+ markerData.place_image_url
																									+ '" alt="'
																									+ encodeHTML(markerData.place_name)
																									+ '" style="width:100px; height:auto; margin-top:5px;">'
																									+ '</li>');
																		});
															} else {
																console
																		.error(
																				'Unexpected data format:',
																				data);
															}
														},
														error : function(xhr,
																status, error) {
															console
																	.error(
																			'Error fetching markers:',
																			status,
																			error);
														}
													});
										});

						// 맵 우클릭 시 새로운 마커 추가
						kakao.maps.event
								.addListener(
										map,
										'rightclick',
										function(mouseEvent) {
											var latlng = mouseEvent.latLng;

											var marker = new kakao.maps.Marker(
													{
														position : latlng,
														map : map
													});

											markers.push(marker);

											kakao.maps.event
													.addListener(
															marker,
															'click',
															function() {
																marker
																		.setMap(null);
																markers = markers
																		.filter(function(
																				m) {
																			return m !== marker;
																		});
															});
										});
					});
</script>
</head>
<body>
	<div class="app">
		<header class="header">
			<h1>어디로든 놀러가</h1>
		</header>
		<div class="container">
			<div class="search-section">
				<div class="search-form">
					<input type="text" name="query" placeholder="업체를 검색하세요"
						class="search-input" id="searchInput" />
					<button type="button" class="search-button" id="searchButton">검색</button>
				</div>
				<ul class="search-results">
					<!-- 검색 결과가 여기에 추가됩니다 -->
					<c:forEach var="result" items="${results}">
						<li class="search-result-item"><strong>${result.place_name}</strong><br>
							${result.place_address}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="map" class="map"></div>
		</div>
	</div>
</body>
</html>

