<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan.geasipan"%>
<%@ page import="geasipan.geasipanwrite"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>1PM for create</title>
</head>
<body>
   <%
      String userID = null;

      if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
         userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
      }
      if (userID == null) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('회원만 이용이 가능합니다.')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
      } 
      
      int number = 0;
      if (request.getParameter("number") != null) {
         number = Integer.parseInt(request.getParameter("number"));
      }
      if (number == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 글 입니다.')");
         script.println("location.href = 'geasipan.jsp'");
         script.println("</script>");
      }
      geasipan geasipan = new geasipanwrite().getgeasipan(number);
      if (!userID.equals(geasipan.getuserID())) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다.')");
         script.println("location.href = 'geasipan.jsp'");
         script.println("</script>");            
      } else {
         if (request.getParameter("title") == null || request.getParameter("content") == null
               || request.getParameter("title").equals("") || request.getParameter("content").equals("") ) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            geasipanwrite geasipanwrite = new geasipanwrite();
            int result = geasipanwrite.update(number, request.getParameter("title"), request.getParameter("content"));
            if (result == -1) {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('수정에 실패했습니다')");
               script.println("history.back()");
               script.println("</script>");
            } else {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href='geasipan.jsp'");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
</body>
</html>