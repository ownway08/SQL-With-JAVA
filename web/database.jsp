<%-- 
    Document   : database
    Created on : Oct 14, 2020, 4:51:06 PM
    Author     : Tarun Sharma
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getParameter("action")!=null){
    try{

         String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = session.getAttribute("user").toString();
    String PASS = session.getAttribute("pass").toString();
 
  
   Class.forName(JDBC_DRIVER);
    
   Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
   
    String dname = request.getParameter("dname");
    Statement stmt = con.createStatement();
    String quer="";
    String req= request.getParameter("opt");
    System.out.println(dname);
    if(req==null||dname.equals("")){
         %>
        <script>
            alert("Please Select a Correct choice Or Enter a Correct Database name");
            </script>
            <%
    }else{
    if(req.equals("use")){
        quer = "use "+ dname;
      session.setAttribute("dbname", dname);
        response.sendRedirect("table.jsp");
       
    }else if(req.equals("create")){
        quer = "create database " + dname;
        
    }else if(req.equals("drop")){
        quer = "drop database " + dname;
    }
   
    stmt.execute(quer);
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        body{
           background-image: url("pix5.jpeg") ;
           background-attachment: fixed;
           background-size: cover;
          background-size: 100% 100%;
         text-align: center;
        }
       </style> 
       <h1>Get Connected To Your Database</h1>
         <form action="#" class="formcss" >
                    <fieldset id="formcss" >
                           <legend id="legendcss" >Choose The Operation</legend>
                        <div class="radiocss">
                 <input type="radio" id ="us" name="opt" value="use" class="radiocss"> 
                 <label for="us"> Use </label>
                        </div>
                         <div class="radiocss">
                <input type="radio" id ="cr" name="opt" value="create" class="radiocss"> 
                <label for="cr"> Create</label>
                         </div>
                         <div class="radiocss">
                 <input type="radio" id ="dr" name="opt" value="drop" class="radiocss"> 
                 <label for="dr"> Drop</label>
            </div>
                        <div class="datacss">
                            <label> NAme OF DAtaBAse :</label>
                            <input type="text"  name="dname"  placeholder="Enter Your Database Name">
                            </div>
                           <button type="action" name="action" id="msubmit" class="btn-info"   >Execute</button>
                            <button type="action" name="showof" id="msubmit" class="btn-info"   >Show</button>
              </fieldset>
     </form>
      
       <table class="table table-responsive  table-bordered" id="tbl-data" cellpadding="0" align="right">
           <title>Databases</title>
           <tr1>
               <th> S.no</th>
               <th> Databases</th>
           </tr>
           <%
               if(request.getParameter("showof")!=null){
                   try{
                    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   String USER = session.getAttribute("user").toString();
    String PASS = session.getAttribute("pass").toString();
 
  
   Class.forName(JDBC_DRIVER);
  Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
  Statement st = con.createStatement();
  String sql = "show databases ";
  ResultSet rs = st.executeQuery(sql);
 int count=0;
  while(rs.next()){
      count++;
      
  
               
           %>
           <tr>
               <td><%= count %></td>
               <td><%= rs.getString("Database")  %></td>
           </tr>
           <%
               
               }

}catch(Exception e){
  System.out.println(e.getMessage());
                                   %>
                                   <script>
                                       
            alert("Sorry Please Choose a correct Operations");
                                       </script>
                                   <%
}
          }
               %>
       </table>
       
    </body>
</html>