<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="geasipan.geasipanwrite"%>
<%@ page import="review.reviewwrite"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8"); 
%>
<jsp:useBean id="geasipan" class="geasipan.geasipan" scope="page" />
<jsp:setProperty name="geasipan" property="number"/>
<jsp:useBean id="review" class="review.review" scope="page" />
<jsp:setProperty name="review" property="content"/>

<%
   System.out.println(review);
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
         if (review.getcontent() == null) 
         {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            reviewwrite geasipanwrite = new reviewwrite();
            int result = geasipanwrite.reviewwriter(userID, review.getcontent(), geasipan.getnumber());
            if (result == -1) 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println(geasipan.getnumber());
               script.println("alert('댓글 등록에 실패했습니다')");
               script.println("history.back()");
               script.println("</script>");
            } else 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href='geasipan.jsp'");
               script.println(geasipan.getnumber());
               script.println("alert('댓글 등록에 성공했습니다.')");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
</body>
</html>