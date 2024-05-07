<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
<% 	
	
	//list.jsp에서 id 값 받아오기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");	
	
	Class.forName("org.mariadb.jdbc.Driver");
	String url ="jdbc:mariadb://localhost:3306/jspdb";
	String user ="jsp";
	String password ="1111";
	Connection con = DriverManager.getConnection(url, user, password);
	
	//id값을 조건으로 sql문을 작성하기 update  쓰기 
	String sql = "UPDATE login SET name=?, pwd=? WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	 	pstmt.setString(1, name); // 첫 번째 물음표에 name 값 대입
	    pstmt.setString(2, pwd);  // 두 번째 물음표에 pwd 값 대입
	    pstmt.setString(3, id);   // 세 번째 물음표에 id 값 대입

	    int rowsAffected = pstmt.executeUpdate();

	    pstmt.close();
	    con.close();
%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
		<hr/>
		<form action="updatePro.jsp" method="post">
		  <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" name="id" value="" readonly>
	    </div>
	    <div class="form-group">
	      <label for="name">NAME:</label>
	      <input type="text" class="form-control" id="name" name="name" value="">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd" value="">
	    </div>
	    <br>
	    <div class="text-center">
	    		<input type="submit" value="변경" class="btn btn-secondary">  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp'">
					<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
	
	
	
	
	
	
</body>
</html>