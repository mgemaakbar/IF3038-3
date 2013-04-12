<%@ page import="java.sql.*"%>
<%
    String ID_tugas=new String("");
    ID_tugas=request.getParameter("ID_tugas");
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    
    con=DriverManager.getConnection("jdbc:mysq://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    st.executeUpdate("DELETE FROM tugas1 WHERE ID_tugas='"+ID_tugas+"';");
    st.executeUpdate("DELETE FROM asignee_tugas1 WHERE ID_tugas='"+ID_tugas+"';");
    st.executeUpdate("DELETE FROM komentar_tugas1 WHERE ID_tugas='"+ID_tugas+"';");
    st.executeUpdate("DELETE FROM tag_tugas1 WHERE ID_tugas='"+ID_tugas+"';");
    
    out.print("sudah terhapus");
    
%>