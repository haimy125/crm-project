<%@ page import = "java.util.List" %>
<%@ page import = "crm.model.Roles" %><%--
  Created by IntelliJ IDEA.
  User: conch
  Date: 23 Jul 2024
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored = "false" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>Role Manager</title>
    <link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel = "stylesheet"
          integrity = "sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin = "anonymous">
    <style>
		label.error {
            color: red;
        }
	    </style>
</head>
<body>
<div class = "container">
    <h1>ADMIN DASHBOARD</h1>
    <div class = "d-flex align-items-start">
        <div class = "nav flex-column nav-pills me-3" id = "v-pills-tab"
             role = "tablist" aria-orientation = "vertical">
            <button class = "nav-link active" id = "v-pills-home-tab"
                    data-bs-toggle = "pill" data-bs-target = "#v-pills-home"
                    type = "button" role = "tab" aria-controls = "v-pills-home"
                    aria-selected = "true">Role
            </button>
            <button class = "nav-link" id = "v-pills-profile-tab"
                    data-bs-toggle = "pill" data-bs-target = "#v-pills-profile"
                    type = "button" role = "tab"
                    aria-controls = "v-pills-profile" aria-selected = "false">
                Profile
            </button>
            <button class = "nav-link" id = "v-pills-disabled-tab"
                    data-bs-toggle = "pill" data-bs-target = "#v-pills-disabled"
                    type = "button" role = "tab"
                    aria-controls = "v-pills-disabled" aria-selected = "false"
                    disabled>Disabled
            </button>
            <button class = "nav-link" id = "v-pills-messages-tab"
                    data-bs-toggle = "pill" data-bs-target = "#v-pills-messages"
                    type = "button" role = "tab"
                    aria-controls = "v-pills-messages" aria-selected = "false">
                Messages
            </button>
            <button class = "nav-link" id = "v-pills-settings-tab"
                    data-bs-toggle = "pill" data-bs-target = "#v-pills-settings"
                    type = "button" role = "tab"
                    aria-controls = "v-pills-settings" aria-selected = "false">
                Settings
            </button>
        </div>
        <div class = "tab-content" id = "v-pills-tabContent">
            <div class = "tab-pane fade show active"
                 id = "v-pills-home"
                 role = "tabpanel"
                 aria-labelledby = "v-pills-home-tab"
                 tabindex = "0">
                <div>
                    <form id = "myForm">
                        <div class = "mb-3">
                            <label for = "id"
                                   class = "form-label">ID</label>
                            <input type = "text"
                                   disabled
                                   name = "id"
                                   class = "form-control"
                                   id = "id">
                        </div>
                        <div class = "mb-3">
                            <label for = "name"
                                   class = "form-label">Role Name</label>
                            <input type = "text"
                                   required
                                   name = "name"
                                   class = "form-control"
                                   id = "name">
                            <span id = "name_role"></span>
                        </div>
                        <div class = "mb-3">
                            <label for = "description"
                                   class = "form-label">Description</label>
                            <input type = "text"
                                   name = "description"
                                   class = "form-control"
                                   id = "description">
                        </div>
                        <button id = "btn-add-role"
                                type = "submit"
                                class = "btn btn-primary">Insert</button>
                        <button id = "btn-update-role"
                                type = "submit"
                                class = "btn btn-primary">Update</button>
                        <button id = "btn-reset-form"
                                type = "submit"
                                class = "btn btn-primary">Reset</button>
                    </form>
                </div>
                <table class = "table">
                    <thead>
                    <tr>
                        <th scope = "col">#</th>
                        <th scope = "col">Name</th>
                        <th scope = "col">Description</th>
                        <th scope = "col">Actions</th>
                    </tr>
                    </thead>
                    <tbody id = "roles-table-body">
<%--                        <c:forEach items = "${roles}"--%>
<%--                                   var = "role"--%>
<%--                                   varStatus = "loop">--%>
<%--                            <tr class = "rowtr">--%>
<%--                                <th scope = "row">${loop.index+1}--%>
<%--                                </th>--%>
<%--                                <td id = "role-name">${role.getRoleName()}--%>
<%--                                </td>--%>
<%--                                <td id = "role-description">${role.getDescription()}--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <div class = "tdClass"--%>
<%--                                         style = "display: flex; justify-content: space-between;">--%>
<%--                                        <a class = "icon-link btn-edit"--%>
<%--                                           href = "#!"--%>
<%--                                           id-role = "${role.getId()}"--%>
<%--                                           name-role = "${role.getRoleName()}"--%>
<%--                                           description-role = "${role.getDescription()}"--%>
<%--                                        >--%>
<%--                                        <svg xmlns = "http://www.w3.org/2000/svg"--%>
<%--                                             width = "32"--%>
<%--                                             height = "32"--%>
<%--                                             fill = "green"--%>
<%--                                             class = "bi bi-pencil-square"--%>
<%--                                             viewBox = "0 0 16 16">--%>
<%--                                            <path d = "M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />--%>
<%--                                            <path fill-rule = "evenodd"--%>
<%--                                                  d = "M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />--%>
<%--                                        </svg>--%>
<%--                                    </a>--%>
<%--                                    <a class = "icon-link btn-delete"--%>
<%--                                       href = "#!"--%>
<%--                                       id-role = "${role.getId()}" />--%>
<%--                                               <svg xmlns = "http://www.w3.org/2000/svg"--%>
<%--                                                    width = "32"--%>
<%--                                                    height = "32"--%>
<%--                                                    fill = "red"--%>
<%--                                                    class = "bi bi-trash3-fill"--%>
<%--                                                    viewBox = "0 0 16 16">--%>
<%--                                            <path d = "M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />--%>
<%--                                        </svg>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
                    </tbody>
                </table>
            </div>
            <div class = "tab-pane fade" id = "v-pills-profile"
                 role = "tabpanel" aria-labelledby = "v-pills-profile-tab"
                 tabindex = "0">...
            </div>
            <div class = "tab-pane fade" id = "v-pills-disabled"
                 role = "tabpanel" aria-labelledby = "v-pills-disabled-tab"
                 tabindex = "0">...
            </div>
            <div class = "tab-pane fade" id = "v-pills-messages"
                 role = "tabpanel" aria-labelledby = "v-pills-messages-tab"
                 tabindex = "0">...
            </div>
            <div class = "tab-pane fade" id = "v-pills-settings"
                 role = "tabpanel" aria-labelledby = "v-pills-settings-tab"
                 tabindex = "0">...
            </div>
        </div>
    </div>
</div>
<script src = "https://code.jquery.com/jquery-3.7.1.js"
        integrity = "sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin = "anonymous"></script>
<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity = "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin = "anonymous"></script>
<script src = "http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
        type = "text/javascript"></script>
<script src = "js/roles.js"></script>
</body>
</html>
