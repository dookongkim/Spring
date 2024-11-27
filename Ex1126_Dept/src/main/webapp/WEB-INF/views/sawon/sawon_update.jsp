<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		window.onload=function(){
			let arr_deptno=[10,20,30,40,50];
			let arr_sajob=["사원","주임","대리","과장","부장","이사"];
			let selector_deptno=document.getElementById("selector_deptno");
			let selector_sajob=document.getElementById("selector_sajob");
			
			for(let i=0;i<arr_deptno.length;i++){
				if(arr[i] == "${vo.deptno}"){
					selector_deptno[i].selected=true;
				}
			}
			for(let i=0;i<arr_sajob.length;i++){
				if(arr[i] == "${vo.sajob}"){
					selector_sajob[i].selected=true;
				}
			}
			
		}
		
			function send(f){
				if( !confirm("수정하시겠습니까?")){
					return;
				}
				
				f.action="updfin.do"
				f.submit();
				
			}
			
		</script>
	</head>
	
	<body>
	<form>
		<input type="hidden" name="sabun" value="${vo.sabun } " >
			<table>
				<tr>
					<th>이름</th>
					<td>
						<input name="saname" value="${vo.saname }">
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<input name="sagen" value="${vo.sagen }">
					</td>
				</tr>
				
			
				
				<tr>
					<th>부서번호</th>
					<td>
						<select name="deptno" id="selector_deptno">
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
					<th>직급</th>
					<td>
						<select name="sajob" id="selector_sajob">
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
					<th>상사번호</th>
					<td>
						<input name="samgr" value="${vo.samgr }">
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input name="sapay" value="${vo.sapay }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="send(this.form);"> 
						<input type="button" value="취소" onclick="history.back();"> 
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>