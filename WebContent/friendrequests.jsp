<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%
String s= (String) session.getAttribute("email");
String r =request.getParameter("fid2");

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

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

PreparedStatement st=connection.prepareStatement("insert into Friends values(?,?)");
st.setString(1, s);
st.setString(2, r);
st.executeUpdate();
st=connection.prepareStatement("delete from FriendRequest where requester=? and requested=?");
st.setString(1, r);
st.setString(2, s);
st.executeUpdate();
   

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




