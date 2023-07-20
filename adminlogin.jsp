<html>
<head>
<script>
function validate()
{
var user=document.form.user.value;
var pass=document.form.pass.value;
if(user=="" || pass=="")
{
	document.getElementById('mydiv').innerHTML="Please enter login details";
	return false;
}
}
</script>
<title>Admin Login Form Design</title>
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
        <h1>Admin Login</h1>
        <form action="admin_home.html" name="form" id="login" method="post" onSubmit='return validate()'>
            <p>Username</p>
            <input type="text" name="user" id="user" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="pass" id="pass" placeholder="Enter Password">
		<center><font color="red"><div id='mydiv'></div></font></center>
            <input type="submit" name="alogin" value="Login"><br>
        </form>
    </div>
</body>
</html>