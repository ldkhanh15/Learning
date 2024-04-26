<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-courses__title title">Manage courses</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name course" class="search-input" name="Name">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <a href="/dashboard/create-course" class="btn-dashboard btn__add-courses"><i
                    class="fa-solid fa-plus"></i>Add new courses</a>
        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID Courses</th>
                    <th onclick="sortTable(1)">Name</th>
                    <th onclick="sortTable(2)">Category</th>
                    <th onclick="sortTable(3)">Price</th>
                    <th onclick="sortTable(4)">Teacher</th>
                    <th onclick="sortTable(5)">Quantity chapters</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("courses") != null) {
                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                        for (Course c : courses) {
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getName()%></td>
                    <td><%=c.getCategory().getName()%></td>
                    <td><%=c.getPrice()%>$</td>
                    <td><%=c.getTeacher().getName()%></td>
                    <td>10</td>
                    <td>
                        <a href="/dashboard/update-course?id=<%=c.getId()%>" title="Edit course"><i class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=c.getId()%>" title="Delete course">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <a href="../dashboard_chapter" title="Manage chapters"><i class="fa-solid fa-eye"></i></a>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=c.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <!-- <h4 class="modal-title">Delete User</h4> -->
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <div class="modal-body border-0">
                                    <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                    <p>Are you sure you want to delete?</p>
                                    <p>Deleted data cannot be recovered.</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="/dashboard/delete-course?id=<%=c.getId()%>" class="btn btn-primary">Yes
                                    </a>
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
                    <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
            <!-- Generated at CSSPortal.com -->
        </div>
    </div>
</div>
</body>
</html>