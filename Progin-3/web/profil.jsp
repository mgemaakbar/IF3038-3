<%-- 
    Document   : profil
    Created on : 12 Apr 13, 10:50:19
    Author     : rahmi
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="java.lang.String" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%--@include file="doLogin.jsp"--%>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<%
if(session.getAttribute("sUsername") == null || session.getAttribute("sUsername").equals(""))
{
response.sendRedirect("index.jsp?error=Belom Login");
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Profil</title>
        <link rel="stylesheet" type="text/css" href="css/profil.css">
        <script src="js/registrasi.js"></script>
    </head>
    <body>
        <div id="profile-header">  
                <h1 id="profile-title"> Profile </h1>
        </div>
            <div id="profile-biodata">
                <img id="profile-img" src="HTML5_Logo_512.png" width="150" height="150">
                <h4> Username 	:<% /*(String)session.getAttribute("sUsername"); */out.println(" "+ request.getAttribute("username") + " "); %>	</h4>
                <h4> Nama Lengkap 	:<% /*(String)session.getAttribute("sFullName");*/ out.println(" "+ request.getAttribute("nama_lengkap") + " "); %>	</h4>
                <h4> Tanggal lahir 	:<% /*(String)session.getAttribute("sBirth");*/ out.println(" "+ request.getAttribute("tanggal_lahir") + " "); %>	</h4>
                <h4> Email 		:<% /*(String)session.getAttribute("sEmail");*/ out.println(" "+ request.getAttribute("email") + " "); %>	</h4>
                <a href="editprofil.jsp"> <input type="submit" value="Edit"></a>

            </div>   
        <%--
            String username=request.getParameter("login_username");
            String password=request.getParameter("login_password");
            String tQuery = "SELECT * FROM user1 WHERE username='"+username+"' AND password='"+password+"';";              
            try
            {
                ResultSet tResult = MyDatabase.getSingleton().selectDB(tQuery);
                while (result.next()) { 
                    session.getAttribute("sAvatar",tResult.getString("avatar"));
                    session.getAttribute("sUsername",tResult.getString("username"));
                    session.getAttribute("sFullName",tResult.getString("nama_lengkap"));
                    session.getAttribute("sBirth",tResult.getString("tanggal_lahir"));
                    session.getAttribute("sEmail",tResult.getString("email"));
                    response.sendRedirect("mainpage.jsp"); } 
            } catch (Exception e) {
                e.printStackTrace(); } 
          --%>
        
            <div id="profile-tugas">
                    <h1> Tugas </h1>
                    <p> bla bla bla---yang ini belom <p>
            </div>
    </body>
</html