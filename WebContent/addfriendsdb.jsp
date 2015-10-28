<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%

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

String s= (String) session.getAttribute("email");
String r =request.getParameter("femail");
if(s.equals(r))
{
	
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	String k="afe";
	response.setHeader("Location", "welcome.jsp?err=k"); 
}


try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();


int o=0;
PreparedStatement st=connection.prepareStatement("select * from Friends where (user1=? and user2=?) or (user1=? and user2=?)");
st.setString(1, s);
st.setString(2, r);
st.setString(3, r);
st.setString(4, s);
ResultSet rs=st.executeQuery();
while(rs.next())
{
	o=o+1;
}
if(o>0)
{
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	String f="afe";
	response.setHeader("Location", "welcome.jsp??err=f"); 	
}
else
{
st=connection.prepareStatement("insert into FriendRequest values(?,?)");
st.setString(1, s);
st.setString(2, r);
st.executeUpdate();
   
}
}
catch (Exception e) {
e.printStackTrace();
}
finally{
	
	    try { if (statement != null) statement.close(); } catch (Exception e) {};
	    try { if (connection != null) connection.close(); } catch (Exception e) {};
}


response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", "welcome.jsp"); 

%>

