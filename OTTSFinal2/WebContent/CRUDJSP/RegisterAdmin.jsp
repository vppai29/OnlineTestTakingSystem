<%@ page import="com.ilp.otts.bean.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>ManageAdmin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
 
    <link rel="stylesheet" type="text/css" href="/OTTS/bootstrap/docs/assets/css/bootstrap.css">
     <link rel="stylesheet" type="text/css" href="/OTTS/bootstrap/docs/assets/css/bootstrap-responsive.css">
     <link rel="StyleSheet" type="text/css" href="/OTTS/Css/Style.css"/>
     <script type="text/javascript" src="/OTTS/Script/AdminValidations.js"></script>
<script src="/OTTS/bootstrap/docs/assets/js/jquery.js"></script>
<script src="/OTTS/bootstrap/docs/assets/js/bootstrap-dropdown.js"></script>  
        <style type="text/css">

      /* Sticky footer styles
      -------------------------------------------------- */
 


      html,
      body {
      	background-image:url("/OTTS/grey.jpg");
      	
        height: 100%;
        padding-top: 60px;
        padding-bottom: 40px;
        /* The html and body elements cannot have any padding or margin. */
      }

      /* Wrapper for page content to push down footer */
      #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
      }

      /* Set the fixed height of the footer here */
      #push,
      #footer {
        height: 60px;
      }
      #footer {
        background-color: #f5f5f5;
      }

      /* Lastly, apply responsive CSS fixes as necessary */
      @media (max-width: 767px) {
        #footer {
          margin-left: -20px;
          margin-right: -20px;
          padding-left: 20px;
          padding-right: 20px;
          
        }
      }



      /* Custom page CSS
      -------------------------------------------------- */
      /* Not required for template or sticky footer method. */

      .container {
        width: auto;
        max-width: 680px;
      }
      .container .credit {
        margin: 20px 0;
      }

    </style>
    
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
 

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/OTTS/bootstrap/docs/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/OTTS/bootstrap/docs/assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/OTTS/bootstrap/docs/assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="/OTTS/bootstrap/docs/assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="/OTTS/bootstrap/docs/assets/ico/favicon.png">
  </head>

  <body onload="generateDate()">
 <!-- <img alt="not avail" src="/OTTS/grey.jpg">  -->
  
     <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">E-xam</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link"><%=session.getAttribute("name")%></a>&nbsp
              <a href="/OTTS/Logout" class="navbar-link">Logout</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container-fluid">
    
    <!-- your content here /container -->
    <!--/sidebar-->
          <div class="row-fluid">
        <div class="span2">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
				<%@ include file="/CRUDlinks/AdminCrudLinks.jsp"%>             
            </ul>
          </div><!--/.well -->
        </div><!--/span-->



<div class="span6">

<!-- The Main BODY  Starts-->
<!-- Success / Faiule msg start -->
	<% String captcha = (String) request.getAttribute("captcha");
if(captcha != null)
	if(captcha.equals("failed")){
%>	
<div class="alert alert-error" id="error">  
 <a class="close" data-dismiss="alert">�</a>  
  <strong>Error!!!</strong>
	Captcha Failed
</div> 	

<%} %>

	<% LoginBean loginBean = (LoginBean) request.getAttribute("status");
if(request.getAttribute("result") != null){
	if(loginBean != null){
%>		
<div class="alert alert-success">  
  <a class="close" data-dismiss="alert">�</a> 
  <strong>Success!!!</strong>
	Registration Success
</div> 
<div class="alert alert-info">  
  <a class="close" data-dismiss="alert">�</a> 
  <strong>Credentials!!</strong>
	Registration Success
	<br>ID: <%=loginBean.getId()%>
	<br>UserName:  <%=loginBean.getUsername()%>
	<br>Password:  <%=loginBean.getPassword()%>
</div> 
<%
	}
	else{
%>
<div class="alert alert-error" id="error">  
 <a class="close" data-dismiss="alert">�</a>  
  <strong>Error!!!</strong>
	Registration Failed
</div> 		
<%		
	}
}%>
<!-- Success / Faiule msg Ends -->

<!-- Registration Form starts -->
<h4>Enter the Admin details to register</h4>
	<form name="register" id="register" action="/OTTS/ManageAdminServlet" method="post" onsubmit="return validate(this)">
		<input type="hidden" name="type" value="register">
		
		<table>
			<tr>
				<td>FirstName:</td>
				<td><input type="text" name="firstname" id="firstname" onblur="check(this)" placeholder="Your First Name"></input>
				</td>
				<td id="firstname-error" class="error"></td>
			</tr>
			<tr>
				<td>MiddleName:(optional)</td>
				<td><input  type="text" name="middlename" id="middlename" onblur="check(this)" placeholder="Your Middle Name"></td>
				<td id="middlename-error" class="error"></td>
			</tr>
			<tr>
				<td>LastName:</td>
				<td><input  type="text" name="lastname" id="lastname" onblur="check(this)" placeholder="Your Last Name">
				</td>
				<td id="lastname-error" class="error"></td>
			</tr>
			<tr>
				<td>DOB:</td>
				<td>
					<select style="width:60px" id="day" name="day"><option id="day-value1">Day</option></select>
					<select style="width:75px" id="month" name="month"><option id="month-value1">Month</option></select>
				 	<select style="width:75px" id="year"  name="year" onblur="check(this)"><option id="year-value1">Year</option></select>
				 	
				</td>
				<td id="dob-error" class="error"></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" id="email" onblur="check(this)" placeholder="Your Email ID">
				</td>
				<td id="email-error" class="error"></td>
			</tr>
			<tr>
				<td>PhoneNumber:</td>
				<td><input type="text" name="phonenumber" id="phonenumber" onblur="check(this)" placeholder="Your Contact Number">
				</td>
				<td id="phonenumber-error" class="error"></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><textarea  name="address" id="address"  onblur="check(this)" placeholder="Your Home Address"></textarea>
				</td>
				<td id="address-error" class="error">
				</td>
			</tr>
			<tr align="center">
			<td><img src="/OTTS/GRSCaptchaServlet" alt="Captchaa" id="captcha">
			<input type="button" style="background-image:url('/OTTS/refresh.png');width:30px;height:30px"
			 onclick="document.getElementById('captcha').src='/OTTS/GRSCaptchaServlet?' + new Date().getTime();"></td>
			</tr>
			<tr >
			<td style="padding-top:15px"><input type="text" name="cvalue" id="cvalue"/></td>
			</tr>
			
			<tr align="center">
				<td colspan="2"><input style="width:100px" class="btn btn-primary" type="submit" name="submit" value="Register">&nbsp
				<input style="width:100px" class="btn"	type="reset" name="reset">
				</td>
			</tr>

		</table>
	</form>
	
	<!-- Registration Form ends -->
	<%
		/*LoginBean loginBean = (LoginBean) request.getAttribute("status");
		if (request.getAttribute("result") != null)
			if (loginBean != null) {
				out.println("<br>Registration Success");
				out.println("<br>ID: " + loginBean.getId());
				out.println("<br>UserName: " + loginBean.getUsername());
				out.println("<br>Password: " + loginBean.getPassword());
			} else
				out.println("Registration Failed");*/
	%>
	

	
	<!-- The Main BODY Ends-->
	
	
</div>
</div>

     
   
    
    
    
        </div> <!-- /container -->

  <div id="footer" class="avbar navbar-fixed-bottom">
      <div class="container">
      	 <div class="footer">
       		 <p class="muted credit">Site Designed by <a href="#">TCS ILP M134 GROUPD</a>&nbsp &copy TCS ILP 2013</p>
    	  </div>
      </div>
    </div>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/OTTS/bootstrap/docs/assets/js/jquery.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-transition.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-alert.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-modal.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-dropdown.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-scrollspy.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-tab.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-tooltip.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-popover.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-button.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-collapse.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-carousel.js"></script>
    <script src="/OTTS/bootstrap/docs/assets/js/bootstrap-typeahead.js"></script>
<script type="text/javascript">
window.history.forward();
document.body.oncontextmenu="return false";
</script>
  </body>
</html>
    