<%-- 
    Document   : doLogout
    Created on : Apr 11, 2013, 4:04:21 PM
    Author     : Toshiba L645
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setDateHeader("Expires",0);
    response.sendRedirect("index.jsp?error=Sampai Jumpa Lagi");
%>
