<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan.geasipan"%>
<%@ page import="geasipan.geasipanwrite"%>
<%@ page import="review.review"%>
<%@ page import="review.reviewwrite"%>
<%@ page import="java.util.ArrayList"%>
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
      int number = 0;
      int reviewnumber = 1; //기본 페이지 넘버
      if (request.getParameter("reviewnumber") != null) {
         reviewnumber = Integer.parseInt(request.getParameter("reviewnumber"));
      }
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
      review review = new reviewwrite().getreview(reviewnumber);
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
            <%
               if (userID == null) {
            %>
            <ul class="nav navbar-nav navbar-right"> 
             <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">로그인/회원가입<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                   <li><a href="login.jsp">로그인</a></li> 
                  <li><a href="idmake.jsp">회원가입</a></li> 
                  </ul></li>
            </ul>
            <%
               } else {
            %>
            <ul class="nav navbar-nav navbar-right"> 
            <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">개인설정<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                   <li><a href="logout.jsp">로그아웃</a></li> 
                   <li><a href="usersystem.jsp">정보관리</a></li> 
                  </ul></li>
            </ul>
         <%
            }
         %>
      </div>
   </nav>
   <div class="container">
      <div class="row">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="3"
                        style="background-color: #eeeeee; text-align: center;">작성 글 내용</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td style="width: 20%;"> 제목 </td>
                     <td colspan="2"><%= geasipan.gettitle() .replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %>
                     </td>
                  </tr>
                  <tr>
                     <td> 작성자 </td>   
                     <td colspan="2"><%= geasipan.getuserID() %></td>
                  </tr>
                  <tr>
                     <td> 작성시간 </td>   
                     <td colspan="2"><%= geasipan.getdate().substring(0, 11) + geasipan.getdate().substring(11, 13) + "시"
                     + geasipan.getdate().substring(14, 16) + "분"%></td>
                  </tr>
                  <tr>
                     <td> 내용 </td>   
                     <td colspan="2" style="min-height: 400px; text-align: left;"><%= geasipan.getcontent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %>
                  </tr>
         


                  </tbody>
               </table>   
               <a href = "geasipan.jsp" class="btn btn-info"> 목록 </a>
               <a href = "review.jsp" class="btn btn-info"> 댓글 남기기 </a>
               <%
               //글작성자 본인일시 수정 삭제 가능 
                  if(userID != null && userID.equals(geasipan.getuserID())){
               %>
                  <a href="geasipanupdate.jsp?number=<%= number %>" class="btn btn-warning"> 수정 </a>
                  <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="geasipandeleteaction.jsp?number=<%= number %>"class="btn btn-danger"> 삭제 </a>
               <%               
                  }
               %>
               
               <div align="right">
               <a href = "goodornotgood.jsp?number=<%= number %>" class="btn btn-info"> 추천 (<%=geasipan.getgood()%>)</a>
               <a href = "notgood.jsp?number=<%= number %>" class="btn btn-danger"> 비추천 (<%=geasipan.getnotgood()%>)</a>
         </div>
         </div>
      </div>
      
      
      <div class="container">
         <div class="row">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd; margin-top: 24px">
               <thead>
                  <tr>
                     <th style="background-color: #eeeeee; text-align: center;">댓글번호</th>
                     <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                     <th style="background-color: #eeeeee; text-align: center;">작성시간</th>
                     <th style="background-color: #eeeeee; text-align: center;">내용</th>
                     <th style="background-color: #eeeeee; text-align: center;">글번호</th>
                  </tr>
               </thead>
               <tbody>
                  <%
                     reviewwrite reviewwrite = new reviewwrite();
                     ArrayList<review> list = reviewwrite.getList(reviewnumber, number);
                     for (int i = 0; i < list.size(); i++) {
                  %>
                  <tr>
                     <td><%=list.get(i).getreviewnumber()%></td>
                     <td><%=list.get(i).getuserID()%></td>
                     <td><%=list.get(i).getdate().substring(0, 11) + list.get(i).getdate().substring(11, 13) + "시"
                     + list.get(i).getdate().substring(14, 16) + "분"%></td>
                     <td><%=list.get(i).getcontent()%></td>
                     <td><%=list.get(i).getnumber()%></td>
                  </tr>
                  <%
                     }
                  %>
               </tbody>
            </table>
            </div>
      </div>

   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>