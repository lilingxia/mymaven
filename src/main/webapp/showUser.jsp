<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=gb2312"
     pageEncoding="gb2312"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6FA">

 <%! int count = 0; %>
      <% count++; %>
	<font color="green"> ��ã�${user.username }��<font size=4>�����ǵ�<%= count %>λ�����ߣ�</font><font size=3>���ķ���ʱ���ǣ�${user.time }!</font> <br>
	<br><td> ����ǰ��ķ�������:</td></br>
	<table width="60%" border="1" align="left">
<th>������Ϣ</th><th>ʱ����Ϣ</th>
<c:forEach items="${map}" var="node">  
<tr><td><c:out value="${node.key}"></c:out></td>  
 <td><c:out value="${node.value}"></c:out></td></tr> 
</c:forEach>
</table>
</body>
</html>
