<%@ page import="java.sql.*" %>
<%
  String waktu=new String("");
  waktu=request.getParameter("waktu"); //hapus berdasarkan waktu. 
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=null;
  ResultSet rst=null;
  Statement st=null;
  
  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
  st=con.createStatement();
  st.executeUpdate("DELETE FROM komentar_tugas1 WHERE waktu_komentar='"+waktu+"';");
  out.println("komentar terhapus");
  
  
%>