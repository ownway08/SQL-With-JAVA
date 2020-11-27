<%-- 
    Document   : table
    Created on : Oct 16, 2020, 6:58:48 PM
    Author     : Tarun Sharma
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/style.css" rel="stylesheet" type="text/css"/>
        <title>tables</title>
    </head>
    <style>
        body{
           background: url("pix3.jpeg");
           background-attachment: fixed;
           background-size: 100% 100%;
          
        }
        </style>
        <h1 class="th"> Let's PLay WIth TAbles </h1>
         <div class="msubmit">
             <form action="#" class="formcss">
             <button type="action" name="shtb" id="msubmit"   >Show Tables</button>
             <button type="action" name="cdb" id="msubmit"   ><a href="database.jsp"> Change Database </a></button>
              <button type="action" name="mod" id="msubmit" class="btn-info" ><a href="modify.jsp" >Modify Table</a></button>
             </form>
             </div>
          <form action="#" class="tcss" >
                <fieldset id="formcss" >
                        
                       
                           <legend id="legendcss" >Wants To Create a Table !</legend>
                       
                        <div class="datacss">
                             <label>Enter Table Name : </label>
                             <input type="text"  class="datacss" name="tblname" placeholder="Please Enter Table Name"><br>
                            <label> Enter No of Columns  :</label>
                            <input type="text"  name="noclmns"  placeholder="Enter No Of Columns">
                            </div>
                           <div>
                           <button type="action" name="crt" id="submit" class="btn-info" >Create Table</button>
                          
                           </div> </fieldset>
                <%  
if(request.getParameter("crt")!=null){
    String  n = request.getParameter("noclmns");
    String tbl = request.getParameter("tblname");
    session.setAttribute("tname",tbl);
    session.setAttribute("nocl", n);
    response.sendRedirect("createtable.jsp");
}
                    
                    %>
     </form>
        <table class="table table-responsive  table-bordered" id="tbl-val" cellpadding="0" align="right">
           <title>Tables</title>
           <tr>
               <th> S.no</th>
               <th>Tables_in_Database</th>
           </tr>
           <%
               if(request.getParameter("shtb")!=null){
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
  String sql = "show tables ";
  ResultSet rs = st.executeQuery(sql);
 int count=0;
 
  while(rs.next()){
      count++;
      
  
               
           %>
           <tr>
               <td><%= count %></td>
               <td><%= rs.getString(1)  %></td>
           </tr>
           <%
               
               }

}catch(Exception e){
  System.out.println(e.getMessage());
                                   %>
                                   <script>
                                       
            alert("Sorry this Command cannot Performed");
                                       </script>
                                   <%
}
          }
               %>
       </table>
       
        
    </body>
</html>
