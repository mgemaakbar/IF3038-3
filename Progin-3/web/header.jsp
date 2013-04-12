<!DOCTYPE html>
<html>
    <head>
        <title>Header</title>
        <link rel="stylesheet" href="style.css" type="text/css" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/autosuggestion.js"></script>
        <script type="text/javascript" src="js/searchsuggestion.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                //var oTextbox = new AutoSuggestControl(document.getElementById("searchtext"),new SearchSuggestions());
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
		<h1 id="logo"><a href="dashboard.php?kategori=%" target="bawah"><img src="images/logo.png"/></a>
		</div>
	</header>
        <div id="ttab">
				<a href="dashboard.jsp?kategori=%" target="bawah">Dashboard</a> &emsp;&emsp;
				<a href="detailtugas.jsp" target="bawah">Rincian Tugas</a>&emsp;&emsp;
				<a href="tambah_tugas.jsp" target="bawah">Tambah Tugas</a>&emsp;&emsp;
				<a href="profil.jsp" target="bawah">Profil</a>&emsp;&emsp;
				<a href="logout.jsp" target="_parent">Logout</a>
		</div>
		<div id="sbox">
			<form name="searchform"  action="search.php" target="bawah" method="POST" >
				<input id="searchtext" name="textvalue" type="text">
				<input type="submit" value="search" onclick="submitform()"><br>
				<label><input type="checkbox" name="filter2[]" value="username" checked>Username</label><br>
				<label><input type="checkbox" name="filter2[]" value="email">Email</label><br>
				<label><input type="checkbox" name="filter2[]" value="nama_lengkap">Nama Lengkap</label><br>
				<label><input type="checkbox" name="filter2[]" value="tanggal_lahir">Tanggal lahir</label><br>
				<label><input type="checkbox" name="filter1[]" value="kategori" checked>Judul kategori</label><br>
				<label><input type="checkbox" name="filter1[]" value="nama_tugas" checked>Judul task</label><br>
				<label><input type="checkbox" name="filter1[]" value="ttask">Tags task</label><br>
				<label><input type="checkbox" name="filter1[]" value="ktask">Komentar task</label><br>
			</form>
		</div>
    </body>
</html>