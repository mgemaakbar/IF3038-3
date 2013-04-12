<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>
 <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   
<% 
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String namaLengkap=request.getParameter("namaLengkap");
    String email=request.getParameter("email");
    String birth=request.getParameter("birth");

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
                    if(fieldname.equals("username")) {
                        username=fieldvalue;
                    }
                    if(fieldname.equals("password")) {
                        password=fieldvalue;
                    }
                    if(fieldname.equals("namaLengkap")) {
                        namaLengkap=fieldvalue;
                    }
                    if(fieldname.equals("email")) {
                        email=fieldvalue;
                    }
                    if(fieldname.equals("birth")) {
                        birth=fieldvalue;
                    }
                    
               } else {
                       try {
                                String itemName = item.getName();
                                session.setAttribute("sUsername",username);
                                session.setAttribute("sAvatar",itemName);
                                session.setAttribute("sFullName",namaLengkap);
                                String tQuery = "INSERT INTO  `progin_405_13510099`.`user1` (`username` ,`avatar` ,`email` ,`tanggal_lahir` ,`nama_lengkap` ,`password`) VALUES ( "
                                                +" '"+username+"',  '"+itemName+"',  '"+email+"',  '"+birth+"',  '"+namaLengkap+"',  '"+password+"' );";
                               
                                File savedFile = new File(config.getServletContext().getRealPath("/")+"avatar/"+itemName);
                                item.write(savedFile);  
                                out.println(tQuery);
                                int res = MyDatabase.getSingleton().queryDB(tQuery);
                                if(res!=-1) {
                                     response.sendRedirect("mainpage.jsp?");
                                } else {
                                    response.sendRedirect("index.jsp?error=Register Error");
                                }
                       } catch (Exception e) {
                               e.printStackTrace();
                       }
               }
               }
       }
     
%>