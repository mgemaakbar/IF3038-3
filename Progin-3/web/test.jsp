<%-- 
    Document   : test
    Created on : 12 Apr 13, 9:03:31
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd"> 
        <h2>Data from the table 'student' of database 'mydb'</h2> 

        <%
        /* in place of table name(student) and database name(mydb), you should give ur current/ requried table name and database name.*/        
        try 
        {
        /* Create string of connection url within specified format with machinename, port number and database name. Here machine name id localhost and database name is mydb. */ 
        String connectionURL = "jdbc:mysql://loaclhost:8080/progin_405_13510099"; 
        // declare a connection by using Connection interface 
        Connection connection = null; 
        /* declare object of Statement interface that is used for executing sql statements. */ 
        Statement statement = null; 
        // declare a resultset that uses as a table for output data from tha table. 
        ResultSet rs = null; 
        // Load JDBC driver "com.mysql.jdbc.Driver" 
        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database.*/ 
        connection = DriverManager.getConnection(connectionURL, "root", ""); 
        /* createStatement() is used for create statement object that is used for sending sql statements to the specified database. */ 
        statement = connection.createStatement(); 
        // sql query to retrieve values from the specified table. 
        String QueryString = "SELECT * from user1"; 
        rs = statement.executeQuery(QueryString); 
        %> 
        <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;"> 
            <% 
            while (rs.next()) 
            { 
            %> 
            <TR> 
                <TD><%=rs.getString(1)%></TD> 
                <TD><%=rs.getString(2)%></TD> 
                <TD><%=rs.getString(3)%></TD> 
                <TD><%=rs.getString(4)%></TD> 
            </TR> 
            <% 
            } 
            %> 

            <% 
            // close all the connections.
            rs.close(); 
            statement.close(); 
            connection.close(); 
        } 
            catch (Exception ex) 
            { 
            %> 
            <font size="2" color="red"></b> 
            <% 
                 out.println("Unable to connect to database."); 
            } 
            %> 
            </font> 
        </TABLE> 
        <TABLE> 
        <TR> 
            <TD> 
            <FORM ACTION="welcome_to_database_query.jsp" method="get"/> 
                <button type="submit"><-- back</button> 
            </TD> 
            </TR> 
        </TABLE> 
    </body>
</html>
