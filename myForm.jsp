<%-- 
    Document   : myForm
    Created on : Dec 30, 2018, 9:15:07 PM
    Author     : Hassam Ali Shah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<style>
* {
  box-sizing: border-box;
}
body
{
	background: rgb(9,186,176);
	background: linear-gradient(0deg, rgba(9,186,176,1) 3%, rgba(3,95,90,1) 100%);
}
#regForm {
  background-color: #ffffff;
  margin: 100px auto;
  font-family: Raleway;
  padding: 20px;
  width: 50%;
  min-width: 300px;
}

h1 {
  text-align: center;  
}

input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}
 

</style>
<body>

<form name="regForm" id ="regForm" role="form" action="CreateQuiz" method="POST">
  <h1>Create_Quiz:</h1>
  <!-- One "tab" for each step in the form: -->
  <br>
    <div class="tab" id="0" style="display:block";><h3>QuizInfo:</h3>
    <p><input placeholder="Subject..." name="subject" required></p>
    <p><input placeholder="Topic..."  name="topic" required></p>
  </div>

  <div id="1" class="tab" style="display:none;"><h3>Question 1:</h3>
	<p><input name="Q1" id="Q1" placeholder="Enter Question..." required></p>
        <p><input name="A1" id="A1" placeholder="Option A..." required></p>
	<p><input name="B1" id="B1" placeholder="Option B..." required></p>
	<p><input name="C1" id="C1" placeholder="Option C..." required></p>
	<p><input name="D1" id="D1" placeholder="Option D..." required></p>
	<p><input name="E1" id="E1" placeholder="Correct Option..." required></p>
	<p><input name="F1" id="F1" placeholder="Explanation..." ></p>
  </div>

  <div id="2" class="tab" style="display:none;"><h3>Question 2:</h3>
	<p><input name="Q2" id="Q2" placeholder="Enter Question..." required></p>
        <p><input name="A2" id="A2" placeholder="Option A..." required></p>
	<p><input name="B2" id="B2" placeholder="Option B..." required></p>
	<p><input name="C2" id="C2" placeholder="Option C..." required></p>
	<p><input name="D2" id="D2" placeholder="Option D..." required></p>
	<p><input name="E2" id="E2" placeholder="Correct Option..." required></p>
	<p><input name="F2" id="F2" placeholder="Explanation..." ></p>
  </div>
    
    <div id="3" class="tab" style="display:none;"><h3>Question 3:</h3>
	<p><input name="Q3" id="Q3" placeholder="Enter Question..." required></p>
        <p><input name="A3" id="A3" placeholder="Option A..." required></p>
	<p><input name="B3" id="B3" placeholder="Option B..." required></p>
	<p><input name="C3" id="C3" placeholder="Option C..." required></p>
	<p><input name="D3" id="D3" placeholder="Option D..." required></p>
	<p><input name="E3" id="E3" placeholder="Correct Option..." required></p>
	<p><input name="F3" id="F3" placeholder="Explanation..." ></p>
  </div>
  
    <div id="4" class="tab" style="display:none;"><h3>Question 4:</h3>
	<p><input name="Q4" id="Q4" placeholder="Enter Question..." required></p>
        <p><input name="A4" id="A4" placeholder="Option A..." required></p>
	<p><input name="B4" id="B4" placeholder="Option B..." required></p>
	<p><input name="C4" id="C4" placeholder="Option C..." required></p>
	<p><input name="D4" id="D4" placeholder="Option D..." required></p>
	<p><input name="E4" id="E4" placeholder="Correct Option..." required></p>
	<p><input name="F4" id="F4" placeholder="Explanation..." ></p>
  </div>

    <div id="5" class="tab" style="display:none;"><h3>Question 5:</h3>
	<p><input name="Q5" id="Q5" placeholder="Enter Question..." required></p>
        <p><input name="A5" id="A5" placeholder="Option A..." required></p>
	<p><input name="B5" id="B5" placeholder="Option B..." required></p>
	<p><input name="C5" id="C5" placeholder="Option C..." required></p>
	<p><input name="D5" id="D5" placeholder="Option D..." required></p>
	<p><input name="E5" id="E5" placeholder="Correct Option..." required></p>
	<p><input name="F5" id="F5" placeholder="Explanation..." ></p>
    </div>

  
  <div style="overflow:auto;">
    <div style="float:right;">
        <button id="btn" onclick="show()">Next</button>
    </div>
  </div>
</form>
    <script>
        var a=0;
        function show(){
            a=a+1;
            if(a==5){
                document.getElementById("btn").innerHTML="Submit";
                document.getElementById("btn").type="submit";
            }
            
            var s = (a-1).toString();
            document.getElementById(s).style.display="none";
            s=a.toString();
            document.getElementById(s).style.display="block";
        }
    </script>
</body>
</html>
