    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
        pageEncoding="ISO-8859-1"%>  
     <%if(session.getAttribute("name")==null)
    	 {
    	   response.setStatus(response.SC_MOVED_TEMPORARILY);
    	   response.setHeader("Location", "index.jsp"); 
    	 }%>   
        
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
  <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
  
    <title>Welcome <%=session.getAttribute("name")%></title>  
    </head>  
    <body>  
     <a href="logout.jsp" style="float:right;">Log Out</a>        
        <h4>  
            Hello,  
            <%=session.getAttribute("name")%></h4>  


<table align="center" border="1"  bgcolor="#A52A2A">
<td><b>You are owed</b></td>
<td><b>You Owe</b></td>
</tr>
</table>

  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.Connection"%>
  
  
  
 <%
 String s= (String) session.getAttribute("name");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "fsdb";
String userId = "root";
String password = "root";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;

%>
  <div id='cssmenu'>
<ul>
   <li><a href='welcome.jsp'><span>Home</span></a></li>
   <li class='active has-sub'><a href='#'><span>Recent Activity</span></a>
   <li class='active has-sub'><a href='#'><span>Add a bill</span></a>  
   <li class='active has-sub'><a href='#'><span>Friends</span></a>
   <ul>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
PreparedStatement st=connection.prepareStatement("select * from Friends where user1=? or user2=?");
st.setString(1, s);
st.setString(2, s);
ResultSet rs=st.executeQuery();
while(rs.next()){
	String x1=rs.getString("user1");
	String x2=rs.getString("user2");
	String x="";
	if(x1.equals(s))
		x=x2;
	else if(x2.equals(s))
		x=x1;

%>
         <li class='has-sub'><a href='#'><span><%=x %></span></a></li>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</ul>
</li>
</ul>
</body>  
</html> 