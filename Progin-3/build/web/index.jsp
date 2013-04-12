<!-- login-->
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<html>
    <head>
        <title>Shared</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/loginpage.css" />
        <script src="js/registrasi.js"></script>
    </head>

    <body>

        <header >	

            <div id="tes">
                <h1 id="logo"><img src="images/logo.png"/></a>
            </div>
        </header>

        <div id="logincontent">
            <p> LOGIN </p>
            
            <form name="login" action="doLogin.jsp" id="formlogin" method="POST" onsubmit="return checkLogin();">
                <p>Username&emsp;&emsp;&emsp;&emsp; :&emsp;<input type="text" name="login_username" required></p>
                <p>Password &emsp;&emsp;&emsp;&emsp; :&emsp;<input type="password" name="login_password" required></p>
                <input type="submit" value="Login"/>&emsp;
                <input type="reset" value="Cancel"/>
            </form>
            <div class="warningMsg"><%=error%></div>
            <p>REGISTER</p>
            <form name="register" action="doRegister.jsp" method="POST" enctype="multipart/form-data" id="formregister"  onsubmit="return checkValidation();">
                <p>Username&emsp;&emsp;&emsp;&emsp;:&emsp; <input name="username" size="30" type="text" maxlength="20" onkeyup="checkUsername();checkPassword();" required></p>
                <div id="usernameWarning" class="warningMsg"></div>
                <p>Password &emsp;&emsp;&emsp;&emsp;:&emsp; <input name="password" type="password" size="30" maxlength="20" onkeyup="checkPassword();"  required></p>
                <div id="passwordWarning" class="warningMsg"></div>
                <p>Confirm Password &nbsp: &emsp;<input name="confirmPassword" type="password" size="30" maxlength="20" onkeyup="checkConfirmPassword();"  required> </p>
                <div id="confirmPasswordWarning" class="warningMsg"></div>
                <p>Full Name&emsp;&emsp;&emsp;&emsp;:&emsp;  <input name="namaLengkap" type="text" size="30" maxlength="30" onkeyup="checkNama();" required></p>
                <div id="namaWarning" class="warningMsg"></div>
                <p>Email&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;:&emsp;  <input name="email" type="text" size="30" maxlength="50" onkeyup="checkEmail();checkPassword();" required ></p> 
                <div id="emailWarning" class="warningMsg"></div>
                <p>Birth &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;:&emsp;<input name="birth" type="date" required ></p>
                <p>Upload Avatar &emsp;&emsp;:&emsp;<input name="avatar" type="file" size="30" accept="image/jpeg" onchange="check_extension();"  required></p>
                <div id="avatarWarning" class="warningMsg"></div>
                <input name="btnsubmit" type="submit" value="Register Me!" >
                <div id="submitWarning" class="warningMsg"></div>
            </form>
        </div>
        <footer id="colophon">
            <div id="site-generator">
                <p>&copy; <a href="#">KITA</a>-IF3038 Pemrograman Internet 2013 <br />
                </p>
            </div>
        </footer>

    </body>
</html>