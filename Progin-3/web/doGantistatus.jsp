<%@ page language="java" import="helper.MyDatabase;" errorPage="" %>

<%
	String id=request.getParameter("ID_tugas");
	String status=request.getParameter("status");
	
        String query;
	if(status.equals("sudah")){
		query=("UPDATE tugas1 SET  status =  'belum' WHERE  ID_tugas =  '"+id+"';");
	} else {
		query=("UPDATE tugas1 SET  status =  'sudah' WHERE  ID_tugas =  '"+id+"';");
	}

        int hasil= MyDatabase.getSingleton().queryDB(query);
        if(hasil!=-1) {
                out.println("<br/> Data telah tersimpan.");
        }else out.println("<br/> Error! Data tidak terupdate");
%>