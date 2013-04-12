<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <%
        if(session.getAttribute("sUsername")== null || session.getAttribute("sUsername").equals(""))
        {
            response.sendRedirect("index.jsp?error=Belom Login");
        }
        %>
        <title>S.Y.N. Share Your Notes</title>
        <link rel="stylesheet" href="loginpage.css" type="text/css" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <iframe src="header.jsp" height="250" width="1200" name="atas">
        </iframe>
        <iframe src="dashboard.jsp" height="750" width="1000" name="bawah">
        </iframe>
    </body>
</html>
