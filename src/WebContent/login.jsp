<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
LOGIN
<br><br>
${msg}
<br><br>
<form action='LoginServlet' method='post'>
<table align="center">

<tr>
<td>Username</td>
<td><input type='text' name='username'/></td>
</tr>

<tr>
<td>Password</td>
<td><input type='text' name='password'/></td>
</tr>

<tr>
<td></td>
<td><input type='submit' value='LOGIN'/></td>
</tr>


</table>


</form>
</body>
</html>