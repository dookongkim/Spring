<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				
				
				f.action="update_visit.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<input type="hidden" name="idx" value="${vo.idx }">
				<tr>
					<th>이름</th>
					<td>
						<input name="name" value="${vo.name }">
					</td>
				</tr>
				<tr>	
					<th>비밀번호</th>
					<td>
						<input name="pwd" value="${vo.pwd }">
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<input name="content" value="${vo.content }">
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