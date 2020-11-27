<%-- 
    Document   : myserver
    Created on : Oct 14, 2020, 3:33:11 PM
    Author     : Tarun Sharma
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getParameter("action")!=null){
         String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = request.getParameter("user");
    String PASS = request.getParameter("pass");
    session.setAttribute("user", USER);
    session.setAttribute("pass", PASS);
 
   try{
   Class.forName(JDBC_DRIVER);
    
   Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
   response.sendRedirect("database.jsp");
   }catch(Exception e){
       %>
       <script>
           alert("Wrong Credentials Are Entered");
           </script>
           <%
   }
   
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        body{
           background-image: url("sql1.jpg") ;
           background-attachment: fixed;
           background-size: cover;
           background-size: 100% 100%;
           text-align: center;
        }
       </style> 
       <h1>Get Connected To Your Server</h1>
         <form action="#" class="fieldcss" >
                    <fieldset id="fieldcss" >
                        <legend id="legendcss" >Configure Your Server......</legend>
                          <div class="form-inline" >
                           
                            <i class="fa fa-user"></i>
                            <input type="text" name="user" class="form-control" placeholder="Username" >
                        </div>
                       
                        <br>
                          <div class="form-inline">
                           
                            <i class="fa fa-key"></i>
                            <input type="password" name="pass" class="form-control" placeholder="Password">
                        </div>
                       
                        <br>
                        
                      <button type="action" name="action" id="submit" class="btn-info"   >Configure</button>
                
                           
                    </fieldset>
   
                        
        </form>
        
    </body>
</html>

