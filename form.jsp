<%-- 
    Document   : form
    Created on : Dec 30, 2018, 12:57:09 PM
    Author     : Hassam Ali Shah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="js/jquery-1.3.1.min.js"></script>
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
  padding: 40px;
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
.tab {
  display: none;
}

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

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}
</style>

<body>
<%! String sum = ""; %>
<form id="regForm" action="CreateQuiz" method="POST">
  <h1>Create Quiz:</h1>
  <!-- One "tab" for each step in the form: -->
  <div class="tab">QuizInfo:
    <p><input id ="subject" placeholder="Subject..." oninput="this.className = ''" name="subject"></p>
    <p><input id ="topic" placeholder="Topic..." oninput="this.className = ''" name="topic"></p>
  </div>
    <div >Question 1:
        <p><input type="text" id = "Q1" placeholder="Enter Question..." oninput="this.className = ''" name="Q1"></p>
        <p><input type="text" id = "1Qopt1" placeholder="Option A..." oninput="this.className = ''" name="optA1"></p>
        <p><input type="text" id = "1Qopt2" placeholder="Option B..." oninput="this.className = ''" name="optB1"></p>
        <p><input type="text" id = "1Qopt3" placeholder="Option C..." oninput="this.className = ''" name="optC1"></p>
        <p><input type="text" id = "1Qopt4" placeholder="Option D..." oninput="this.className = ''" name="optD1"></p>
        <p><input type="text" id = "1Qopt5" placeholder="Correct Option..." oninput="this.className = ''" name="CorrectOpt1"></p>
        <p><input type="text" id = "1Qopt6" placeholder="Explanation..." oninput="this.className = ''" name="Exp1"></p>
        <script>
            function show(){
                var s= document.getElementById("Q1").value;
                s= s+","+ document.getElementById("1Qopt1").value;
                s= s+","+ document.getElementById("1Qopt2").value;
                s= s+","+ document.getElementById("1Qopt3").value;
                s= s+","+ document.getElementById("1Qopt4").value;
                s= s+","+ document.getElementById("1Qopt5").value;
                s= s+","+ document.getElementById("1Qopt6").value;
                document.getElementById("Q1").innerHtml = s;
                $("Q1").val(s);
            }
        </script>
    </div>
<div >Question 2:
        <p><input id = "Q2" placeholder="Enter Question..." oninput="this.className = ''" name="Q2"></p>
        <p><input id = "2Qopt1" placeholder="Option A..." oninput="this.className = ''" name="optA2"></p>
        <p><input id = "2Qopt2" placeholder="Option B..." oninput="this.className = ''" name="optB2"></p>
        <p><input id = "2Qopt3" placeholder="Option C..." oninput="this.className = ''" name="optC2"></p>
        <p><input id = "2Qopt4" placeholder="Option D..." oninput="this.className = ''" name="optD2"></p>
        <p><input id = "2Qopt5" placeholder="Correct Option..." oninput="this.className = ''" name="CorrectOpt2"></p>
        <p><input id = "2Qopt6" placeholder="Explanation..." oninput="this.className = ''" name="Exp2"></p>
    </div>
<div >Question 3:
        <p><input id = "Q3" placeholder="Enter Question..." oninput="this.className = ''" name="Q3"></p>
        <p><input id = "3Qopt1" placeholder="Option A..." oninput="this.className = ''" name="optA3"></p>
        <p><input id = "3Qopt2" placeholder="Option B..." oninput="this.className = ''" name="optB3"></p>
        <p><input id = "3Qopt3" placeholder="Option C..." oninput="this.className = ''" name="optC3"></p>
        <p><input id = "3Qopt4" placeholder="Option D..." oninput="this.className = ''" name="optD3"></p>
        <p><input id = "3Qopt5" placeholder="Correct Option..." oninput="this.className = ''" name="CorrectOpt3"></p>
        <p><input id = "3Qopt6" placeholder="Explanation..." oninput="this.className = ''" name="Exp3"></p>
    </div>
<div >Question 4:
        <p><input id = "Q4" placeholder="Enter Question..." oninput="this.className = ''" name="Q4"></p>
        <p><input id = "4Qopt1" placeholder="Option A..." oninput="this.className = ''" name="optA4"></p>
        <p><input id = "4Qopt2" placeholder="Option B..." oninput="this.className = ''" name="optB4"></p>
        <p><input id = "4Qopt3" placeholder="Option C..." oninput="this.className = ''" name="optC4"></p>
        <p><input id = "4Qopt4" placeholder="Option D..." oninput="this.className = ''" name="optD4"></p>
        <p><input id = "4Qopt5" placeholder="Correct Option..." oninput="this.className = ''" name="CorrectOpt4"></p>
        <p><input id = "4Qopt6" placeholder="Explanation..." oninput="this.className = ''" name="Exp4"></p>
    </div>
<div >Question 5:
        <p><input id = "Q5" placeholder="Enter Question..." oninput="this.className = ''" name="Q5"></p>
        <p><input id = "5Qopt1" placeholder="Option A..." oninput="this.className = ''" name="optA5"></p>
        <p><input id = "5Qopt2" placeholder="Option B..." oninput="this.className = ''" name="optB5"></p>
        <p><input id = "5Qopt3" placeholder="Option C..." oninput="this.className = ''" name="optC5"></p>
        <p><input id = "5Qopt4" placeholder="Option D..." oninput="this.className = ''" name="optD5"></p>
        <p><input id = "5Qopt5" placeholder="Correct Option..." oninput="this.className = ''" name="CorrectOpt5"></p>
        <p><input id = "5Qopt6" placeholder="Explanation..." oninput="this.className = ''" name="Exp5"></p>
    </div>

  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
      show();
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    show();
    document.getElementById("regForm").submit();
    
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

</body>
</html>
