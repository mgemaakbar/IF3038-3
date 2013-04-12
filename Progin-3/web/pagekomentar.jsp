
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
   <script src="pagekomentar.js"></script>
    <body onclick="updatepage()">
        <%@ page import="java.sql.*"%>
        <%@ page import="java.util.*" %>
       
        <%
            String currentloggeduser=new String("");
            currentloggeduser="username1";
            String ID_tugas=new String("");
            ArrayList<String> arr_komen=new ArrayList<String>();
            ArrayList<String> arr_waktu=new ArrayList<String>();
            ArrayList<String> arr_pembuat=new ArrayList<String>();
            ArrayList<String> arr_ava=new ArrayList<String>();
            
            ID_tugas="tugas1";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=null;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
           if (con == null) out.println("Connection failed.");
            ResultSet rst=null;
            Statement st=null;
            
            st=con.createStatement();
            rst=st.executeQuery("select * from komentar_tugas1 where ID_tugas='"+ID_tugas+"' ORDER BY waktu_komentar ASC;"); //ngambil komentar
            //sudah ke sort berdasarkan waktu input komentar
        
           while (rst.next())
            { //agak ragu dengan masalah reference2an
                arr_komen.add(rst.getString("komentar"));
               arr_waktu.add(rst.getString("waktu_komentar"));
               arr_pembuat.add(rst.getString("username"));    
            }
           
         
            int n_komentar=arr_komen.size(); //variabel banyajknya komentar
            //ngeprint banyaknya komentar
             out.println("Banyak komentar: "+n_komentar);%><br><br> 
            <%               
           int i=0; //buat indeks2an
          
           rst=st.executeQuery("select avatar from user1 where username='"+arr_pembuat.get(i)+"';");
            while (rst.next())
            {
              arr_ava.add(rst.getString("avatar"));
              i++;
              if (i < n_komentar) rst=st.executeQuery("select avatar from user1 where username='"+arr_pembuat.get(i)+"';");   
             }
             
            i=0;
            int written_kom=0; //variabel yang mencatat sudah berapa komentar yang ditulis 
            int indeks_awal=0;
            int indeks_akhir=0;
            int halaman=Integer.parseInt(request.getParameter("halaman"));
            //halaman 1 0..9 (halaman-1)*10..x+9 
            //2 10..19
            //3
            indeks_awal=(halaman-1)*10;
            int bakalditulis=0;
            int totalhal=0;
            if (arr_komen.size() % 10 > 0) {totalhal=(arr_komen.size()/10)+1;} else {totalhal=arr_komen.size()/10;};
            
            //totalkomen=x*10+sisa
            //if sisa > 0 then tothalaman x+1 else if sisa = 0 tothalaman=x
            //
            //0..9
            //10..19
            //0..9
            //10..19
            //20..29
               
            if (arr_komen.size()<=10) {indeks_akhir=arr_komen.size()-1;} else
                {
                    if (halaman == totalhal) {bakalditulis=arr_komen.size()-(halaman-1)*10;indeks_akhir=indeks_awal+bakalditulis-1;};
                    if (halaman < totalhal) {bakalditulis=10;indeks_akhir=indeks_awal+bakalditulis-1;};                
                };
            
            i=indeks_awal;
            
            while (i<=indeks_akhir)
            {
                %>
                <script>
			function hapuskomen<%out.print(i);%>()
			{
				var xmlhttp;
				if (window.XMLHttpRequest)
				{
					xmlhttp=new XMLHttpRequest();
				}
				else
				{
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange=function()
				{
					if (xmlhttp.readyState == 4 && xmlhttp.status==200)
					{
						document.getElementById("komen<%out.print(i);%>").innerHTML=xmlhttp.responseText;
					};			
				}
				xmlhttp.open("GET","hapuskomentar.jsp?waktu=<%out.print(arr_waktu.get(i));%>",true);
				xmlhttp.send();
			}                    
                </script>                 
                <div id="komen<%out.println(i);%>">
               
                Avatar komentator: <img src="avatar/<%out.println(arr_ava.get(i));%>"></img><br>
                Waktu komentar: <%out.println(arr_waktu.get(i));%><br>
                Komentar: <%out.println(arr_komen.get(i));%><br>
                </div>
                <%if (currentloggeduser.equals(arr_pembuat.get(i))) {%><button onclick="hapuskomen<%out.print(i);%>()">Hapus komentar!</button><br><%};%>
                <%i++;%>
            <%
            
           }
           //rumus untuk paginasi
           //total=(hal-1)*10+sisa
           // 1  2
           // 10 5 
            int sisa=arr_komen.size()-(halaman)*10;  //sisa komentar yang belum ketulis                
            if (sisa > 0) {out.println("<a href=\"pagekomentar.jsp?halaman="+(halaman+1)+"\">Halaman berikutnya</a>");};
            if (halaman > 1) {out.println("<a href=\"pagekomentar.jsp?halaman="+(halaman-1)+"\">Halaman sebelumnya</a>");};
  
   %>
    </body>
</html>
