<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quiz Online</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>
    var quiztitle = "Quiz Title";
	var q1 = "What is the size of int variable?";
   
    var quiz = [
        {
            "question"      :  q1 ,
             "choices"       :   [
                                    "8 bit",
                                    "16 bit",
                                    "32 bit",
                                    "64 bit"
                                ],
            "correct"       :   "32 bit",
            "explanation"   :   "The int data type is represented by 32-bit signed two's complement integer, Minimum value: -231 Maximum value: 231-1",
        },
        {
            "question"      :   "Which of the following type of class allows only one object of it to be created?",
            "choices"       :   [
                                    "Virtual class",
                                    "Singleton class",
                                    "Abstract class",
                                    "Friend class"
                                ],
            "correct"       :   "Singleton class",
            "explanation"   :   "No answer description available for this question",
        },
        {
            "question"      :   "Which of the following is not a type of constructor?",
 
            "choices"       :   [
                                    "Copy constructor",
                                    "Friend constructor",
                                    "Default constructor",
                                    "Parameterized constructor"
                                ],
            "correct"       :   "Friend Constructor",
            "explanation"   :   "No answer description available for this question.",
         }
    ];


    /******* No need to edit below this line *********/
    var currentquestion = 0, score = 0, submt=true, picked;

    jQuery(document).ready(function($){

        /**
         * HTML Encoding function for alt tags and attributes to prevent messy
         * data appearing inside tag attributes.
         */
        function htmlEncode(value){
          return $(document.createElement('div')).text(value).html();
        }

        /**
         * This will add the individual choices for each question to the ul#choice-block
         *
         * @param {choices} array The choices from each question
         */
        function addChoices(choices){
            if(typeof choices !== "undefined" && $.type(choices) == "array"){
                $('#choice-block').empty();
                for(var i=0;i<choices.length; i++){
                    $(document.createElement('li')).addClass('choice choice-box').attr('data-index', i).text(choices[i]).appendTo('#choice-block');                    
                }
            }
        }
        
        /**
         * Resets all of the fields to prepare for next question
         */
        function nextQuestion(){
            submt = true;
            $('#explanation').empty();
            $('#question').text(quiz[currentquestion]['question']);
            $('#pager').text('Question ' + Number(currentquestion + 1) + ' of ' + quiz.length);
            
            addChoices(quiz[currentquestion]['choices']);
            setupButtons();
        }

        /**
         * After a selection is submitted, checks if its the right answer
         *
         * @param {choice} number The li zero-based index of the choice picked
         */
        function processQuestion(choice){
            if(quiz[currentquestion]['choices'][choice] == quiz[currentquestion]['correct']){
                $('.choice').eq(choice).css({'background-color':'#50D943'});
                $('#explanation').html('<strong>Correct!</strong> ' + htmlEncode(quiz[currentquestion]['explanation']));
                score++;
            } else {
                $('.choice').eq(choice).css({'background-color':'#D92623'});
                $('#explanation').html('<strong>Incorrect.</strong> ' + htmlEncode(quiz[currentquestion]['explanation']));
            }
            currentquestion++;
            $('#submitbutton').html('NEXT QUESTION &raquo;').on('click', function(){
                if(currentquestion == quiz.length){
                    endQuiz();
                } else {
                    $(this).text('Check Answer').css({'color':'#222'}).off('click');
                    nextQuestion();
                }
            })
        }

        /**
         * Sets up the event listeners for each button.
         */
        function setupButtons(){
            $('.choice').on('mouseover', function(){
                $(this).css({'background-color':'#e1e1e1'});
            });
            $('.choice').on('mouseout', function(){
                $(this).css({'background-color':'#fff'});
            })
            $('.choice').on('click', function(){
                picked = $(this).attr('data-index');
                $('.choice').removeAttr('style').off('mouseout mouseover');
                $(this).css({'border-color':'#222','font-weight':700,'background-color':'#c1c1c1'});
                if(submt){
                    submt=false;
                    $('#submitbutton').css({'color':'#000'}).on('click', function(){
                        $('.choice').off('click');
                        $(this).off('click');
                        processQuestion(picked);
                    });
                }
            })
        }
        
        /**
         * Quiz ends, display a message.
         */
        function endQuiz(){
            $('#explanation').empty();
            $('#question').empty();
            $('#choice-block').empty();
            $('#submitbutton').remove();
            $('#question').text("You got " + score + " out of " + quiz.length + " correct.");
            $(document.createElement('h2')).css({'text-align':'center', 'font-size':'4em'}).text(Math.round(score/quiz.length * 100) + '%').insertAfter('#question');
        }

        /**
         * Runs the first time and creates all of the elements for the quiz
         */
        function init(){
            //add title
            if(typeof quiztitle !== "undefined" && $.type(quiztitle) === "string"){
                $(document.createElement('h1')).text(quiztitle).appendTo('#frame');
            } else {
                $(document.createElement('h4')).text("Quiz").appendTo('#frame');
            }

            //add pager and questions
            if(typeof quiz !== "undefined" && $.type(quiz) === "array"){
                //add pager
                $(document.createElement('p')).addClass('pager').attr('id','pager').text('Question 1 of ' + quiz.length).appendTo('#frame');
                //add first question
                $(document.createElement('h2')).css({'text-align':'left', 'font-size':'2em' ,'line-height':'30px'}).addClass('question').attr('id', 'question').text(quiz[0]['question']).appendTo('#frame');
                
                $(document.createElement('p')).addClass('explanation').attr('id','explanation').html('&nbsp;').appendTo('#frame');
            
                //questions holder
                $(document.createElement('ul')).attr('id', 'choice-block').appendTo('#frame');
            
                //add choices
                addChoices(quiz[0]['choices']);
            
                //add submit button
                $(document.createElement('div')).addClass('choice-box').attr('id', 'submitbutton').text('Check Answer').css({'font-weight':700,'color':'#222','padding':'30px 0'}).appendTo('#frame');
            
                setupButtons();
            }
        }
        
        init();
    });
    </script>
    <style type="text/css" media="all">
        /*css reset */
       
        ol,ul{list-style:none;}
        strong{font-weight:400;}
        #frame{max-width:550px;width:auto;border:1px solid #ccc;padding:30px;margin-left:5px;margin-top:25px;}
		p.pager{margin:5px 0 5px; font:bold 1em/1em "Helvetica Neue", Helvetica, Arial, sans-serif;color:#999;}
        #choice-block{display:block;list-style:none;margin:0;padding:0;}
        #submitbutton{background:#5a6b8c;}
        #submitbutton:hover{background:#7b8da6;}
        #explanation{margin:0 auto;padding:20px;width:75%; text-align:left;}
        .choice-box{display:block;text-align:center;margin:8px auto;padding:10px 0;border:1px solid #666;cursor:pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
    </style>


<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>


</head>
<body >


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
                <li><a href="index.html">Home</a></li>
                <li><a href="quizcreater.html"  class="current">Take Quiz</a></li>
                <li><a  >Archive</a></li>
				<li><a >See Your Record</a></li>
                <li><a >About Us</a></li>
                <li><a >Contact Us</a></li>
				 <li><a href="login.html">Logout</a></li>
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_content_wrapper"><span class="top"></span><span class="bottom"></span>
        <div id="templatemo_content">
        
            <div id="frame" role="content"></div>
		</div>
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

</body>
</html>