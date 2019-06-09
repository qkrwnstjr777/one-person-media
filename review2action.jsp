<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="geasipan.geasipanwrite"%>
<%@ page import="review2.review2write"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8"); 
%>
<jsp:useBean id="geasipan2" class="geasipan2.geasipan2" scope="page" />
<jsp:setProperty name="geasipan2" property="number"/>
<jsp:useBean id="review2" class="review2.review2" scope="page" />
<jsp:setProperty name="review2" property="content"/>

<%
   System.out.println(review2);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1PM for create</title>
</head>
<body>
   <%
      String userID = null;
      if (session.getAttribute("userID") != null) 
      {
         userID = (String) session.getAttribute("userID");
      }
      if (userID == null) 
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('회원만 작성이 가능합니다.')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
      } else {
         if (review2.getcontent() == null) 
         {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            review2write geasipan2write = new review2write();
            int result = geasipan2write.reviewwriter(userID, review2.getcontent(), geasipan2.getnumber());
            if (result == -1) 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('댓글 등록에 실패했습니다')");
               script.println("history.back()");
               script.println("</script>");
            } else 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href='geasipan2.jsp'");
               script.println("alert('댓글 등록에 성공했습니다.')");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
</body>
</html>