<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	// 1. 로그인을 위해 id와 pwd를 login 폼에서 가지고 올 것
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 2. DB 연동 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
  // 3. 연결 정보와 SQL
	
	String url = "jdbc:mariadb://localhost:3306/jspdb"; 
    String user = "jsp"; // 데이터베이스 사용자 이름
    String passwd = "1111"; // 데이터베이스 비밀번호
	// 4. 연결 객체 생성
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	// 5. 생성된 연결을 통해 SQL문 실행 의뢰 준비 : 얻어온 id 값과 pwd 값을 가진 사용자가 존재하는 지 파악하는 SQL문
	 String sql = "SELECT * FROM login WHERE id=? AND pwd=?";
	 PreparedStatement pstmt =con.prepareStatement(sql);	
		
	// 6. SQL 실행
		ResultSet rs = pstmt.executeQuery();
		pstmt.setString(1,id);
		pstmt.setString(2,pwd);
		
	// 7. SQL문의 결과값이 있으면 해당 사용자가 DB에 있다는 의미임으로 session에 해당 사용자의 id를 저장하고 welcome.jsp 파일로 이동
		if(rs.next()){
			session.setAttribute("id", id);
			response.sendRedirect("welcome.jsp");
	
	// 8. 해당사용자가 없다면  다음의 메시지를 출력하고 insertForm.jsp로 이동하게 한다..
		}else{
		%>
		<script type="text/javascript">
			if(confirm("존재하지 않는 사용자입니다. 등록하시겠습니까?")==true){
				location.href='insertForm.jsp';
			}else{
				history.back();
			}
		</script>
	<%}%>



