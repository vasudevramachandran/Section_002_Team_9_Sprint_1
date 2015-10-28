  <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>  
 <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.Statement"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.Connection"%>
  
  <script type="text/javascript">
  function addfriends()
  {
	  while(1)
	  {
		  var em=prompt("Please enter the email address of your friend as we can invite him/her on your behalf!","xyz@example.com");
		  var i=0,fl=0;
		  for(i=0;i<em.length;i=i+1)
		  {
			  if(em[i]=='@'&&fl==0)
			  {
					fl=1;  	
			  }
			  else if(em[i]=='.'&&fl==1)
			  {
				  alert("Invitation successfully sent to : "+em);
				  fl=2;
				  break;
			  }
	      }
		  if(fl==2)
			  	break;
		  else
			  alert("Please enter valid email address of your friend!");
			
      } 
	  
  }
  
  </script>
  
 <%
 String s= (String) session.getAttribute("email");
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
%>
<%Connection connection = null;
Statement statement = null;
%>
  <div id='cssmenu'>
<ul>
   <li><a href='welcome.jsp'><span>Home</span></a></li>
   <li class='active has-sub'><a href='#'><span>Recent Activity</span></a>
   <li class='active has-sub'><a href='addbill.jsp'><span>Add a bill</span></a>  
   <li class='active has-sub'><a href='addbill.jsp'><span>Delete a bill</span></a>  
   <li class='active has-sub'><a href='groups.jsp'><span>Groups</span></a>  
   <li class='has-sub'><a href="addfriends.jsp"><span>+ Add Friend</span></a>
   <li class='active has-sub'><a href='#'><span>Friends</span></a>
   <ul style="height: 150px; overflow: auto;">

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
	PreparedStatement st1=connection.prepareStatement("select * from User where email=?");
	st1.setString(1, x);
	ResultSet rs1=st1.executeQuery();
	while(rs1.next())
		x=rs1.getString("name");
	%>
         <li class='has-sub'><a href=<%= "\"friends.jsp?fid=" + x + "\"" %>><span><%=x %></span></a></li>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</ul>
</li>
   <li class='active has-sub'><a href='#'><span>Friend Requests</span></a>
<ul>

<%
String x="";
String x1="";
try{
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
PreparedStatement st=connection.prepareStatement("select * from FriendRequest where requested=?");
st.setString(1, s);
ResultSet rs2=st.executeQuery();
while(rs2.next()){
	x=rs2.getString("requester");
	PreparedStatement st1=connection.prepareStatement("select * from User where email=?");
	st1.setString(1, x);
	ResultSet rs1=st1.executeQuery();
	while(rs1.next())
		x1=rs1.getString("name");
	%>
         <li class='has-sub'><a href=<%= "\"friendrequests.jsp?fid2=" + x + "\"" %>><span><%=x1 %></span></a></li>

<% 

}
} 
catch (Exception e) {
e.printStackTrace();
}

%>

</ul>
</li>
   <li class='active has-sub'><a href='logout.jsp'><span>Log Out</span></a></li>

</ul>