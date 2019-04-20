<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quiz Online - Record Page</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/styleTable.css">

<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<style>
.buttonsub {
  background-color: #ffffff;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>

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
                <li><a href="index.html" >Home</a></li>
                <li><a href="form.html">Create Quiz</a></li>
                <li><a href="#">Archive</a></li>
				<li><a href="record.html" class="current">See Your Record</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="contact.html">Contact Us</a></li>
				<li><a href="login.html">Logout</a></li>
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_content_wrapper"><span class="top"></span><span class="bottom"></span>
        <div id="templatemo_content">
		<h1 align = "center">Subjects</h1>
                 <%@page import = "java.sql.*" %>
                    <%@page import = "java.util.*" %>
                    <%@page import = "java.io.*" %>
                    <%@page import= "java.io.IOException" %>
                    <%@page import= "java.io.PrintWriter" %>
                    <%@page import= "javax.servlet.*" %>
                    <%@page import= "javax.servlet.http.*" %>
                    <%!     
                Connection con;
                Statement st;
                ResultSet rs;
                Cookie ck[];
                int count= 0; %>
                    <%         try{
           // System.out.println("Inside Constructor");
            Class.forName ("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            st = con.createStatement();
        }
        catch(Exception e){
            System.out.println("Exception in connection of DataBase : "+e);
        }
                    Cookie sub[] = request.getCookies();
                    String query = "SELECT * FROM quiz WHERE Subject_Id = \'" + sub[0].getValue() +"\'" ;
                    rs = st.executeQuery(query);
                    %>
		
		<div id = "DC" style = "display: block;">
                    <% while(rs.next()){%>
                    <div class="buttonsub" ><a href="#" target = "_blank" id = <%= rs.getString("Topic_Id")%> > <%= rs.getString("Topic_Id")%> </a></div>
                        <% } %>
		<div class="buttonsub" ><a href="#" target = "_blank">Psychology</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Digital Logic Deighn</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Data Structures</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Analysis Of Algorithm</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">COAL</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Programming Fundamentals</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">EMT</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Basic Electronics</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Discrete Math</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Pak Studies</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">DataBases</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Computer Networks</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Computer Architecture</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">OOP</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Calculus</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Statistics</a></div>
		<div class="buttonsub" ><a href="#" target = "_blank">Linear Algebra</a></div>
                
		</div>
 
        </div> <!-- end of templatemo_content -->
        
        <div id="templatemo_sidebar">
            
            
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
            <li><a href="index.html">Home</a></li>
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