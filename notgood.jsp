<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan.geasipan"%>
<%@ page import="geasipan.geasipanwrite"%>
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

      if (session.getAttribute("userID") != null) { 
         userID = (String) session.getAttribute("userID");
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
      geasipanwrite geasipanwrite = new geasipanwrite();
      int notgood = geasipanwrite.notgood(number);
      if (notgood == -1) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('게시글 비추천에 실패했습니다')");
         script.println("history.back()");
         script.println("</script>");
      } else {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('게시글을 비추천 하였습니다')");
         script.println("location.href='geasipan.jsp'");
         script.println("</script>");
      } 

         %>
</body>
</html>