<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chach
  Date: 4/29/2023
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  String id = request.getParameter("id");
%>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/ZurasPosts?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" user="root" password="pass"/>

<c:set var="id" value="<%=id%>"/>

<sql:query var="resultSet" dataSource="${db}">
  SELECT * FROM ZurasPosts.Movies where Id = ?
  <sql:param value="${id}"/>
</sql:query>

<c:forEach var="movie" items="${resultSet.rows}" varStatus="loopStatus">
  <c:if test="${loopStatus.index == 0}">
    <form action="./updateResult.jsp?id=${id}" method="post">
      <input type="text"  name="title" value="<c:out value="${movie.title}" />" />
      <br/>
      <input type="text"  name="director" value="<c:out value="${movie.director}" />" />
      <br/>
      <input type="text"  type="date" name="releaseDate" value="<c:out value="${movie.date}" />" />
      <br/>
      <input type="text" name="rating" value="<c:out value="${movie.rating}" />" />
      <br/>
      <input type="text" name="description" value="<c:out value="${movie.description}" />"/>
      <br/>
      <button type="submit">Update</button>
    </form>
  </c:if>
</c:forEach>


</body>
</html>
