<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>

<%
   String ID_tugas=request.getParameter("ID_tugas");
  
   String username=new String("username"); 
   String komentar=new String("komentar");
   username=request.getParameter("username");
   komentar=request.getParameter("komentar");
   SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   Calendar cal=Calendar.getInstance();
   String waktu_komentar=new String(sd.format(cal.getTime()));//berhasil, sudah sesuai format?
   
   Connection con=null;
   ResultSet rst=null;
   Statement st=null;
   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
   st=con.createStatement();
   st.executeUpdate("INSERT INTO komentar_tugas1 VALUES ('"+ID_tugas+"','"+username+"','"+komentar+"','"+waktu_komentar+"')");
   out.println("komentar sudah ditambahkan");
   
%>