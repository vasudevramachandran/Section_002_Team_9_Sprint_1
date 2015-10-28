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
String des=request.getParameter("description");
String ba=request.getParameter("billamount");
int k=Integer.parseInt((String)session.getAttribute("size"));
int i=0;
String[] fid=new String[100];
while(i<k)
{
	fid[i]=request.getParameter("fid"+Integer.toString(i));
	i++;
}



try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

out.write(fid[2]);
for(i=0;i<k;i++)
{
	PreparedStatement st=connection.prepareStatement("insert into Recentactivity values(?,?,?,?)");
	st.setString(1, s);
	st.setString(2, fid[i]);
	st.setString(3, des);
	st.setInt(4,Integer.parseInt(ba));
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

