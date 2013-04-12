<!DOCTYPE html>
<html>
    <head>
        <%
        if(session.getAttribute("sUsername")== null || session.getAttribute("sUsername").equals(""))
        {
            response.sendRedirect("index.jsp?error=Belom Login");
        }
        %>
        <title>Header</title>
        <link rel="stylesheet" href="css/header.css" type="text/css" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/autosuggestion.js"></script>
        <script type="text/javascript" src="js/searchsuggestion.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                var oTextbox = new AutoSuggestControl(document.getElementById("searchtext"),new SearchSuggestions());
            }
            function submitform() {
                document.forms["searchform"].submit();
                document.forms["searchform"].reset();
            }
        </script>
    </head>
    <body>
        <header >	
            <div id="tes">
                <h1 id="logo"><a href="dashboard.jsp?kategori=%" target="bawah"><img src="images/logo.png"/></a>
                <img src="avatar/<% out.println(session.getAttribute("sAvatar"));%>" width="100" height="150"/>
            </div>
        </header>
        <div id="ttab">
            <a href="dashboard.jsp?kategori=%" target="bawah">Dashboard</a> &emsp;&emsp;
            <a href="rinciantugas" target="bawah">Rincian Tugas</a>&emsp;&emsp;
            <a href="tambah_tugas.jsp?kategori=uncategorized" target="bawah">Tambah Tugas</a>&emsp;&emsp;
            <a href="profil.jsp?username=<% out.println(session.getAttribute("sUsername"));%>" target="bawah">Profil</a>&emsp;&emsp;
            <a href="doLogout.jsp" target="_parent">Logout(<% out.print(session.getAttribute("sNama"));%>)</a>
        </div>
        <div id="sbox">
            <form name="searchform"  action="search.jsp" target="bawah" method="POST" >
                <input id="searchtext" name="textvalue" type="text">
                <input type="submit" value="search"><br>
                <label><input type="checkbox" name="filter" value="username" checked>Username</label>
                <label><input type="checkbox" name="filter" value="email">Email</label>
                <label><input type="checkbox" name="filter" value="nama_lengkap">Nama Lengkap</label>
                <label><input type="checkbox" name="filter" value="tanggal_lahir">Tanggal lahir</label><br>
                <label><input type="checkbox" name="fKategori" value="kategori" checked>Judul kategori</label>
                <label><input type="checkbox" name="fNamaTugas" value="nama_tugas" checked>Judul task</label>
                <label><input type="checkbox" name="fTags" value="tags">Tags task</label>
                <label><input type="checkbox" name="fKomen" value="komentar">Komentar task</label>
            </form>
        </div>
    </body>
</html>