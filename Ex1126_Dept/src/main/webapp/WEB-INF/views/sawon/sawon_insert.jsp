<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let saname=f.saname.value;
				let sagen=f.sagen.value;
				let deptno=f.deptno.value;
				let sajob=f.sajob.value;
				let samgr=f.samgr.value;
				let sapay=f.sapay.value;
				
				if(saname===''){
					alert("이름을 입력하세요");
					return;
				}
				if(sagen===''){
					alert("성별을 입력하세요");
					return;
				}
				if(deptno===''){
					alert("부서를 입력하세요");
					return;
				}
				if(sajob===''){
					alert("직급을 입력하세요");
					return;
				}
				
				let num_patt=/^[0-9]+$/;
				
			 	if( !num_patt.test(samgr) || samgr==='' ){
					alert("상사번호는 정수로 입력하세요");
					return;
				}
				if( !num_patt.test(sapay) || sapay==='' ){
					alert("급여는 정수로 입력하세요");
					return;
				} 
				
				f.action="insertFin.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				
				<tr>
					<th>부서번호</th>
					<td>
						<select name="deptno">
							<option value="">부서를 선택하세요</option>
							<option value="10">총무부</option>
							<option value="20">영업부</option>
							<option value="30">전산실</option>
							<option value="40">관리부</option>
							<option value="50">경리부</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input name="saname">
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<select name="sagen">
							<option value="">성별을 선택하세요</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직급</th>
					<td>
						<select name="sajob">
							<option value="">직급을 선택하세요</option>
							<option value="사원">사원</option>
							<option value="주임">주임</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="부장">부장</option>
							<option value="이사">이사</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>입사일</th>
					<td>
						<input name="sahire" type="date">
					</td>
				</tr> 
				
				<tr>
					<th>상사번호</th>
					<td>
						<input name="samgr">
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input name="sapay">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="추가" onclick="send(this.form);"> 
						<input type="button" value="취소" onclick="history.back();"> 
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>