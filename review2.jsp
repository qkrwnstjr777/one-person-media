<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="geasipan2.geasipan2"%>
<%@ page import="geasipan2.geasipan2write"%>
<%@ page import="review2.review2"%>
<%@ page import="review2.review2write"%>
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
   %>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
            aria-expaned="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
      </button>
         <a class="navbar-brand" href="main.jsp">1PM for create</a>
      </div>
      <div class="collapse navbar-collapse"
         id="#bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li class="active"><li><a href="main.jsp">메인</a></li>
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
                  <li><a href="idmake.jsp">회원가입</a></li>
               </ul></li>
         </ul>
         <%
            } else {
         %>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">회원관리<span class="caret"></span></a>
               <ul class="dropdown-menu">
                  <li><a href="logoutAction.jsp">로그아웃</a></li>
               </ul></li>
         </ul>
         <%
            }
         %>
      </div>
   </nav>
   <div class="container">
      <div class="row">
         <form method="post" action="review2action.jsp">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">자유게시판 댓글 작성</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="중고거래 게시글 번호" name="number" maxlength="50"/></td>
                  </tr>
                  <tr>
                     <td><textarea class="form-control" placeholder="댓글 내용" name="content" maxlength="2000" style="height: 350px;"></textarea></td>
                  </tr>
               </tbody>
            </table>   
            <input type="submit" class="btn btn-primary pull-right" value="댓글 등록" />
         </form>
      </div>
   </div>
   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>