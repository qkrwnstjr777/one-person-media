<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="geasipan.geasipan"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content= "width=device-width", initial-scale="1">
<link rel = "stylesheet" href="css/bootstrap.css">

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
            <a class ="navbar-brand" href="main.jsp">1PM for create</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">����</a></li>
                <li><a href="geasipan.jsp">���� �Խ���</a></li>
            </ul>
            <%
               if (userID == null) {
            %>
            <ul class="nav navbar-nav navbar-right"> 
             <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">�α���/ȸ������<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                   <li class="active"><a href="login.jsp">�α���</a></li>
                        <li><a href="idmake.jsp">ȸ������</a></li> 
                  </ul></li>
            </ul>
            <%
               } else {
            %>
            <ul class="nav navbar-nav navbar-right"> 
            <li class="dropdown"><a href="#" class="dropdown-toggle" 
                data-toggle="dropdown" role="button" aria-haspopup="true" 
                aria-expanded="false">���μ���<span class="caret"></span></a> 
                <ul class="dropdown-menu"> 
                    <li class="active"><li><a href="logout.jsp">�α׾ƿ�</a></li> 
                   <li><a href="usersystem.jsp">��������</a></li> 
                  </ul></li>
            </ul>
            <%
               }
            %>        
           </div>   <!-- ����Ʈ��, �̹��� ���� ���� -->
           </nav>
           
           
           <style type = "text/css">                               
           .jumbotron{
           background-image: url('image/moon.jpg');
           background-size: cover;
           text-shadow: black 0.2em 0.2em 0.2em;
           color: white;
           
           }
           
           </style>
                                             <!-- ����Ʈ�� ����,������,�ؽ�Ʈ, ��ư����  -->
      
           
           <section class = "main">
           <div class = "jumbotron">
           <div class = "container">
           <h1>COMMUNITY</h1>
           <p> FOR CREATORS </p>
           <p><a class = "btn btn-primary btn-lg" href = "#"
           role = "button"> More about >></a></p>
           </div>

           </div>
         </section>    
                                       <!-- ����Ʈ��, �̹��� ���� ���� -->
           <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          FOR WHAT?
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        ����
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          WHY?
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
       ����
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          WHAT SHOULD I DO
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        ����.
      </div>
    </div>
  </div>
</div>
           
            <!-- �����, ��ư   -->
           
           <article class = "photo container">
      <div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="image\picture.png" alt="picture">
      <div class="caption">
        <h3>�����</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" 
        role="button">Button</a> <a href="#" class="btn btn-
        default" role="button">Button</a></p>
      </div>
    </div>
  </div>
</div>
  </article>

<footer style="background-color: #000000; color: #ffffff">
        <div class="container">
            <br>
            <div class="row">
                <div class="col-sm-2" style="text-align: center;">
                    <h5>Copyright &copy; 2019</h5><h5>1FC(1PM FOR CREATE)</h5> </div>
                <div class="col-sm-4">
                    <h4> Ȩ������ �Ұ�                                            
                    <br><br>
                    <p>....... 
                        <br>.... 
                    </p>
                    </h4></div>
               
               
                <div class="col-sm-2"><h4 style="text-align: center;">
                    <span class="glyphicon glyphicon-ok"></span>&nbsp; by 7</h4></div>
            </div>
        </div>    
    </footer>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>