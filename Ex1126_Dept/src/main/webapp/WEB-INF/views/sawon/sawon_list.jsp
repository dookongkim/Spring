<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>:::사원목록:::</caption>
			
			<tr>
				<th colspan="9" align="center">
					<c:if test="${list[0].deptno eq 10 }">
						총무부
					</c:if>
				
					<c:if test="${list[0].deptno eq 20 }">
						영업부
					</c:if>
				
					<c:if test="${list[0].deptno eq 30 }">
						전산실
					</c:if>

					<c:if test="${list[0].deptno eq 40 }">
						관리부
					</c:if>
		
					<c:if test="${list[0].deptno eq 50 }">
						경리부
					</c:if>
				</th>
			</tr>
			
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서번호</th>
				<th>직급</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>급여</th>
				<th>기타</th>
			</tr>
			
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.sabun }</td>
					
					<td>
					<a href="#" onclick="location.href='gogek_list.do?sabun=${vo.sabun}&saname=${vo.saname}'">${vo.saname }</a>
					</td>
					
					<td>${vo.sagen }</td>
					<td>${vo.deptno }</td>
					<td>${vo.sajob }</td>
					<td>${vo.sahire }</td>
					<td>${vo.samgr }</td>
					<td>${vo.sapay }</td>
					
					<td colspan="2">
						<input type="button" value="수정" onclick="location.href='update.do?sabun=${vo.sabun}'">
						<input type="button" value="삭제" onclick="location.href='sawon_del.do?sabun=${vo.sabun}&deptno=${vo.deptno}'">
					</td>
				</tr>
			</c:forEach>
			
		</table>	
					<input type="button" value="뒤로" onclick="history.back()">
	</body>
</html>