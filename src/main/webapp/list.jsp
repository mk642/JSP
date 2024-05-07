<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
  //DB 연동
  //한글처리
    request.setCharacterEncoding("utf-8");
//폼에서 전달된 파라메터 받기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	//1. DB 연동 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. 연결 객체 생성
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "jsp";
	String password  = "1111";
	

	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	String sql = "select * from login";
	ResultSet rs = stmt.executeQuery(sql);
	
	
    // 자원 해제
     rs.close();
     stmt.close();
     con.close(); 
     
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>
		<h1 class="text-center font-weight-bold">사용자 정보</h1><br>
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
			</tr>
		<%
    //화면출력
    while(rs.next()) {
        String userId = rs.getString("id");
        String userName = rs.getString("name");
        String userPwd = rs.getString("pwd");
%>
<tr>
    <td><a href ="updateForm.jsp?id=<%=userId%>"><%=userId%></a></td>
    <td><%=userName%></td>
    <td><%=userPwd%></td>
</tr>
<% } %>

			
			
		 	
		 		
		 	
				
        
		</table>
	</div>
	
	
	
	
</body>
</html>