<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
    
<%	
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
	String password = "1111";
	Connection con = DriverManager.getConnection(url, user, password);
	out.println("성공");
	
	

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비 : id, name, pwd 
	String sql = "insert into login(id,name,pwd) values(?,?,?)";

	
	
	
	
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,pwd);
	int i = pstmt.executeUpdate();
	

	
	
	//5. 객체 해제
	pstmt.close();
	con.close();
	
	//list.jsp로 이동하기
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=i %>행이 입력되었습니다!
</body>
</html>