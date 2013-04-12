   function edit_task_ajax()
  {
    var assignee=document.getElementById("tambahassignee").value;
    var tag=document.getElementById("tambahtag").value;
    var deadline=document.getElementById("editdeadline").value;
    var hapus_assignee=document.getElementById("hapusassignee").value;
    var hapus_tag=document.getElementById("hapustag").value;
	
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
            if (xmlhttp.readystate==4&&xmlhttp.status==200)
            {
        	document.getElementById("bisadiedit").innerHTML=xmlhttp.responseText;
            }							
	}
	xmlhttp.open("GET","updatetugas.jsp?ID_tugas=<%out.println(ID_tugas);%>"+"&tambahassignee="+assignee+"&deadline="+deadline+"&tambahtag="+tag+"&hapusassignee="+hapus_assignee+"&hapustag="+hapus_tag,true);
	xmlhttp.send();							
    }