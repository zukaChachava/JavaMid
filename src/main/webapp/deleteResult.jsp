<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chach
  Date: 4/29/2023
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/ZurasPosts?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" user="root" password="Password123"/>

<%
  String id = request.getParameter("id");
%>

<c:set var="id" value="<%=id%>"/>

<sql:update var="affectedRows" dataSource="${db}">
  delete from ZurasPosts.Movies where Id = ?
  <sql:param value="${id}"/>
</sql:update>

<h1>Success</h1>
<a href="./index.jsp">See Movies</a>
</body>
</html>
