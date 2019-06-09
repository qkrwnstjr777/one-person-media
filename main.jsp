<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>WWW.1PMFORCREATOR.CO.KR</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="css/landing-page.min.css" rel="stylesheet">


</head>

<body>

       <%
         String userID = null;
         if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
         }
         %>
         
   <nav class="navbar navbar-light bg-light static-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.jsp">&nbsp;1PM FOR CREATOR</a>
      <a class="btn btn-brand" href="main.jsp">메인</a>
      <a class="btn btn-brand" href="geasipan.jsp">자유 게시판</a>
       <a class="btn btn-brand" href="geasipan2.jsp">중고거래 게시판</a>
        <a class="btn btn-brand" href="guidemain.jsp">입문 가이드</a>
      </div>
               <%
               if (userID == null) {
            %>
      <ul class="nav navbar-nav navbar-right"> 
             <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">로그인/회원가입<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                   <li><a href="login.jsp">&nbsp; - 로그인</a></li> 
                  <li><a href="join.jsp">&nbsp; - 회원가입</a></li> 
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
                   <li><a href="login.jsp">&nbsp; - 로그아웃</a></li>  
                  </ul></li>
            <%
               }
            %>
  </nav>



  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5"> <p>크리에이터로 성장하게 도와 드립니다!<p>
          
                         <p>1PM FOR CREATOR<p> </h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
               
              </div>
              <div class="col-12 col-md-3">
               
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>

  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>커뮤니티 게시판</h3>
            <p class="lead mb-0">Community</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3>신뢰할 수 있는 정보</h3>
            <p class="lead mb-0">
Trustworthy information</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>쉬운 사용법</h3>
            <p class="lead mb-0">Easy to use</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/youtubeblack.png');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>커뮤니티</h2>
          <p class="lead mb-0">
 우리 홈페이지는 커뮤니티 게시판을 제공합니다
 다른 사용자들과 함께 컨텐츠에 관한 생각을 마음껏 나누어 보세요!</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/trust.png');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2>신뢰할 수 있는 정보</h2>
          <p class="lead mb-0"> 크리에이터를 처음 입문 하는 입장에서 믿을 수 있는 정보는 습득하기 어렵습니다.
 요약된 정보들을 제공하여  신속하게 채널을 만드는 것을 도와 드립니다!</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/easy.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>쉬운  사용법</h2>
          <p class="lead mb-0">

  사용자가 원하는 정보를 유저 게시판 그리고 입문 가이드 카테고리를 통해 필요한 정보만 골라 습득 할수 있습니다!</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials 
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">What people are saying...</h2>
      <div class="row">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
            <h5>Margaret E.</h5>
            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
            <h5>Fred S.</h5>
            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
            <h5>Sarah W.</h5>
            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
          </div>
        </div>
      </div>
    </div>
  </section> -->

  <!-- Call to Action -->
  <section class="call-to-action text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
               
              </div>
              <div class="col-12 col-md-3">
                
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">박준석</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">한민재</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">나카무라 마사타카</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">다다 세이지</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; 1PM FOR CREATOR 2019. All Rights Reserved.</p>
        </div>
       
       
       
       
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  

</body>

</html>