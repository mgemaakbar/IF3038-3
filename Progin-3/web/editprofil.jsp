<%-- 
    Document   : edit_profil
    Created on : 12 Apr 13, 10:35:15
    Author     : rahmi
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>

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
        <link rel="stylesheet" type="text/css" href="css/profil.css">
        <script src="js/registrasi.js"></script>
        <title>Profil</title>
    </head>
    <body>
	<div id="profile-header">  
            <h1 id="profile-title"> Edit Profile </h1>
        </div>
        <div>
         <form id="edit_pro" name="editp" action="updateprofil.jsp" method="POST" enctype="multipart/form-data" id="edit_pro"  onsubmit="return checkValidation();">
            <h2>Edit Profil</h2>
            
            <p>Ganti Avatar <input name="avatar" type="file" size="30" accept="image/jpeg" onchange="check_extension();"  required></p>
            <div id="avatarWarning" class="warningMsg"></div>
            <p>Birth <input name="birth" type="date" required ></p>
            <p>Full Name <input name="namaLengkap" type="text" size="30" maxlength="30" onkeyup="checkNama();" required></p>
            <div id="namaWarning" class="warningMsg"></div>
            <p>Password  <input name="password" type="password" size="30" maxlength="20" onkeyup="checkPassword();"  required></p>
            <div id="passwordWarning" class="warningMsg"></div>
            <p>Confirm Password <input name="confirmPassword" type="password" size="30" maxlength="20" onkeyup="checkConfirmPassword();"  required> </p>
            <div id="confirmPasswordWarning" class="warningMsg"></div>
               
            <input name="btnsubmit" type="submit" value="Save" /> 
            <div id="submitWarning" class="warningMsg"></div>
            <% response.sendRedirect("updateprofil.jsp?error=profil berhasil diganti"); %>
            
         </form>
	</div>   
 
    </body>
</html>
