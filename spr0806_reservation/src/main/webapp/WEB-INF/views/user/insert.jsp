<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@include file="../include/header.jsp"%>
<div class="header-placeholder"></div>
<main>
<h4>데이터 입력</h4>
<form action="/ex/user/insert" method="post">
	이메일:<input type="text" name="email"><input type="button" id="checkid" value="중복검사" /><div class="console"></div>
	비밀번호:<input type="text" name="password"><br>
	유저명:<input type="text" name="name"><br>
	전화번호:<input type="text" name="phone"><br>
	<input type="hidden" name="enable" value="1"><br>
	<input type="submit" value="등록"><br>
</form>
</main>



		<!-- 사용자 스크립트 블록 -->
		
		<script type="text/javascript">
			$(function() {
				/** id속성이 "checkid"인 요소에 대한 "click"이벤트 정의 */
				$("#checkid").click(function() {
					// 사용자 입력값 얻어오기
					var input_value = $("input[name='email']").val();

					// 입력여부 검사 input tag에 입력값 없이 버튼 누를시 alert이 실행된다.
					if (!input_value) {
						alert("이메일을 입력하세요.");
						$("input[name='email']").focus();/*focus()는 선택시 활성화되는것*/
						return false;//기본이벤트 막음 
					}
					
					/** 데이터파일의 URL설정 */
					// 실습용 URL - 아이디중복되지 않음
					//var url = "ajax/idcheck/idcheck_ok.xml";
					// 실습용 URL - 아이디중복됨
					// var url = "ajax/idcheck/idcheck_fail.xml";
					// 웹 프로그래밍 연동 (PHP)
					// var url = "ajax/idcheck/idcheck.php";
					// 웹 프로그래밍 연동 (JSP)
					 var url = "/ex/userrest/emailcheck";

					
					/** get방식 ajax 연동 */
					/*
					$.get(url, {
						"email" : input_value
					}, function(data) {
						console.log(data);
						// XML 데이터를 읽어왔을 때, 이 함수의 파라미터는 XML-DOM형태이며, 데이터를 추출하는 방법은 $.ajax()함수와 동일하다.
						// 데이터 로드에 성공한 경우 XML에서 "result"태그의 값을 추출
						var result_text = $(data).find("result").text();
						console.log(result_text);
						// "true" 혹은 "false"라는 문자열이므로, eval함수를 사용하여 boolean값으로 변경
						var result = eval(result_text); //eval은실행 함수()안에 문자열을 실행해 준다. 문자열을 실행코드로 바꿔준다 
						// 결과 출력
						if (result) {
							$(".console").html("<span style='color:blue'>사용할 수 있는 아이디 입니다.</span>");
						} else {
							$(".console").html("<span style='color:red'>사용할 수 없는 아이디 입니다.</span>");
						}
					});
					*/
					 $.ajax({
					        url: '/ex/userrest/emailcheck', // 서버에서 정의한 URL
					        type: 'GET', // HTTP 메서드
					        data: {
					            email: input_value // 서버로 보낼 파라미터
					        },
					        success: function(response) {
					        	console.log(response);
					            // 서버에서 반환된 JSON 데이터를 파싱
					            var result = response.result;
					            console.log(result);
					            // result가 "true"인지 "false"인지 판단하여 사용자에게 메시지 표시
					            if (result === "true") {
					                $(".console").html("<span style='color:blue'>사용할 수 있는 아이디입니다.</span>");
					            } else if (result === "false") {
					                $(".console").html("<span style='color:red'>사용할 수 없는 아이디입니다.</span>");
					            } else {
					                $(".console").html("<span style='color:gray'>알 수 없는 결과입니다.</span>");
					            }
					        },
					        error: function(xhr, status, error) {
					            console.error("AJAX 요청 실패: ", status, error);
					            $(".console").html("<span style='color:red'>서버 요청에 실패했습니다.</span>");
					        }
					    });
					
				});
			});
		</script>
		

