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
<%
 String sab= (String) session.getAttribute("email");
String driverNameab = "com.mysql.jdbc.Driver";
String connectionUrlab = "jdbc:mysql://localhost:3306/";
String dbNameab = "fsdb";
String userIdab = "root";
String passwordab = "root";
try {
Class.forName(driverNameab);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<%Connection connectionab = null;
Statement statementab = null;
String []fr=new String[100];
int k=0;
try{ 
connectionab = DriverManager.getConnection(connectionUrlab+dbNameab, userIdab, passwordab);
statementab=connectionab.createStatement();
PreparedStatement stab=connectionab.prepareStatement("select * from Friends where user1=? or user2=?");
stab.setString(1, sab);
stab.setString(2, sab);
ResultSet rsab=stab.executeQuery();
while(rsab.next()){
	String x1=rsab.getString("user1");
	String x2=rsab.getString("user2");
	if(x1.equals(sab))
		fr[k]=x2;
	else if(x2.equals(sab))
		fr[k]=x1;
	PreparedStatement stab1=connectionab.prepareStatement("select * from User where email=?");
	stab1.setString(1, fr[k]);
	ResultSet rsab1=stab1.executeQuery();
	while(rsab1.next())
		fr[k++]=rsab1.getString("name");

}
if(session!=null)  
    session.setAttribute("size", Integer.toString(k));  

}
catch (Exception e) {
e.printStackTrace();
}
%>
 
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a bill.FairSplit &reg;</title>
<link href="styles.css" rel="stylesheet">
   <script src="script.js"></script>  

</head>
<body>
    <body bgcolor=#eeeeee> 
    <div > 
    <center>
<form action="addbilldb.jsp" method="post" >  
            <fieldset style="width: 300px;background-color:WHITE;">  
                <legend style="background-color:#9EBA95;float:center;"> Add a Bill to FairSplit &reg; </legend>  
                <table>  
                    <tr>
                        <td>Bill Description</td>  
                        <td><input type="text" name="description" required="required" autofocus="autofocus"/></td>  
                    </tr>  
                    <tr>  
                        <td>Bill Amount</td>  
                        <td><input type="text" name="billamount" required="required" /></td>  
                    </tr>  
<tr>
<td>Select Friends</td>
<td>
<select multiple style="height:60px; overflow: auto;">
<%
int i=0;
while(i<k)
{
out.write("<option name='fid"+Integer.toString(i)+"' value='fid"+Integer.toString(i)+"'>"+fr[i]+"</option>");
i++;
}
%>
</select>
</td>
</tr>
                    <tr>  
                        <td>Split by</td>  
					<td>	<input type="radio" name="splitby" value="equally">Equally<br>
							<input type="radio" name="splitby" value="percentage">Percentage<br>
							 <input type="radio" name="splitby" value="exact">Exactly</td>
                    </tr>  
                    <tr>  
                        <td><input type="submit" value="Add bill" /></td>  
                    </tr>  
                </table>
            </fieldset>
        </form>
       </center>  
       </div>
    </body>  
<%@include file="home.jsp" %>
</body>
</html>