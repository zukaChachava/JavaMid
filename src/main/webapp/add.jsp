<%--
  Created by IntelliJ IDEA.
  User: chach
  Date: 4/29/2023
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="addResult.jsp" method="post">
    <input type="text"  name="title" />
    <br/>
    <input type="text"  name="director" />
    <br/>
    <input type="text"  type="date" name="releaseDate" />
    <br/>
    <input type="text" name="rating" />
    <br/>
    <input type="text" name="description" />
    <br/>
    <button type="submit">Add</button>
  </form>
</body>
</html>
