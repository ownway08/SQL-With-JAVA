<%-- 
    Document   : createtable
    Created on : Oct 19, 2020, 2:57:28 PM
    Author     : Tarun Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Create Table</title>
    </head>
    <style>
        body{
            background: url("pix4.jpeg");
            background-attachment: fixed;
            background-size: 100% 100%;
            text-align: center;
        } 
        
        </style>
        <h1> JUst AWay FRom CReating A TAble</h1>
        <table class="table table-responsive table-bordered"  id="tbl-create">
            <form action="#" class="mycss">
                <tr>
                    <td> <legend class="ldcss">Fill it Carefully</legend></td>
</tr>
              <tr>
                <th>Field</th>
                <th>Type</th>
               <th>Size</th>
                 <th>Key</th>
            </tr>
         
                <% 
                    
                 
                    if(!session.getAttribute("tname").toString().equals("")){
    String s = session.getAttribute("nocl").toString();
     int cl = Integer.parseInt(s);

         for(int i=1;i<=cl;i++){
             %>
             <tr>
                 <td><input type="text"  name=<%= "fld"+i  %>></td>
                 <td><input type="text"  name=<%= "typ"+i  %>></td>
                 <td><input type="text"  name=<%= "sz"+i  %>></td>
                <td><input type="text"  name=<%= "ky"+i  %>></td>
            </tr>
             
             <%
               
                  } 
}
                        %>
                        <tr>
                            <td>   <button type="action" name="create" id="msubmit" class="btn-info" >Create Table</button></td>
                            <td> <button type="action" name="bck" id="msubmit" class="btn-info"   ><a href="table.jsp">Back </a></button></td>
                        </tr> 
            </form>
       </table> 
                             
      
                        <%
                      
                            if(request.getParameter("create")!=null){
                                 String s = session.getAttribute("nocl").toString();
                         int cl = Integer.parseInt(s);
                                String tname =  session.getAttribute("tname").toString();
                                
                                String query = "create table " + tname+"( " ;
                               for(int i=1;i<=cl;i++){
                                   String fld = request.getParameter("fld"+i);
                                 String typ = request.getParameter("typ"+i);
                                   String sz = request.getParameter("sz"+i);
                                   String ky = request.getParameter("ky"+i);
                                   if(i!=cl){
                                       query = query + fld +" "+ typ +"( "+sz+" )"+" "+ky+" ,";
                                   }else{
                                       query = query + fld +" "+ typ +"( "+sz+" )"+" "+ky+" )";
                                   }
                               }
                              
                               try{
                                       String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
                    String dname = session.getAttribute("dbname").toString();
 String DB_URL = "jdbc:mysql://localhost/" + dname;

   //  Database credentials
   String USER = session.getAttribute("user").toString();
    String PASS = session.getAttribute("pass").toString();
 
  
   Class.forName(JDBC_DRIVER);
  Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
  Statement st = con.createStatement();
  System.out.println(query);
  st.execute(query);
                               }catch(Exception e){
                                   String mess= e.getMessage();
                                   System.out.println(mess);
                                   %>
                                   <script>
                                       
            alert("Sorry Your Table is not Created Please Check Your Credentials");
                                       </script>
                                   <%
                               }
                            }
                            
                            %>



</body>
</html>
