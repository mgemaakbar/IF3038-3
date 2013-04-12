<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet,java.lang.*;" errorPage="" %>
<%
//get the q parameter from URL
String q = request.getParameter("q");
String hint="";
// Fill up array with names
ResultSet tSet = MyDatabase.getSingleton().selectDB("SELECT * FROM user1");
//lookup all hints from array if length of q>0
if (!(q.equals("") || q == null))
  {
  hint="";
  while(tSet.next())
    {
    if(q.toLowerCase().equalsIgnoreCase(tSet.getString("username").substring(0,q.length())))
      {
      if (hint=="")
        {
        hint=tSet.getString("username");
        }
      else
        {
        hint+=";"+tSet.getString("username");
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