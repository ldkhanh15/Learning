<%@ page import="java.util.List" %>
<%@ page import="model.Hashtag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<%--<%@include file="../Component/notify.jsp" %>--%>
<div class="content-admin">
    <div class="manage-hashtag">
        <div class="manage-categories__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-hashtag__title title">Manage hashtags</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name hashtag" class="search-input" name="Tag">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
<%--            <!-------Button trigger ADD NEW hashtag modal-------- -->--%>
<%--            <button type="button" class="btn-dashboard btn__add-hashtag" data-bs-toggle="modal"--%>
<%--                    data-bs-target="#modal__add-new-hashtag" style="border: none;">--%>
<%--                <i class="fa-solid fa-plus"></i>Add new hashtag--%>
<%--            </button>--%>
<%--            <!--------------- MODAL ADD NEW hashtag-------------- -->--%>
<%--            <div class="modal fade modal__add" id="modal__add-new-hashtag">--%>
<%--                <div class="modal-dialog modal-dialog-centered">--%>
<%--                    <div class="modal-content">--%>
<%--                        <div class="modal-header">--%>
<%--                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--                        </div>--%>
<%--                        <div class="modal-body">--%>
<%--                            <div class="Title-post">--%>
<%--                                <label for="Title-post-add">Name's post</label>--%>
<%--                                <input list="_Title-post-add" name="PostId" id="Title-post-add"--%>
<%--                                       placeholder="Choose a title post" required>--%>
<%--                                <datalist id="_Title-post-add">--%>
<%--                                    <option value="Python Review - is it any good? (2023)">--%>
<%--                                </datalist>--%>
<%--                            </div>--%>
<%--                            <div class="tag">--%>
<%--                                <label for="Tag-add">Tag</label>--%>
<%--                                <input type="text" placeholder="Enter tag" name="Tag" id="Tag-add">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="modal-footer">--%>
<%--                            <a href="../dashboard_hashtag" class="btn btn-primary">Confirm</a>--%>
<%--                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- --------------------------------------------------------------->--%>

        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID Hashtag</th>
                    <th onclick="sortTable(1)">Tag</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("hashtags") != null) {
                        List<Hashtag> hashtags = (List<Hashtag>) request.getAttribute("hashtags");
                        for (Hashtag hashtag : hashtags) {
                %>
                <tr>
                    <td><%=hashtag.getId()%>
                    </td>
                    <td><%=hashtag.getTag()%></td>
                    <td>
<%--                        <!-- BUTTON TRIGGER UPDATE MODAL  -->--%>
<%--                        <button type="button" class="btn__modal" data-bs-toggle="modal"--%>
<%--                                data-bs-target="#modal__update-hashtag" style="border: none;"--%>
<%--                                title="Update hashtag">--%>
<%--                            <i class="fa-solid fa-pen"></i>--%>
<%--                        </button>--%>
<%--                        <!--------------- MODAL UPDATE hashtag-------------- -->--%>
<%--                        <div class="modal fade modal__update" id="modal__update-hashtag">--%>
<%--                            <div class="modal-dialog modal-dialog-centered">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <button type="button" class="btn-close"--%>
<%--                                                data-bs-dismiss="modal"></button>--%>
<%--                                    </div>--%>
<%--                                    <form action="">--%>
<%--                                        <div class="modal-body">--%>
<%--                                            &lt;%&ndash;                                        <div class="Title-post">&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                            <label for="Title-post-update">Name's post</label>&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                            <input list="_Title-post-update" name="PostId"&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                                   id="Title-post-update" placeholder="Choose a title post"&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                                   required>&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                            <datalist id="_Title-post-update">&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                                <option value="Python Review - is it any good? (2023)">&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                            </datalist>&ndash;%&gt;--%>
<%--                                            &lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--                                            <div class="tag">--%>
<%--                                                <label for="Tag-update">Tag</label>--%>
<%--                                                <input type="text" placeholder="Enter tag" name="Tag"--%>
<%--                                                       id="Tag-update">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-footer">--%>
<%--                                            <button type="submit" class="btn btn-primary">Confirm</button>--%>
<%--                                            <button type="button" class="btn btn-danger"--%>
<%--                                                    data-bs-dismiss="modal">No--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>


                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete-category_<%=hashtag.getId()%>" title="Delete hashtag">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete-category_<%=hashtag.getId()%>">
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
                                    <a href="/dashboard/delete-hashtag?id=<%=hashtag.getId() %>"
                                       class="btn btn-primary">Yes
                                    </a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </tr>
                <%
                        }
                    }
                %>

                <%-- SORT TABLE --%>
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
        </div>
    </div>
</div>
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