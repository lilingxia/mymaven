<%@ page language="java" contentType="text/html; charset=GB18030"
     pageEncoding="GB18030"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
 <%! int count = 0; %>
      <% count++; %>
	<font>你好，${user.username }，您是是第<%= count %>位访问者；<br>
	</td>您的访问时间是：<td>${user.time }；</td>
	<br>在您前面的访问者是:
	<br>姓名  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  访问时间</font><br>
</body>
</html>
