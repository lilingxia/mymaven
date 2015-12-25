<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#467500">

 <%! int count = 0; %>
      <% count++; %>
	<font> 你好，${user.username }，你是是第<%= count %>位访问者；</font> <br>
	<td> 您的访问时间是：${user.time }；</td>
	<br>在您前面的访问者是:
	<table width="90%" border="1" align="center">
<th>姓名</th><th>时间</th>
<c:forEach items="${model}" var="node">  
<tr><td><c:out value="${node.key}"></c:out></td>  
 <td><c:out value="${node.value}"></c:out></td></tr> 
</c:forEach>
</table>
</body>
</html>
