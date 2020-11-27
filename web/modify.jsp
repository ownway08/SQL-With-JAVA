<%-- 
    Document   : modify
    Created on : Oct 20, 2020, 11:47:34 AM
    Author     : Tarun Sharma
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/style.css" rel="stylesheet" type="text/css"/>
        <title>Modify it</title>
        
    </head>
   <style>
        body{
            background: url("pix8.jpeg");
            background-attachment: fixed;
            background-size: 100% 100%;
            text-align: center;
        } 
        
        </style>
        <h1>Manipulate Your Tables and Data!</h1>
           <form action="#" class="formcss" >
                    <fieldset id="formcss" >
                        
                       
                           <legend id="legendcss" >Play With Table Structure</legend>
                       
                        <div class="datacss">
                            <label> Query Please :</label><br>
                            <input type="text"  name="mquery"  placeholder="Enter Your Query" class="datacss">
                            </div>
                           <button type="action" name="mquer" id="msubmit" class="btn-info"   >Execute</button>
                           <button type="action" name="bck" id="msubmit" class="btn-info"   ><a href="table.jsp">Back </a></button>
              </fieldset>
     </form>
           <%
   if(request.getParameter("mquer")!=null){
       String quer = request.getParameter("mquery");
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
       st.execute(quer);
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
                <form action="#" class="tcss" >
                    <fieldset id="formcss" >
                        
                       
                           <legend id="legendcss" >Play With Table Data !</legend>
                       
                        <div class="datacss">
                            <label> Query Please :</label>
                            <input type="text"  name="quer"  placeholder="Enter Your Query">
                            </div>
                           <button type="action" name="actquer" id="submit" class="btn-info"   >Execute</button>
                           
              </fieldset>
     </form>
             <table class="table table-responsive  table-bordered" id="tbl-quer" cellpadding="0" align="right">
           <title>Tables</title>
          
           <%
               if(request.getParameter("actquer")!=null){
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
  String sql = request.getParameter("quer");
  
  ResultSet rs = st.executeQuery(sql);
  ResultSetMetaData rsmd = rs.getMetaData();
//getting the column type
int column_count = rsmd.getColumnCount();

    %>
      <tr>
          <%
              for(int i=1;i<=column_count;i++){
              %>
          <th><%= rsmd.getColumnName(i)  %></th>
          <%
             }
              %>
           </tr>
    
    <%


 while(rs.next()){
   
        %>
           <tr>
               <%
                 for(int i=1;i<=column_count;i++){
                     %>
                     <td><%=  rs.getString(i)    %></td>
                     <%
                 }  
                   
                  %>
              
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
