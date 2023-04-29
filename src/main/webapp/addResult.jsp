<%@ page import="java.util.Date" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chach
  Date: 4/29/2023
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/ZurasPosts?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" user="root" password="pass"/>

<%
  String title = request.getParameter("title");
  String director = request.getParameter("director");
  String releaseDate = request.getParameter("releaseDate");
  String rating = request.getParameter("rating");
  String description = request.getParameter("description");
%>

<c:set var="title" value="<%=title%>"/>
<c:set var="director" value="<%=director%>"/>
<c:set var="releaseDate" value="<%=releaseDate%>"/>
<c:set var="rating" value="<%=rating%>"/>
<c:set var="description" value="<%=description%>"/>

<sql:update dataSource="${db}" var="table">
  insert into ZurasPosts.Movies( Title, Director, ReleaseDate, Rating, Description) values (?, ?, ?, ?, ?)
  <sql:param value="${title}"/>
  <sql:param value="${director}"/>
  <sql:param value="${releaseDate}"/>
  <sql:param value="${rating}"/>
  <sql:param value="${description}"/>
</sql:update>

<h1>Success</h1>
<a href="./index.jsp">See Movies</a>
</body>
</html>
