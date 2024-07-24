<%--
  Created by IntelliJ IDEA.
  User: conch
  Date: 23 Jul 2024
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>Role Add</title>
    <link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel = "stylesheet"
          integrity = "sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin = "anonymous">
</head>
<body>
<h1>ROLE ADD</h1>
<div class = "contaier">
    <form>
        <div class = "mb-3">
            <label for = "role_name"
                   class = "form-label">Role Name</label>
            <input type = "text"
                   name = "name"
                   class = "form-control"
                   id = "role_name">
        </div>
        <div class = "mb-3">
            <label for = "description"
                   class = "form-label">Description</label>
            <input type = "text"
                   name = "description"
                   class = "form-control"
                   id = "description">
        </div>
        <button id = "btn-add-role" type = "submit" class = "btn btn-primary">Submit</button>
    </form>
</div>
<script src = "https://code.jquery.com/jquery-3.7.1.js"
        integrity = "sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin = "anonymous"></script>
<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity = "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin = "anonymous"></script>
<script src = "../js/roles.js"></script>
</body>
</html>
