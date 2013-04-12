<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<% //halaman update tugas
    //yang hyperlink ke assignee nya belum benar
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    String tambahtag=new String(""); 
    String tambahassignee=new String("");
    String hapustag=new String("");
    String hapusassignee=new String("");
    String ID_tugas=new String("");
    String deadline=new String("");
    
    deadline=request.getParameter("deadline");
    
    ID_tugas=request.getParameter("ID_tugas");
    tambahtag=request.getParameter("tambahtag");
    tambahassignee=request.getParameter("tambahassignee");
    hapustag=request.getParameter("hapustag");
    hapusassignee=request.getParameter("hapusassignee");
    
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    
    if (!tambahtag.equals("") && tambahtag!=null) {st.executeUpdate("INSERT INTO tag_tugas1 VALUES ('"+ID_tugas+"','"+tambahtag+"')");};
    if (!tambahassignee.equals("") && tambahassignee!=null) {st.executeUpdate("INSERT INTO asignee_tugas1 VALUES ('"+ID_tugas+"','"+tambahassignee+"')");};
    if (hapusassignee!=null) st.executeUpdate("DELETE FROM asignee_tugas1 WHERE ID_tugas='"+ID_tugas+"' AND username='"+hapusassignee+"';");
    if (hapustag!=null) st.executeUpdate("DELETE FROM tag_tugas1 WHERE ID_tugas='"+ID_tugas+"' AND tag='"+hapustag+"';");
    if (!deadline.equals("") && deadline!=null) {st.executeUpdate("UDPATE tugas1 SET deadline='"+deadline+"' WHERE ID_tugas='"+ID_tugas+"';");};
    
    ArrayList<String> arr_tag=new ArrayList<String>();
    ArrayList<String> arr_assignee=new ArrayList<String>();
    ArrayList<String> arr_namaass=new ArrayList<String>();
    
    rst=st.executeQuery("SELECT * FROM tag_tugas1 WHERE ID_tugas='"+ID_tugas+"';"); //ngambil tag
    
    while (rst.next())
    {
        arr_tag.add(rst.getString("tag"));
    }

    rst=st.executeQuery("SELECT * FROM asignee_tugas1 WHERE ID_tugas='"+ID_tugas+"';"); //ngambil assignee
    
    while (rst.next())
    {
        arr_assignee.add(rst.getString("username"));
    }
    
    rst=st.executeQuery("SELECT * FROM tugas1 WHERE ID_tugas='"+ID_tugas+"'");
    rst.next();
    deadline=rst.getString("deadline");
    %>
    Tag:
    <%
        for (int i=0;i<arr_tag.size();i++)
        {
            out.println(arr_tag.get(i)+",");
        }
                       
    %> <br>
    Assignee: 
    <%
        for (int i=0;i<arr_assignee.size();i++)
        {
            
            %><a href="profile.jsp?username=<%out.println(arr_assignee.get(i));%>"><%out.println(arr_assignee.get(i));%></a>,<%
        }
    %><br>
    Deadline: <%out.println(deadline);%><br>
<%
%>