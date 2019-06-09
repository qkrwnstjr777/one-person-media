<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan2.geasipan2write"%>
<%@ page import="geasipan2.geasipan2"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width" initial-scale="1"> 
<link rel="stylesheet" href="css/bootstrap.css"> 
<title>1PM for create</title> 
   <style type="text/css">
      a, a:hover {
         color: #000000;
         text-decoration: none;
      }
   </style>
   </head>
   <body>
      <%
         //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
         String userID = null;
         if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
         }
         int pageNumber = 1; //기본 페이지 넘버
         if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
               <li><a href="geasipan2.jsp">중고거래 게시판</a></li>
               <li><a href="guidemain.jsp">입문 가이드</a></li>
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
                  <li><a href="join.jsp">회원가입</a></li> 
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
                  </ul></li>
            </ul>
            <%
               }
            %>
         </div>
      </nav>
      <h3 style="text-align:center;">중고거래 게시판</h3>
      <div class="container">
         <div class="row">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th style="background-color: #eeeeee; text-align: center;">번호</th>
                     <th style="background-color: #eeeeee; text-align: center;">제목</th>
                     <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                     <th style="background-color: #eeeeee; text-align: center;">작성시간</th>
                  </tr>
               </thead>
               <tbody>
                  <%
                  geasipan2write geasipan2write = new geasipan2write();
                     ArrayList<geasipan2> list = geasipan2write.getList(pageNumber);
                     for (int i = 0; i < list.size(); i++) {
                  %>
                  <tr>
                     <td><%=list.get(i).getnumber()%></td>
                     <td><a href="geasipan2view.jsp?number=<%=list.get(i).getnumber()%>"><%=list.get(i).gettitle()%></a></td>
                     <td><%=list.get(i).getuserID()%></td>
                     <td><%=list.get(i).getdate().substring(0, 11) + list.get(i).getdate().substring(11, 13) + "시"
                     + list.get(i).getdate().substring(14, 16) + "분"%></td>
                  </tr>
                  <%
                     }
                  %>
               </tbody>
            </table>
            <%
               if (pageNumber != 1) {
            %>
            <a href="geasipan2.jsp?pageNumber=<%=pageNumber - 1%>"
               class="btn btn-success btn-arrow-left">이전 페이지</a>
            <%
               }
               if (geasipan2write.nextPage(pageNumber)) {
            %>
            <a href="geasipan2.jsp?pageNumber=<%=pageNumber + 1%>"
               class="btn btn-success btn-arrow-left">다음 페이지</a>
            <%
               }
            %>

            <%
               //if logined userID라는 변수에 해당 아이디가 담기고 if not null
               if (session.getAttribute("userID") != null) {
            %>
            <a href="geasipan2write.jsp" class="btn btn-primary pull-right">글작성</a>
            <%
               } else {
            %>
            <button class="btn btn-primary pull-right"
               onclick="if(confirm('회원만 작성이 가능합니다.'))location.href='login.jsp';"
               type="button">글작성</button>
            <%
               }
            %>
      </div>
   </div>

   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>