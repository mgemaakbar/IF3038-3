<%-- 
    Document   : updateprofil
    Created on : 12 Apr 13, 13:51:36
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
// String username=request.getParameter("username");
 String birth=request.getParameter("avatar");    
 String birth=request.getParameter("birth");
 String namaLengkap=request.getParameter("namaLengkap");
 String password=request.getParameter("password");
// String email=request.getParameter("email");

 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
     FileItemFactory factory = new DiskFileItemFactory();
     ServletFileUpload upload = new ServletFileUpload(factory);
     List items = null;
     try {
             items = upload.parseRequest(request);
     } catch (FileUploadException e) {
             e.printStackTrace();
     }
     Iterator itr = items.iterator();
     while (itr.hasNext()) {
     FileItem item = (FileItem) itr.next();
     if (item.isFormField()) {
          String fieldname = item.getFieldName();
          String fieldvalue = item.getString();
          if(fieldname.equals("birth")) {
              birth=fieldvalue;
          }
          if(fieldname.equals("namaLengkap")) {
              namaLengkap=fieldvalue;
          }
          if(fieldname.equals("password")) {
              password=fieldvalue;
          }   

     } else {
         try {
             String itemName = item.getName();
             session.setAttribute("sAvatar",itemName);
             session.setAttribute("sFullName",namaLengkap);
             String tQuery = "UPDATE `progin_405_13510099`.`user1` SET avatar='"itemName+"', tanggal_lahir='"+birth+"', nama_lengkap='"+namaLengkap+"', password='"+password+"'";

             File savedFile = new File(config.getServletContext().getRealPath("/")+"avatar/"+itemName);
             item.write(savedFile);  
             out.println(tQuery);
             int res = MyDatabase.getSingleton().queryDB(tQuery);
             if(res!=-1) {
                  response.sendRedirect("mainpage.jsp?");
             } else {
                 response.sendRedirect("profil.jsp?error=Edit Profil Error");
             }
         } catch (Exception e) {
                 e.printStackTrace();
         }
         }
       }
 }

%>
