<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				f.method="post";
				f.action="insert_visit.do";
				f.submit();
			}
		</script>
		
	</head>
	<body>
		<form>
			<table border="1">
				<tr>
					<th>이름</th>
					<td>
						<input name="name">
					</td>
				</tr>
				<tr>	
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<input name="content">
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