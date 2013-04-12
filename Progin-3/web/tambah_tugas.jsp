<!DOCTYPE html>
<html>
    <head>
        <%
        if(session.getAttribute("sUsername")== null || session.getAttribute("sUsername").equals(""))
        {
            response.sendRedirect("index.jsp?error=Belom Login");
        }
        %>
        <title>Tambah Tugas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tambah_tugas.css" type="text/css" media="screen">
        <script type="text/javascript" src="js/validasinamatugas.js"></script>
        <script type="text/javascript" src="js/autosuggestion.js"></script>
        <script type="text/javascript" src="js/searchsuggestion.js"></script>
        <script>  window.onload = function() {
                var oTextbox = new AutoSuggestControl(document.getElementById("assignee"), new AssigneeSuggestions());
            }
        </script>

    </head>
    <body>
        <div id="efek" class="form-tambah-tugas">
            <form id="formt" name="formt" enctype="multipart/form-data" action="doTambahtugas.jsp" autocomplete="on" method="POST">
                <label> Kategori : 
                    <span class="small" id="warningKategori">Kategori task</span></label>
                <input id="kategoriTask" type= "text" name= "kategoriTask" required= "required" value="<%out.println(request.getParameter("kategori"));%>" disabled>
                <label> Nama Task : 
                    <span class="small" id="warningtask">judul task</span></label>
                <input id="namaTask" type= "text" name= "namaTask" required= "required" placeholder="ex : TUBES PROGIN" onkeyup="NamaTugasValidation();">
                <label>Attachment : 
                    <span class="small">masukkan file attach</span></label> 
                <input type="file" id="attach" name="fileattach" required="required">

                <label>Attachment : 
                    <span class="small">file lainnya</span></label>
                <input type="file" id="attach2" name="fileattach1" >
                <input type="button" id="button1" onclick="show2()" value="More attachment">
                <div id="tambahan1">
                    <label>Attachment : 
                        <span class="small">file lainnya</span></label>
                    <input type="file" id="attach3" name="fileattach2">
                    <input type="button" id="button2" onclick="show3()" value="More attachment">
                </div>
                <div id="tambahan2">
                    <label >Attachment : 
                        <span class="small">file lainnya</span></label>
                    <input type="file" id="attach4" name="fileattach3">
                    <input type="button" id="button3" onclick="show4()" value="More attachment">
                </div>
                <div id="tambahan3">
                    <label >Attachment : 
                        <span class="small">file lainnya</span></label>
                    <input type="file" id="attach5" name="fileattach3">
                    <input type="button" id="button4" onclick="show5()" value="More attachment">
                </div>
                <label>Deadline : 
                    <span class="small">kapan batas terakhir dikumpul</span></label>
                <input type="date" id="deadline" name="deadline" required= "required">

                <label> Assignee : 
                    <span class="small">yang tanggung jawab</span> </label> 
                <input id="assignee" name="assignee" type="text" autocomplete="on" placeholder="ex : AKU KAMU DAN DIA" required= "required"> 
                <div id="asg1">
                    <label> Assignee : 
                        <span class="small">yang tanggung jawab</span> </label> 
                    <input id="assignee2" type="text" autocomplete="on" placeholder="ex : AKU KAMU DAN DIA" required= "required"> 
                    <input type="button" id="buttona" onclick="showa()" value="More assignee">
                </div>
                <div id="asg2">
                    <label> Assignee : 
                        <span class="small">yang tanggung jawab</span> </label> 
                    <input id="assignee3" type="text" autocomplete="on" placeholder="ex : AKU KAMU DAN DIA" required= "required"> 
                    <input type="button" id="buttonb" onclick="showb()" value="More assignee">
                </div>
                <div id="asg3">
                    <label> Assignee : 
                        <span class="small">yang tanggung jawab</span> </label> 
                    <input id="assignee4" type="text" autocomplete="on" placeholder="ex : AKU KAMU DAN DIA" required= "required"> 
                    <input type="button" id="buttonc" onclick="showc()" value="More assignee">
                </div>

                <label> Komentar : 
                    <span class="small"> komentar tentang tugas</span></label>
                <textarea rows="3" cols="30" name="komentar">tugasnya sulit</textarea>
                <label> Tag : 
                    <span class="small"> tag tugas </span></label>
                <input type="text" placeholder="ex : PROGIN,TUBES" id="tag" required= "required" name="tag">

                <button onclick="submitform()"> Tambahkan tugas </button>

            </form>
        </div>
    </body>
</html>
