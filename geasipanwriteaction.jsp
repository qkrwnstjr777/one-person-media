<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="geasipan.geasipanwrite"%>
<%@ page import="java.io.PrintWriter"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>
<jsp:useBean id="geasipan" class="geasipan.geasipan" scope="page" />

<jsp:setProperty name="geasipan" property="title" />
<jsp:setProperty name="geasipan" property="content"/>
<%
   System.out.println(geasipan);
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
      String userTel = null;
      if (session.getAttribute("userID") != null) 
      {
         userID = (String) session.getAttribute("userID");
         userTel = (String) session.getAttribute("userTel");
      }
      if (userID == null) 
      {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('회원만 작성이 가능합니다.')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
      } else {
         if (geasipan.gettitle() == null || geasipan.getcontent() == null) 
         {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            geasipanwrite geasipanwrite = new geasipanwrite();
            int result = geasipanwrite.write(geasipan.gettitle(), userID, userTel, geasipan.getcontent());
            if (result == -1) 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('업로드에 실패했습니다')");
               script.println("history.back()");
               script.println("</script>");
            } else 
            {
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("location.href='geasipan.jsp'");
               script.println("alert('업로드에 성공했습니다.')");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
</body>
</html>