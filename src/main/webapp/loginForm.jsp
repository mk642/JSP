<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	/* 이미 로그인되어 있는 사용자인지 파악
	   로그인되어 있으면 환영 페이지로 이동하고
	   로그인되어 있지 않다면 로그인폼에서 로그인하도록 한다.
	*/   
	
	// 1. session 객체에 id로 저장되어 있는 값을 파악 
	String id = (String)session.getAttribute("id");
		
	// 2. id값이 있고(null이 아니고) 비어 있지 않다면 welcome.jsp 파일로 이동
	if(id != null && !id.equals("")){
		response.sendRedirect("welcome.jsp"); // 여기서 "welcome.jsp"는 로그인 후 이동할 페이지를 나타냅니다. 실제 경로에 맞게 수정하세요.
	// 3. 아니면 로그인폼 화면 출력
	}else{
	%>
		<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">로그인</h2>
		<hr/>
		<form action="loginAction.jsp" method="post"> <!-- "loginAction.jsp"는 로그인 처리를 담당하는 서블릿 또는 JSP 파일의 경로입니다. 실제 경로에 맞게 수정하세요. -->
		  <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" name="id">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd">
	    </div>
	    <br>
	    <div class="text-center">
				<button  type="submit" class="btn btn-secondary">확인</button>
			</div>
		</form>
	</div>
	<%} %>
</body>
</html>
