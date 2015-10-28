<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%if(session.getAttribute("email")==null)
    	 {
    	   response.setStatus(response.SC_MOVED_TEMPORARILY);
    	   response.setHeader("Location", "index.jsp"); 
    	 }%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Friend.FairSplit &reg;</title>
</head>
<body bgcolor=#eeeeee>
<center>
<form action="addfriendsdb.jsp" method="post" >
 <fieldset style="width: 300px;background-color:WHITE;">  
<legend style="background-color:#9EBA95;float:center;"> Invite a Friend to FairSplit &reg; </legend>  
<table>  
                    <tr>  
                        <td>Friend's Email Address</td>  
                        <td><input type="text" name="femail" required="required" autofocus="autofocus"/></td>  
                    </tr>  
                    <tr>  
                    <tr>  
                        <td><input type="submit" value="Invite"/></td>  
                    </tr>  
                </table>
</fieldset>
</form>
</center>
<%@include file="home.jsp" %>
</body>
</html>