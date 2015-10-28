<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%if(session.getAttribute("name")==null)
    	 {
    	   response.setStatus(response.SC_MOVED_TEMPORARILY);
    	   response.setHeader("Location", "index.jsp"); 
    	 }%>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=request.getParameter("fid")%>.FairSplit &reg;</title>
</head>
<body bgcolor="#eeeeee" >
<%String ss =request.getParameter("fid");%>
HI <%=ss %>
<%@include file="home.jsp" %>
</body>
</html>