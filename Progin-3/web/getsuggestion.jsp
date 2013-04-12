<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet,java.lang.*;" errorPage="" %>
<%
//get the q parameter from URL
String q = request.getParameter("q");
String hint="";
ResultSet tSet;
// Fill up array with names
        tSet = MyDatabase.getSingleton().selectDB("SELECT * FROM user1");
//lookup all hints from array if length of q>0
if (!(q.equals("") || q == null)) {
  while(tSet.next()) {
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("username").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("username");
        } else {
        hint+=";"+tSet.getString("username");
        }
      }
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("email").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("email");
        } else {
        hint+=";"+tSet.getString("email");
        }
      }
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("nama_lengkap").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("nama_lengkap");
        } else {
        hint+=";"+tSet.getString("nama_lengkap");
        }
      }
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("tanggal_lahir").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("tanggal_lahir");
        } else {
        hint+=";"+tSet.getString("tanggal_lahir");
        }
      }
    }
  
// Fill up array with names
        tSet = MyDatabase.getSingleton().selectDB("SELECT * FROM tugas1");
//lookup all hints from array if length of q>0
  while(tSet.next()) {
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("nama_tugas").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("nama_tugas");
        } else {
        hint+=";"+tSet.getString("nama_tugas");
        }
      }
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("kategori").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("kategori");
        } else {
        hint+=";"+tSet.getString("kategori");
        }
      }
    }
  
 // Fill up array with names
        tSet = MyDatabase.getSingleton().selectDB("SELECT DISTINCT tag FROM tag_tugas1");
//lookup all hints from array if length of q>0
  while(tSet.next()) {
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("tag").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("tag");
        } else {
        hint+=";"+tSet.getString("tag");
        }
      }
    }
// Fill up array with names
        tSet = MyDatabase.getSingleton().selectDB("SELECT DISTINCT komentar FROM komentar_tugas1");
//lookup all hints from array if length of q>0
  while(tSet.next()) {
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("komentar").substring(0,q.length())))  {
      if (hint==""){
        hint=tSet.getString("komentar");
        } else {
        hint+=";"+tSet.getString("komentar");
        }
      }
    }
  }

// Set output to "no suggestion" if no hint were found
// or to the correct values
String respon;
if (hint.equals("") || hint == null)
  {
  respon=q;
  }
else
  {
  respon=hint;
  }
//output the response
out.print(respon);


%>