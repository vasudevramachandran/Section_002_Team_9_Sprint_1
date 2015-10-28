    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
        pageEncoding="ISO-8859-1"%>  
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
    <title>FairSplit &reg;</title>  
    </head>  
    <body bgcolor=#eeeeee> 
    <div > 
    <center>
<form action="loginServlet" method="post" target="_blank" onsubmit="setTimeout(function () { window.location.reload(); }, 5000)">  
            <fieldset style="width: 300px;background-color:WHITE;">  
                <legend style="background-color:#9EBA95;float:center;"> Login to FairSplit &reg; </legend>  
                <table>  
                    <tr>
                        <td>Email Address</td>  
                        <td><input type="text" name="email" required="required" autofocus="autofocus"/></td>  
                    </tr>  
                    <tr>  
                        <td>Password</td>  
                        <td><input type="password" name="password" required="required" /></td>  
                    </tr>  
                    <tr>  
                        <td><input type="submit" value="Login" /></td>  
                    </tr>
                </table>
                New User? <a href="register.jsp">Click here!</a>  
            </fieldset>
        </form>
       </center>  
       </div>
    </body>  
    </html>  