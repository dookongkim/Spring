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
		test2.do가 호출되었을 때 보여지는 jsp <br>
	
			IP : ${ip } <br>
		<ul>
			<c:forEach var="f" items="${fruit }">
				<li>${ f }</li>
			</c:forEach>
		</ul>
	
	</body>
</html>