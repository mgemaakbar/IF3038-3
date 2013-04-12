<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>

<%
    String username=request.getParameter("login_username");
    String password=request.getParameter("login_password");
    String message="User login successfully";
    
    String tQuery = "SELECT * FROM user1 WHERE username='"+username+"' AND password='"+password+"';";
    try{
   
    ResultSet tResult = MyDatabase.getSingleton().selectDB(tQuery);
  
    if(tResult.next())
    {
      session.setAttribute("sUsername",tResult.getString("username"));
      session.setAttribute("sAvatar",tResult.getString("avatar"));
      session.setAttribute("sNama",tResult.getString("nama_lengkap"));
      response.sendRedirect("mainpage.jsp");
    }
    else
    {
      message="No user or password matched" ;
      response.sendRedirect("index.jsp?error="+message);
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>
