<html>
    <head>
        <%
        if(session.getAttribute("sUsername")== null || session.getAttribute("sUsername").equals(""))
        {
            response.sendRedirect("index.jsp?error=Belom Login");
        }
        %>
        <title></title>
        <%@ page language="java" import="java.util.ArrayList,helper.MyDatabase,java.sql.ResultSet,controller.tugasList,java.lang.*;" errorPage="" %>
        <script type="text/javascript">
            function more() {
                var i;
                for (i = 0; i < 12; i++) {
                    if (i < 10)
                        document.getElementById(i).style.display = "none";
                    else
                        document.getElementById(i).style.display = "block";
                }
                document.getElementById("buttonc").style.display = "none";
            }
        </script>
    </head>
    <body>
        <%
    String value = request.getParameter("textvalue");
    String[] filter_user = request.getParameterValues("filter");
    String fKategori = request.getParameter("fKategori");
    String fNamaTugas = request.getParameter("fNamaTugas");
    String fTags = request.getParameter("fTags");
    String fKomen = request.getParameter("fKomen");
    ArrayList<String> ids = new ArrayList<String>();
    int jmlh=0;

    boolean first = true;
    StringBuilder query;
    out.println("<div> Search Task Result");
    //if(!value.equals("")) {
    if(true) {
        query = new StringBuilder();
        query.append("SELECT * ");
        query.append("FROM tugas1 ");
        query.append("ORDER BY kategori");
        //out.println(query.toString());

        tugasList.fill(query.toString());
        if(fKategori != null) { 
            for(int i=0;i<tugasList.aTugas.size();i++) {
                if(tugasList.aTugas.get(i).kategori.contains(value)) {
                    jmlh++;
                    ids.add(tugasList.aTugas.get(i).ID_tugas);
                    }
                }
        }
        if(fNamaTugas != null) { 
            for(int i=0;i<tugasList.aTugas.size();i++) {
                if(tugasList.aTugas.get(i).nama_tugas.contains(value) && !ids.contains(tugasList.aTugas.get(i).ID_tugas)) {
                    jmlh++;
                    out.println(tugasList.aTugas.get(i).ID_tugas);
                    ids.add(tugasList.aTugas.get(i).ID_tugas);
                    }
                }
        }
        if(fTags != null) { 
            for(int i=0;i<tugasList.aTugas.size();i++) {
                if(tugasList.aTugas.get(i).tags.contains(value) && !ids.contains(tugasList.aTugas.get(i).ID_tugas)) {
                    jmlh++;
                    ids.add(tugasList.aTugas.get(i).ID_tugas);
                    }
                }
        }
        if(fKomen != null) { 
            for(int i=0;i<tugasList.aTugas.size();i++) {
                if(tugasList.aTugas.get(i).containKomen(value) && !ids.contains(tugasList.aTugas.get(i).ID_tugas)) {
                    jmlh++;
                    ids.add(tugasList.aTugas.get(i).ID_tugas);
                    }
                }
        }
    }
    int index=0;
    int c=0;
    while(c<jmlh) {
        index=0;
        while(index<tugasList.aTugas.size()) {
            if(tugasList.aTugas.get(index).ID_tugas.equals(ids.get(c))) {
                out.println(tugasList.aTugas.get(index).show(index)); }
            index++;
        }
        c++;
    }
    if(jmlh>10) {
        out.println("<input type=\"button\" id=\"buttonc\" onclick=\"more()\" value=\"MORE\">");
    }
    out.println("</div>");
    

        query = new StringBuilder();
        query.append("SELECT * ");
        query.append("FROM user1 ");
        first=true;
        for(int i=0;i<filter_user.length;i++) {
                if(first) {
                        first=false;
                        query.append("WHERE ");
                        query.append(filter_user[i]);
                        query.append(" LIKE '%");
                        query.append(value);
                        query.append("%'");
                } else {
                        query.append(" OR ");
                        query.append(filter_user[i]);
                        query.append(" LIKE '%");
                        query.append(value);
                        query.append("%'");
                }
        }
        //out.println(query.toString());
        ResultSet users = MyDatabase.getSingleton().selectDB(query.toString());
        out.println("<div> Search User Result");
        while(users.next()) {
                out.println("<div>");
                out.println("<img src=\"avatar/"+users.getString("avatar")+"\" width=\"75\" height=\"75\"><br>");
                out.println("Username : <a href=\"profile.jsp?username="+users.getString("username")+"\">"+users.getString("username")+"</a>");
                out.println("<br>Nama Lengkap : "+users.getString("nama_lengkap"));
                out.println("</div>");

        }
        out.println("</div>");
        %>
    </body>
    <html>
