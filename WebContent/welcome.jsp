    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
        pageEncoding="ISO-8859-1"%>  
     <%if(session.getAttribute("email")==null)
    	 {
    	   response.setStatus(response.SC_MOVED_TEMPORARILY);
    	   response.setHeader("Location", "index.jsp"); 
    	 }%>   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%String em=(String) session.getAttribute("email");%>
<%String name="";%>

<%
String wdriverName = "com.mysql.jdbc.Driver";
String wconnectionUrl = "jdbc:mysql://localhost:3306/";
String wdbName = "fsdb";
String wuserId = "root";
String wpassword = "root";
try {
Class.forName(wdriverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection wconnection = null;
Statement wstatement = null;

try{ 
wconnection = DriverManager.getConnection(wconnectionUrl+wdbName, wuserId, wpassword);
wstatement=wconnection.createStatement();

PreparedStatement wst=wconnection.prepareStatement("select * from User where email=?");
wst.setString(1,em);
ResultSet wrs=wst.executeQuery();
while(wrs.next())
	name=wrs.getString("name");
wconnection.close();
wstatement=null;
}
catch (Exception e) {
e.printStackTrace();
}
finally{
	
	    try { if (wstatement != null) wstatement.close(); } catch (Exception e) {};
	    try { if (wconnection != null) wconnection.close(); } catch (Exception e) {};
}

%>
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
  <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
  
    <title><%=session.getAttribute("email")%>.FairSplit &reg;</title>  
    </head>  
    <body bgcolor=#eeeeee>  
        <h4>  
            Hello,  
            <%=name%></h4>  


<table align="center" border="1"  bgcolor="#A52A2A">
<td><b>You are owed</b></td>
<td><b>You Owe</b></td>
</tr>
</table>
<%@include file="home.jsp" %>
</body>  
</html> 