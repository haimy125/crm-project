<%--
  Created by IntelliJ IDEA.
  User: conch
  Date: 23 Jul 2024
  Time: 00:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>LOGIN</h1>
<form action="http://localhost:8080/crm/login" method="post">
    <input type = "text" name = "username" placeholder="username" />
    <input type = "password" name = "password" placeholder="password" />
    <button>SUBMIT</button>
</form>
</body>
</html>
