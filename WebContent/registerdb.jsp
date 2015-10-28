<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.Connection"%>
  
  
  
 <%
String driverNamead = "com.mysql.jdbc.Driver";
String connectionUrlad = "jdbc:mysql://localhost:3306/";
String dbNamead = "fsdb";
String userIdad = "root";
String passwordad = "root";
try {
Class.forName(driverNamead);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

String em=request.getParameter("email"); 
String pas=request.getParameter("password"); 
String nm=request.getParameter("name"); 
int fl=0;
for(int i=0;i<em.length();i++)
{
	if(em.charAt(i)=='@')
	{
		fl=1;
	}
	else if(em.charAt(i)=='.'&&fl==1)
	{
		fl=2;
		break;
	}
}

if(fl!=2)
{
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "email_error.html");  	
}

Connection connectionad = null;
Statement statementad = null;
PreparedStatement stad = null;
try{ 
connectionad = DriverManager.getConnection(connectionUrlad+dbNamead, userIdad, passwordad);
stad=connectionad.prepareStatement("select * from User where email=?");
stad.setString(1,em);
ResultSet rsad=stad.executeQuery();
int o=0;
while(rsad.next()){
	o=o+1;
}
if(o!=0)
{
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", "email_error.html");  
}
else
{
stad=connectionad.prepareStatement("insert into User values(?,?,?)");
stad.setString(1, em);
stad.setString(2, pas);
stad.setString(2, nm);
stad.executeUpdate();
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", "index.jsp");
}
}
catch (Exception e) {
e.printStackTrace();
}
finally {
    stad.close();
    connectionad.close();
  }
%>

<body>
</body>
</html>