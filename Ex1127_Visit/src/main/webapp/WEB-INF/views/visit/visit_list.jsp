<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="/visit/resources/css/visit.css">
		
		<script src="/visit/resources/js/httpRequest.js"></script>
		
		<script>
        function del(f) {
        	let pwd=f.pwd.value;
        	let c_pwd=f.c_pwd.value;
        	
            if(c_pwd == ""){
               alert("비밀번호를 입력하세요");
               return;
            }
                    
            let url = "delete.do";
            let param = "idx=" + f.idx.value + "&page=" + f.page.value+"&pwd="+
            pwd+"&c_pwd="+c_pwd+"&filename="+f.filename.value;
            
            sendRequest(url,param,resultFn,"POST");
         }
         
         function resultFn() {
            if( xhr.readyState == 4 && xhr.status == 200 ){
               let data = xhr.responseText;
               let json = (new Function('return ' + data))();
               
               if(!confirm("진짜삭제?")){
                   return;
                }
               if(json[0].res ==="no_pwd"){
            	   alert("비밀번호 불일치");
            	   return;
               }
               if( json[0].res == "네" ){
                  alert("삭제 성공");
               }
               else{
                  alert("삭제 실패");
               }
               
               location.href="list_visit.do?page=${param.page}";
            }
         }
			
			function upd(f){
				let pwd=f.pwd.value;	
				let c_pwd=f.c_pwd.value;
				
				let url="update_password_check.do";
				let param="pwd="+pwd+"&c_pwd="+c_pwd;
			
				sendRequest(url,param,resPwd,"POST");
				
				
			/* 	f.method="POST";
				f.action="update_form.do";
				f.submit(); */
			}
			
			function resPwd(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
		        	let data = xhr.responseText.trim();
		              
	                if(data == 'no_pwd'){
	            	    alert("비밀번호 불일치");
	            	    return;
	                }
	                
	        	    let f= document.getElementById("myf");
	        	    
	        	    f.method="POST";
				    f.action="update_form.do";
				    f.submit();
				}
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
				<div class="type_content">
				<pre class="pr">${vo.content }</pre><br>
					<!-- 이미지가 있는경우만 보여줄거임-->
					<c:if test="${vo.filename ne 'no_file' }">
						<img src="/visit/resources/upload/${vo.filename }" width="330">	
						<!-- visit 경로 못가져오면 ${pageContext.request.contextPath}/resources/upload/ -->
					</c:if>			
				</div>
				
				<div class="type_name">${vo.name } (${vo.ip })</div>
				<div class="type_regdate">${vo.regdate }</div>
				
				<form id="myf">
					<input type="hidden" name="pwd" value="${vo.pwd }">
					<input type="hidden" name="idx" value="${vo.idx }">
					<input type="hidden" name="page" value="${param.page }">
					<input type="hidden" name="filename" value="${vo.filename }">
					
					비밀번호 : <input type="password" name="c_pwd">
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

