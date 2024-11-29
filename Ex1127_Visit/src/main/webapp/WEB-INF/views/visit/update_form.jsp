<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				f.method="post";
				f.action="update_visit.do";
				f.submit();
			}
			
			function delImg(f){
				f.filename.value ="no_file";
				
				let img=document.getElementById("m_img");
				img.style.display="none";
				
			}
		</script>  
	</head>
	<body>
		<form enctype="multipart/form-data">
				<input type="hidden" name="idx" value="${vo.idx }">
				<input type="hidden" name="page" value="${param.page }">
				<input type="hidden" name="filename" value="${vo.filename }">
			<table border="1">
				<tr>
					<th>이름</th>
					<td>
						<input name="name" value="${vo.name }">
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<input name="content" value="${vo.content }">
					</td>
				</tr>

				<tr>	
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" value="">
					</td>
				</tr>
				
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="photo">
						<c:if test="${vo.filename ne 'no_file' }">
						<img src="/visit/resources/upload/${vo.filename }" width="100" id="m_img">
						</c:if>
						<input type="button" value="X" onclick="delImg(this.form)">
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="send(this.form)">
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>