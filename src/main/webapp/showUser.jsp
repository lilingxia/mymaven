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
	<font>��ã�${user.username }�������ǵ�<%= count %>λ�����ߣ�<br>
	</td>���ķ���ʱ���ǣ�<td>${user.time }��</td>
	<br>����ǰ��ķ�������:
	<br>����  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ����ʱ��</font><br>
</body>
</html>