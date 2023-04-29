<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/ZurasPosts?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" user="root" password="Password123"/>

<sql:query var="resultSet" dataSource="${db}">
    SELECT * FROM ZurasPosts.Movies
</sql:query>

<table  border="2" width="100%">
    <thead>
    <tr>
        <th>Movie ID</th>
        <th>Title</th>
        <th>Director</th>
        <th>Release Date</th>
        <th>Rating</th>
        <th>Description</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${resultSet.rows}" varStatus="loopStatus">
        <c:if test="${loopStatus.index == 0}">
            <tr>
                <td><c:out value="${movie.Id}"/> </td>
                <td><c:out value="${movie.Title}"/> </td>
                <td><c:out value="${movie.Director}"/> </td>
                <td><c:out value="${movie.ReleaseDate}"/> </td>
                <td><c:out value="${movie.Rating}"/> </td>
                <td><c:out value="${movie.Description}"/> </td>
                <td><a href="./update.jsp?id=${movie.id}">Update</a> </td>
                <td><a href="./deleteResult.jsp?id=${movie.id}">Delete</a></td>
            </tr>
        </c:if>
    </c:forEach>
    </tbody>
</table>
<a href="add.jsp">Add</a>
</body>
</html>