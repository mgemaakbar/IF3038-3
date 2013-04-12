<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>
 <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   
<% 
    String kategori=request.getParameter("kategoriTask");
    String nama_tugas=request.getParameter("namaTask");
    String deadline=request.getParameter("deadline");
    String assignee=request.getParameter("assignee");
    String komentar=request.getParameter("komentar");
    String tag = request.getParameter("tag");
    String[] tags = new String[2];
    String itemName;
    try{
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
    } else { 
               FileItemFactory factory = new DiskFileItemFactory();
               ServletFileUpload upload = new ServletFileUpload(factory);
               List items = null;
               try {
                       items = upload.parseRequest(request);
               } catch (FileUploadException e) {
                       e.printStackTrace();
               }
               Iterator itr = items.iterator();
               while (itr.hasNext()) {
               FileItem item = (FileItem) itr.next();
               if (item.isFormField()) {
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString();
                    if(fieldname.equals("kategoriTask") && (fieldvalue!=null || fieldvalue.equals("")) ) {
                        kategori=fieldvalue;
                    }
                    if(fieldname.equals("namaTask") && (fieldvalue!=null || fieldvalue.equals(""))) {
                        nama_tugas=fieldvalue;
                    }
                    if(fieldname.equals("deadline") && (fieldvalue!=null || fieldvalue.equals(""))) {
                        deadline=fieldvalue;
                    }
                    if(fieldname.equals("assignee") && (fieldvalue!=null || fieldvalue.equals(""))) {
                        assignee=fieldvalue;
                    }
                    if(fieldname.equals("komentar") && (fieldvalue!=null || fieldvalue.equals(""))) {
                        komentar=fieldvalue;
                    }
                    if(fieldname.equals("tag") && (fieldvalue!=null || fieldvalue.equals(""))) {
                        tag=fieldvalue;
                        //out.println(tag);
                        if(tag.contains(",")){ 
                            tags = tag.split(",");
                        }
                        else {
                            tags = new String[1];
                            tags[0] = tag;
                        }
                        for(int i = 0; i<tags.length; i++) out.println(tags[i]);
                    }
                    
               } else {
                       try {
                                itemName = item.getName();
                                File savedFile = new File(config.getServletContext().getRealPath("/")+"attachment/"+itemName);
                                //item.write(savedFile);  
                       } catch (Exception e) {
                               e.printStackTrace();
                       }
               }
             }
                String tQuery = "INSERT INTO  `progin_405_13510099`.`tugas1` (`nama_tugas` ,`deadline` ,`status` ,`pembuat_tugas` ,`kategori`)VALUES ("
                                            +" '"+nama_tugas+"',  '"+deadline+"',  'belum',  '"+session.getAttribute("sUsername")+"',  '"+kategori+"');";
                out.println(tQuery);
                int res = MyDatabase.getSingleton().queryDB(tQuery);
                if(res==-1) {
                    out.println("Menambah data gagal");
                    response.sendRedirect("dashboard.jsp");
                } else {
                    out.println("Menambah data berhasil");
                    tQuery = "SELECT ID_tugas FROM `tugas1` WHERE nama_tugas='"+nama_tugas+"' AND deadline='"+deadline+"' AND status='belum' AND pembuat_tugas='"+session.getAttribute("sUsername")+"' AND kategori='"+kategori+"';";
                    out.println(tQuery);
                    ResultSet tRes = MyDatabase.getSingleton().selectDB(tQuery);
                    String id="";
                    if(tRes.next()){
                        out.println(tRes.getString("ID_tugas"));
                        id = tRes.getString("ID_tugas");
                    }
                    for(int a=0;a<tags.length;a++) {
                    tQuery = "INSERT INTO  `progin_405_13510099`.`tag_tugas1` (`ID_tugas` ,`tag`) VALUES ('"+id+"',  '"+tags[a]+"');";
                    res = MyDatabase.getSingleton().queryDB(tQuery);
                    }
                    if(res!=-1) {
                        tQuery = "INSERT INTO `progin_405_13510099`.`komentar_tugas1` (`ID_tugas`, `username`, `komentar`, `waktu_komentar`) VALUES ('"+id+"', '"+session.getAttribute("sUsername")+"', '"+komentar+"', CURRENT_TIMESTAMP);";
                        res = MyDatabase.getSingleton().queryDB(tQuery);
                        
                    }
                    
                    //response.sendRedirect("dashboard.jsp");
                }
       }
       }
        catch(Exception e)
        {
            e.printStackTrace();
        }
     
%>