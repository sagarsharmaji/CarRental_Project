<html>
<head>
<script>
function validate()
{
var email=document.form.semail.value;
var pass=document.form.pass.value;
if(email=="" || pass=="")
{
	document.getElementById('mydiv').innerHTML="Please enter login details";
	return false;
}
}
</script>
<title>SP Login Form Design</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<ul>
  <li><a class="active" href="homepage.html">Home</a></li>
  <li><a href="process.html">Process</a></li>
  <li><a href="contact.html">Contact us</a></li>
  <li><a href="AboutUs.html">About</a></li>
</ul>
<body>
    <div class="loginbox">
    <img src="logo.png" class="avatar">
        <h1>SP Login</h1>
        <form action="splogin2.jsp" name="form" id="login" method="post" onSubmit='return validate()'>
            <p>Username</p>
            <input type="text" name="semail" id="semail" placeholder="Enter Email">
            <p>Password</p>
            <input type="password" name="pass" id="pass" placeholder="Enter Password">
		<center><font color="red"><div id='mydiv'></div></font></center>
            <input type="submit" name="login" value="Login"><br>
            <a href="serpro_sign.jsp ">Don't have an account?</a>
            <a href="page1.jsp">Log in as an Customer?</a>
        </form>
    </div>
</body>
</html>