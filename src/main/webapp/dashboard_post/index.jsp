<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<%--<%@include file="../Component/notify.jsp" %>--%>

<div class="content-admin">
    <div class="manage-posts">
        <div class="manage-posts__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-courses__title title">Manage posts</h1>
                <form action="/dashboard/posts" method="get" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="query">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <a href="/dashboard/create-post" class="btn-dashboard btn__add-posts"><i
                    class="fa-solid fa-plus"></i>Add new posts</a>
        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID posts</th>
                    <th onclick="sortTable(1)">Title</th>
                    <th onclick="sortTable(2)">Author</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("posts") != null) {
                        List<Post> posts = (List<Post>) request.getAttribute("posts");
                        for (Post post : posts) {


                %>
                <tr>
                    <td><%=post.getId()%></td>
                    <td><%=post.getTitle()%></td>
                    <td><%=post.getAuthor().getName()%></td>
                    <td><a href="/detail-blog?id=<%=post.getId()%>" title="View detail post"><i class="fa-solid fa-eye"></i></a>
                        <a href="/dashboard/update-post?id=<%=post.getId()%>" title="Update post"><i
                                class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=post.getId()%>" title="Delete post">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=post.getId()%>">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>

                                                <div class="modal-body border-0">
                                                <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                    <p>Are you sure you want to delete?</p>
                                    <p>Deleted data
                                        cannot be recovered.</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="/dashboard/delete-post?id=<%=post.getId()%>" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ------------------------------------->
                </tr>
                <%
                        }
                    }
                %>
                <script src="../assets/js/Sort_table/sort-table.js"></script>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>10</b> out of <b>50</b> entries</div>
                <ul class="pagination">
                    <li id="prev" onclick="previousPage()"
                        class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li id="next" onclick="nextPage()" class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/dashboard/posts?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/dashboard/posts?page=" + nextPage;
    }
    window.onload = function() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousButton = document.getElementById("prev");
        if (currentPage == 1) {
            previousButton.disabled = true;
        } else {
            previousButton.disabled = false;
        }
    };
</script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }

    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>
</body>
</html>