<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan2.geasipan2"%>
<%@ page import="geasipan2.geasipan2write"%>
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
      if(request.getParameter("number") != null){
         number = Integer.parseInt(request.getParameter("number"));
      }
      if(number == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 글 입니다')");
         script.println("location.href='geasipan2.jsp'");
         script.println("</script>");
      }
      geasipan2 geasipan2 = new geasipan2write().getgeasipan(number);
      if(!userID.equals(geasipan2.getuserID())) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('권한이 없습니다')");
         script.println("location.href='geasipan2.jsp'");
         script.println("</script>");         
      }
      else{
         geasipan2write geasipan2write = new geasipan2write();
         int result = geasipan2write.delete(number);
         if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('삭제에 실패했습니다')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='geasipan2.jsp'");
            script.println("</script>");
         }
      }
   %>
</body>
</html>