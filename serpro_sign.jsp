<html>
<head>
    <title>Service Provider SignUp Page</title>
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
    var spname=document.form.spname.value;
    var mobnum=document.form.mobnum.value;
    var add=document.form.add.value;
    var pass=document.form.pass.value;

    if(email=="" || spname=="" || pass=="" || mobnum=="" || add=="")
    {
        document.getElementById('mydiv').innerHTML="Kindly Enter All Details!";
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
    document.getElementById("sp").submit();
    }
    }
    </script>
    </head>
    <body>
        <div class="loginbox">
        <img src="logo.png" class="avatar">
            <h1>Service Provider SignUp Form</h1>
            <form action="serpro_signup.jsp" name="form" id="sp" onSubmit='return myFunction()' method="post">
                <p>SP Name</p>
                <input type="text" name="spname" placeholder="Service Provider Name"><br><br>
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
                <center><input type="submit" name="sp" value="Sign Up"></center><br>
                <center><c><a href="serprologin.html">Login as Service Provider</a></c></center><br>
                <center><c><a href="page1.jsp">Login as Customer?</a></c></center>
            </form>
        </div>
    </body>
    </html>