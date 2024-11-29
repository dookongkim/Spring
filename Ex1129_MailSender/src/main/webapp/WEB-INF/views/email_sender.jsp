<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="/mail/resources/js/httpRequest.js"></script>
		
		<script>
			function mailCheck(f){
				let userEmail=f.userEmail.value;
				let url="mailCheck.do";
				let param="email="+encodeURIComponent(userEmail);
				sendRequest(url,param,resultMail,"post");
			}
			let res;
			function resultMail(){
				if(xhr.status==200 && xhr.readyState==4){
					let data=xhr.responseText;
					alert(data);
				}
				
			}
			
			function change_input(){
				
			}
		</script>
	</head>
	<body>
		<form>
			<input name="userEmail">
			<input type="button" value="본인인증" onclick="mailCheck(this.form)">
			
			<input id="check_input" placeholder="인증번호 6자리" disabled="disabled">
			
			<input type="button" value="인증번호 확인" onclick="change_input()">
			
			<div id="mail_check_warn"></div>
		</form>
	</body>
</html>