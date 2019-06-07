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
      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      } 
      //로그인 안한 경우
      if(userID == null) {
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
      }
   %>

   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
            aria-expaned="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class ="navbar-brand" href="main.jsp">1PM for create</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">메인</a></li>
                <li><a href="geasipan.jsp">자유 게시판</a></li>
            </ul>
         <ul class="nav navbar-nav navbar-right"> 
            <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">개인설정<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                   <li><a href="logout.jsp">로그아웃</a></li> 
                   <li><a href="usersystem.jsp">정보관리</a></li> 
            </ul>
            </li>
         </ul>
      </div>
   </nav>
   <!-- 게시판 --> 
   <div class="container">
      <div class="row">
         <form method="post" action="geasipanupdateaction.jsp?number=<%= number %> ">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;"> 게시글 수정 </th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" value="<%= geasipan.gettitle() %>" ></td>
                  </tr>
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2000" style="height: 350px;" ><%= geasipan.getcontent() %></textarea></td>
                  </tr>
               </tbody>
            </table>   
            <button type="submit" class="btn btn-primary pull-right" > 수정 완료 </button>
         </form>
      </div>
   </div>

   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>