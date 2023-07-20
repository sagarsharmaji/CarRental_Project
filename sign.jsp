<html>
<head>
<title>Customer SignUp Page</title>
    <link rel="stylesheet" type="text/css" href="signup.css">
<ul>
  <li><a class="active" href="homepage.html">Home</a></li>
  <li><a href="process.html">Process</a></li>
  <li><a href="contact.html">Contact us</a></li>
  <li><a href="aboutus.html">About</a></li>
</ul>

<script>
function myFunction()
{
var email=document.form.email.value;
var fname=document.form.fname.value;
var lname=document.form.lname.value;
var mobnum=document.form.mobnum.value;
var add=document.form.add.value;

if(email=="" || pass=="" || fname=="" || lname=="" || mobnum=="" || add=="")
{
	document.getElementById('mydiv').innerHTML="Please enter all details";
	return false;
}

            if(email=="")
			{
				alert("Enter valid eamil");
				return false;
			}

            if(mobnum.lenght<10)
            {
                alert("Enter 10 digit Mobile Number");
                return false;
            }

var pass1=document.form.pass.value;
var pass2=document.form.cpass.value;
if(pass1 != pass2)
{
alert("Password do not match");
return false;
}
else
{
alert("Password match!!!");
document.getElementById("signUp").submit();
}
}
</script>
</head>

<body>
    <div class="loginbox">
    <img src="logo.png" class="avatar">
        <h1>Customer SignUp Form</h1>
        <form action="signup.jsp" name="form" id="signUp" onSubmit='return myFunction()' method="post">
            <p>First Name</p>
            <input type="text" name="fname" placeholder="First Name"><br><br>
            <p>Last Name</p>
            <input type="text" name="lname" placeholder="Last Name"><br><br>
		    <p>Email ID</p>
            <input type="text" name="email" placeholder="Email ID"><br><br>
            <p>Mobile Number</p>
            <input type="text" name="mobnum" placeholder="Mobile Number"><br><br>
            <p>Address</p>
            <input type="text" name="add" placeholder="Address"><br><br>
            <p>Password</p>
            <input type="password" name="pass" placeholder="Password" value=""><br><br>
             <p>Confirm Password</p>
            <input type="password" name="cpass" placeholder="Confirm Password" value=""><br><br>
			<center><font color="red"><div id='mydiv'></div></font></center>
            <center><input type="submit" name="signUp" value="Sign Up"></center><br>
            <center><c><a href="page1.jsp">Login as Customer?</a></c></center><br>
            <center><c><a href="serprologin.jsp">Login as Service Provider</a></c></center>
        </form>
    </div>
</body>
</html>