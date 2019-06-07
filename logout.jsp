<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1PM for create</title>
</head>
<body>
   <%
      session.invalidate(); // 접속한 회원의 세션을 빼앗음
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('정상적으로 로그아웃 되셨습니다.')");
        script.println("</script>");
   %>
   <script>   //메인으로 이동
      location.href = 'login.jsp';
   </script>
</body>
</body>
</html>