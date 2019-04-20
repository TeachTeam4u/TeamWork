<%-- 
    Document   : teacher
    Created on : Dec 27, 2018, 12:23:07 AM
    Author     : Hassam Ali Shah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.IOException" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>

<!-- Teacher -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quiz Online</title>
<meta name="keywords" content="Quiz Online Website" />
<meta name="description" content="provide quiz to asses student (2-column layout) from Sef16" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>


<style>

body{
background-color: #004C47 !important;
}
#loader {
background-color: #004C47 !important;
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;

 border-top: 16px solid blue;
 border-right: 16px solid Orange;
 border-bottom: 16px solid red;
 border-left: 16px solid pink;
  
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

 

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}

#loader{
background-color : green;
}



</style>
<script>
var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 2000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>

</head>
<body onload="myFunction()" style="margin:0;">

<div id="loader"></div>
<div style="display:none;" id="myDiv" class="animate-bottom">

            
        <% Cookie ck[] = request.getCookies(); %>
        <div id = "student_name" style = "font-size:20px; color:white;">Welcome: <%= ck[1].getValue() %></div>
        

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="#" target="_parent">
                <img src="images/head2.png" alt="Site Title" width="200" height="50" />
                <span>Asses yourself</span>
            </a></h1>
      	</div>

        <div id="search_box">
            <form action="#" method="get">
                <input type="text" value="Enter a keyword here..." name="q" size="10" id="searchfield" title="searchfield" onfocus="clearText(this)" onblur="clearText(this)" />
                <input type="submit" name="Search" value="Search" alt="Search" id="searchbutton" title="Search" />
            </form>
        </div>
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    
    <div id="templatemo_menu">
            <ul>
                <li><a href="teacher.jsp" class="current">Home</a></li>
                <li><a href="myForm.jsp">Create Quiz</a></li>
                <li><a href="#">Archive</a></li>
				<li><a href="trecord.jsp">See Your Record</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="contact.html">Contact Us</a></li>
				<li><a href="login.html">Logout</a></li>
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
        
    <div id="templatemo_content_wrapper"><span class="top"></span><span class="bottom"></span>
        <div id="templatemo_content">
        
            <div id="templatemo_slider">
            
                <div id="one" class="contentslider">
                    <div class="cs_wrapper">
                        <div class="cs_slider">
                        
						
                            <div class="cs_article">
                                <a href="#" target="_parent">
                                    <img src="images/slider/s1.png" alt="Slide 01" />
                                </a>
                            </div><!-- End cs_article -->
                            
                            <div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s3.jpg" alt="Slide 02" />
                                </a>
                            </div><!-- End cs_article -->
                            
                            <div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s2.png" alt="Slide 03" />
                                </a>
                            </div><!-- End cs_article -->
                            
                            <div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s4.jpg" alt="Slide 04" />
                                </a>
                            </div><!-- End cs_article -->
							<div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s5.jpg" alt="Slide 05" />
                                </a>
                            </div><!-- End cs_article -->
                            
                            <div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s6.jpg" alt="Slide 06" />
                                </a>
                            </div><!-- End cs_article -->
                            
                            <div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s7.jpg" alt="Slide 07" />
                                </a>
                            </div><!-- End cs_article -->
							<div class="cs_article">
                                <a href="#" target="_parent">
                               	<img src="images/slider/s8.jpg" alt="Slide 08" />
                                </a>
                            </div><!-- End cs_article -->
                        </div><!-- End cs_slider -->
                    </div><!-- End cs_wrapper -->
                </div><!-- End contentslider -->
                
                <!-- Site JavaScript -->
                <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
                <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
                <script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
                <script type="text/javascript">
                    $(function() {
                    $('#one').ContentSlider({
                    width : '600px',
                    height : '240px',
                    speed : 600,
                    easing : 'easeInOutQuart'
                    });
                    });
                </script>
                <script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
                <script src="js/chili/recipes.js" type="text/javascript"></script>
                <div class="cleaner"></div>
            </div> <!-- end of templatemo_slider -->  
            
            <h2>Articles for Teachers and Stduents</h2>
            
            <div class="service_box float_l">
                 
                 <div class="service_image">
                    <img src="images/blog1.1.png" alt="image 1" />
                 </div>
                 <div class="service_text">
                     <h5>General Tips for Preparing to Take Tests and Quizzes</h5>
                     <p> We promise your teacher isn’t out to get you. As unpleasant as taking a test can often be, it actually does more than just show your teacher what you know: it can actually help you learn. </p>
                     <div class="button"><a href="http://tutorials.istudy.psu.edu/testing/testing9.html" target="_blank">Read Full Article</a></div>
                 </div>
                 
            </div>
            
            <div class="service_box float_r">
            
                <div class="service_image">
                    <img src="images/icon_02.png" alt="image 2" />
                 </div>
                 <div class="service_text">
                     <h5>Tips for teachers to make quiz more Interesting</h5>
                     <p>As you prepare your next quiz, use these tips to create a quiz that will help students have fun and receive the best possible score.Testing is a topic that's rarely fun for students.</p>
                     <div class="button"><a href="https://www.quizstud.com/en/tips" target="_blank">Read Full Article</a></div>
                 </div>
                
            </div>
            
            <div class="cleaner_h40"></div>
            
            <h2 align = "left">What we do?</h2>
            <p align = "left">We are providing the facility of <a href="http://www.templatemo.com" target="_parent">Quiz Online</a>. What is the benefit of this site?</p>
           <p align = "left">
		    Our best effort is to save student and teacher precious time which is spent on traveling and reaching on a<br>
			fixed spot. Not only time spent, money is also spent. So due to this site we are trying to save time.<br>
			We also trying to save effort for a teacher to check the quizzes. It is also beneficial for the student.<br>
			Student shouldn’t wait for long to see its result. Quick response is got at the end of quiz.<br>
			Managing records plus description of each question is also tried.<br><br>

			Availability is also not an issue. Just login using your ID’s through anywhere using internet.
		   </p> 
        </div> <!-- end of templatemo_content -->
        
        <div id="templatemo_sidebar">
            
            <div class="section_rss_twitter">
        
                <div class="rss_twitter twitter">
                <a href="http://www.templatemo.com/page/1" target="_parent" align = "left">FOLLOW US <span>on Twitter</span></a>
                </div>
                
                <div class="margin_bottom_20"></div>
                
                <div class="rss_twitter rss">
                <a href="http://www.templatemo.com/page/2" target="_parent" align = "left">SUBSCRIBE <span>our feed</span></a>
                </div>
            
            </div>
            
            <div id="sidebar_featured_project" align = "left">
                
                <h3 align = "left">Featured Work</h3>
                <div class="left"><img src="images/maker.png" alt="image 3" /></div>
                <div class="right">
                    <a href="#" align = "left">Useful fro both teachers and students</a>
                    <p align = "left">It helps students to evaluate theirselves before exams
					and teachers to check the status of each student.</p>
                </div>
                 <div class="cleaner"></div>
                
            </div>
            
            <div id="news_section" align = "left">
                
                <h3>Promotion</h3>
            	
				<div class="news_box" align = "left">
				<a href="https://www.masterstudies.com/article/what-skills-do-you-need-to-be-a-fashion-industry-manager/" target = "_blank">How To Study During Your Workout?</a>
				<p>Struggling to find time to workout and study? Try doing both at the same time. Let's take a closer look at a few tips.</p>
				</div>
				
                <div class="news_box" align = "left">
                    <a href="https://www.masterstudies.com/article/how-to-study-during-your-workout/" target = "_blank">What Skills Do You Need To Be a Fashion Industry Manager?</a>
                    <p>If you are into fashion and business, the multibillion dollar industry of fashion management is the path for you... </p>
                </div>
                
				
				<div class="news_box" align = "left">
                    <a href="https://www.masterstudies.com/article/seven-fields-of-study-that-are-booming-right-now/" target = "_blank">Seven Fields of Study That Are Booming Right Now</a>
                    <p>Want to go into the next hottest field? Consider this list of possibilities of careers for the future. </p>
                </div>
				
                
                <div class="button"><a href="https://www.masterstudies.com/article/" target = "_blank">View All</a></div>
                
				<div class="cleaner"></div>  
                   
            </div>
        
            <div class="cleaner"></div>
        </div>
    
    	<div class="cleaner"></div>
    </div> <!-- end of content_wrapper -->
    
    <div id="templatemo_footer">

        <ul class="footer_menu">
            <li><a href="teacher.jsp">Home</a></li>
            <li><a href="services.html">Services</a></li>
            <li><a href="news.html">News</a></li>
            <li><a href="gallery.html">About us</a></li>
            <li class="last_menu"><a href="contact.html">Contact Us</a></li>
        </ul>
    
        Copyright © 2048 <a href="#">Quiz Online</a>
        <a href="http://www.iwebsitetemplate.com" target="_parent"></a> by <a href="http://www.templatemo.com" target="_parent">Dangling Programmers</a>
    
    </div> <!-- end of footer -->

</div> <!-- end of wrapper -->

</div>
</body>
</html>