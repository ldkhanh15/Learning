<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: MY DREAMS
  Date: 01/03/2024
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 100%;

            thead {
                background: #2ecc71;
                text-align: center;
                font-size: 1.3rem;
                color: #fff;
                font-weight: 700;
            }

            td, tr {
                padding: 0.3rem 0.5rem;
                border: 0.1rem solid #ececec;
                text-align: center;
                font-size: 1.1rem;

                .btn {
                    padding: 0.5rem 1rem;
                    font-size: 1rem;
                    color: #fff;
                    border: 0.1rem solid transparent;
                    border-radius: 0.5rem;
                    cursor: pointer;
                }

                .view {
                    background: #2ecc71;
                }

                .del {
                    background: red;
                }
            }
        }
    </style>
    <script type="text/javascript">
        const handleDelete = (id) => {
            if(confirm("Are you sure you want to delete user with id " + id)){
                window.location="delete-user?id=" + id;
            }
        }
        const handleUpdate = (id) => {
            window.location="update-user?id=" + id;
        }

    </script>
</head>
<body>
<h1>Danh sách user</h1>
<a href="/create-user">Add new user</a>
<table>
    <thead>
    <tr>
        <td>
            STT
        </td>
        <td>
            ID
        </td>
        <td>
            Name
        </td>
        <td>
            University
        </td>
        <td>
            Class
        </td>
        <td>
            Grade
        </td>
        <td>
            Action
        </td>
    </tr>
    </thead>
    <tbody>
    <%
        if(request.getAttribute("users")==null) {


    %>
        <h3>Empty</h3>
    <%
        }
    %>


    <%
        if (request.getAttribute("users") != null) {
            List<User> user = (List<User>) request.getAttribute("users");
            for (int i = 0; i < user.size(); i++) {


    %>
    <tr>
        <td>
            <%= user.get(i).getId()%>
        </td>
        <td>
            <%= user.get(i).getName()%>
        </td>
        <td>
            <%= user.get(i).getUsername()%>
        </td>
        <td>
            <%= user.get(i).getEmail()%>
        </td>
        <td>
            <%= user.get(i).getPassword()%>
        </td>
        <td>
            <%= user.get(i).getRole()%>
        </td>
        <td>
            <button onclick="handleUpdate(<%= user.get(i).getId()%>)" class="btn view">View</button>
            <button onclick="handleDelete(<%= user.get(i).getId()%>)" class="btn del">Delete</button>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>