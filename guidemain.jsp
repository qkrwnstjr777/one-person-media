<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>1PM for create</title>
</head>
<body background="image/you.jpg">

      <%
         //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
         String userID = null;
         if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
         }
      %>
    <nav class ="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
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
    <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>
   
   <div class="container">
   
   <h3 style="text-align:center;">입문 가이드 컨텐츠를 선택해 보세요.</h3> 
   
   <div class="row">
      <div class="col-md-6">
   
   

 
   <br>
    <p id="촬영"><a href="http://localhost:8080/test1/shooting.jsp"><img src="image/kamera2.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;촬영</span> <br>
    
       
   <p id="게임"><a href="http://localhost:8080/test1/game.jsp"><img src="image/game2.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
   <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;게임 컨텐츠  </span> <br>
    
    <p id="음악"><a href="http://localhost:8080/test1/music.jsp"><img src="image/sound.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;음악 컨텐츠</span> <br>
     
    <p id="저작권"><a href="http://localhost:8080/test1/copyright.jsp"><img src="image/copy.png" width=370 height=150 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;유트브 저작권</span> <br> 
     
    </div>  
    
     <div class="col-md-6">
     <br>
     <br>
     <br>
    <p id="채널 수익"><a href="http://localhost:8080/test1/channelearn.jsp"><img src="image/cannel.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;채널 수익</span> <br>
    
    <p id="편집"><a href="http://localhost:8080/test1/edit.jsp"><img src="image/hensyuu.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;동영상 편집하기</span> <br>
    
    
    <p id="수익"><a href="http://localhost:8080/test1/youearn.jsp"><img src="image/dollar.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;수익을 창출하기 위해서</span> <br>
    
    <p id="초상권"><a href="http://localhost:8080/test1/portrait.jsp"><img src="image/syuuzou.jpg" width=400 height=200 class="img-responsive" hspace=160></a></p>
    <span style="font-size:250%;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;초상권에 대해서</span> <br>
    
    
    </div>
    
   
      <div class="col-md-12">
       <div  class="jumbotron">  
      
      <p>
       <br><br>
      
      <center><a href="http://localhost:8080/test1/guidemain.jsp" >
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>페이지 위로<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></center>
      
      <center>
      <a href="#채널 수익">채널 수익</a>/
      <a href="#촬영">촬영</a>/
      <a href="#게임">게임 컨텐츠</a>/
      <a href="#저작권">유트브 저작권</a>/
      <a href="#편집">동영상 편집하기</a>/
      <a href="#수익">수익을 창출하기 위해서</a>/
      <a href="#초상권">초상권에 대해서</a>
         <center><p>1PM for create@2019<p></center>
      </p>
      
       </div>
      </div>
   </div>
   </div>
    </body>
</html>