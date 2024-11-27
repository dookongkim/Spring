<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="/visit/resources/css/visit.css">
		
		<script>
			function del(f){
				let checkpwd=f.pwd.value;
				
				if(checkpwd ==''){
					alert("비밀번호를 입력하세요");
					return;
				}
				if(checkpwd !='${list[0].pwd}'){
					alert("비밀번호가 다릅니다.");
					return;
				}
				if(!confirm ("삭제하시겠습니까?")){
					return;
				}
				f.action="delete_visit.do";
				f.submit();
				
			}
			
			function upd(f){
				
			let checkpwd=f.pwd.value;
				
				if(checkpwd ==''){
					alert("비밀번호를 입력하세요");
					return;
				}
				if(checkpwd !='${list[0].pwd}'){
					alert("비밀번호가 다릅니다.");
					return;
				}
				if(!confirm ("수정 하시겠습니까?")){
					return;
				}
				
				f.action="update_form.do";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<div id="main_box">
			<h1>:::방명록 리스트:::</h1>
			<div align="center">
				<input type="button" value="글쓰기" onclick="location.href='insert_form.do'">
			</div>
		</div>
		
		<c:forEach var="vo" items="${list}">
			<div class="visit_box">
				<div class="type_content"><pre class="pr">${vo.content }</pre></div>
				<div class="type_name">${vo.name } (${vo.ip })</div>
				<div class="type_regdate">${vo.regdate }</div>
				
				<form>
					<input type="hidden" name="idx" value="${vo.idx }">
					비밀번호 : <input type="password" name="pwd">
					<input type="button" value="수정" onclick="upd(this.form)">
					<input type="button" value="삭제" onclick="del(this.form)">
				</form>
				
			</div>
			
		</c:forEach>
		
		<div align="center" style="margin-top:20px; margin-bottom:50px;">
			${pageMenu}
		</div>
		
	</body>
</html>

