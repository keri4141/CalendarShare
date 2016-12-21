<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Properties"%>

<%
String id = request.getParameter("userId");
Connection conn = null;

Properties connectionProps = new Properties();
connectionProps.put("user", "pokemonblastoise");
connectionProps.put("password", "johnspears2012");
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(
			"jdbc:mysql://johnspears.cipoex3flzaz.us-east-1.rds.amazonaws.com:3306/CalendarWeb", connectionProps);
}catch(Exception e){}




Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>user_id</b></td>
<td><b>Password</b></td>
<td><b>Name</b></td>
<td><b>Email</b></td>
</tr>
<%
try{ 

statement=conn.createStatement();
String idUsers=(String)session.getAttribute("idUsers");
String sql ="SELECT id_usershared FROM Shared WHERE id_user="+idUsers;

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr bgcolor="#DEB887">

<td><%=resultSet.getString("id_usershared") %></td>
<td>
<form action="ViewSharedCalendarsDatahold" method="POST">
<button name="id_usershared" value=<%=resultSet.getString("id_usershared") %>>View</button>
</form>
</td>

</tr>

<% 
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

		
		
		
</body>
</html>