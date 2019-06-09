<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="geasipan2.geasipan2write"%>
<%@ page import="java.io.PrintWriter"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>
<jsp:useBean id="geasipan2" class="geasipan2.geasipan2" scope="page" />

<jsp:setProperty name="geasipan2" property="title" />
<jsp:setProperty name="geasipan2" property="userTel" />
<jsp:setProperty name="geasipan2" property="content"/>
<%
   System.out.println(geasipan2);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
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
         if (geasipan2.gettitle() == null || geasipan2.getuserTel() == null || geasipan2.getcontent() == null) 
         {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
         } else {
            geasipan2write geasipan2write = new geasipan2write();
            int result = geasipan2write.write(geasipan2.gettitle(), userID, geasipan2.getuserTel(), geasipan2.getcontent());
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
               script.println("location.href='geasipan2.jsp'");
               script.println("alert('업로드에 성공했습니다.')");
               //script.println("history.back()");
               script.println("</script>");
            }
         }
      }
   %>
</body>
</html>