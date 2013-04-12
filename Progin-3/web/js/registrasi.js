function checkUsername() {
    var uname=document.forms["register"]["username"].value;
    if(uname=="" || uname==null)
        {document.getElementById('usernameWarning').innerHTML="*Username tidak boleh kosong";return false;}
    else
    if(uname.length<5)
        {document.getElementById('usernameWarning').innerHTML="*Username minimal 5 huruf";return false;}
    else
        {document.getElementById('usernameWarning').innerHTML="";return true;}
}

function checkPassword() {
    var uname=document.forms["register"]["username"].value;
    var pass=document.forms["register"]["password"].value;
    var email=document.forms["register"]["email"].value;
    if(pass=="" || pass==null)
        {document.getElementById('passwordWarning').innerHTML="*Password tidak boleh kosong";return false;}
    else
    if(pass.length<8)
        {document.getElementById('passwordWarning').innerHTML="*Password minimal 8 karakter";return false;}
    else
    if(pass==uname)
        {document.getElementById('passwordWarning').innerHTML="*Password tidak boleh sama dengan username";return false;}
    else
    if(pass==email)
        {document.getElementById('passwordWarning').innerHTML="*Password tidak sama dengan e-mail";return false;}
    else
        {document.getElementById('passwordWarning').innerHTML="";return true;}
}

function checkConfirmPassword() {
    var pass1=document.forms["register"]["password"].value;
    var pass2=document.forms["register"]["confirmPassword"].value;
    if(pass1!=pass2)
        {document.getElementById('confirmPasswordWarning').innerHTML="*Password tidak cocok";return false;}
    else
        {document.getElementById('confirmPasswordWarning').innerHTML="";return true;}
}

function checkNama() {
    var nama=document.forms["register"]["namaLengkap"].value;
    var spacepos=nama.indexOf(" ");
    if(nama=="" || nama==null)
        {document.getElementById('namaWarning').innerHTML="*Nama tidak boleh kosong";return false;}
    else
        if(spacepos<0)
            {document.getElementById('namaWarning').innerHTML="*Nama minimal 2 kata";return false;}
        else
            {document.getElementById('namaWarning').innerHTML="";return true;}
}

function checkEmail() {
    var email=document.forms["register"]["email"].value;
    var atpos=email.indexOf("@");
    var dotpos=email.lastIndexOf(".");
    if(email=="" || email==null)
        {document.getElementById('emailWarning').innerHTML="*E-mail tidak boleh kosong";return false;}
    else
        if(atpos<1 || dotpos<atpos+1 || (dotpos+2)>=email.length)
            {document.getElementById('emailWarning').innerHTML=("*e-mail tidak valid");return false;}
        else
            {document.getElementById('emailWarning').innerHTML="";return true;}
}


function check_extension() {
      var filename=document.forms["register"]["avatar"].value;
      var re = /\..+$/;
      var ext = filename.match(re);
      if(!(ext==".jpg" || ext==".jpeg"))
           {document.getElementById('avatarWarning').innerHTML="*Ekstensi file tidak diterima";return false;}
       else
           {document.getElementById('avatarWarning').innerHTML="";return true;}
}


function checkValidation() {
    if( !(checkUsername() && checkPassword() && checkConfirmPassword() && checkNama() && checkEmail() && check_extension()) ) {
        {document.getElementById('submitWarning').innerHTML="*Data ada yang salah";return false;}
    }
    else return true;
    
    
}
