<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
			function logout() {
				location.href ="logout.jsp" //로그아웃 페이지로 이동
			}
	
	</script>
</head>
<body>
<h2>WELCOME!!!</h2>
<%
	//session 객체에서 id를 가져와 변수에 저장한다..
	String id = (String) session.getAttribute("id");

%>
<br>
	<%=id %>님 반갑습니다. <br><br><br>
	<!-- logout.jsp로 이동하는 버튼 -->
	<button name="logout" value="logout" onclick="logout()">logout</button>
</body>
</html>