<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-posts">
        <div class="manage-posts__block-title manage-block">
            <h1 class="manage-posts__title title">Update Post</h1>
        </div>
        <div class="update-posts update-block">
            <form class="update-posts__form update-form">
                <div class="update-form__content">
                    <div class="title-posts">
                        <label for="Title-post">Name</label>
                        <input type="text" name="Title" id="Title-post" placeholder="Enter title post" required>
                    </div>
                    <div class="Comment-author-posts">
                        <label for="Comment-author-post">Comment</label>
                        <textarea name="Comment" id="Comment-author-post" rows="12" placeholder="Enter comment"
                                  required></textarea>
                    </div>
                    <div class="content-post">
                        <label for="Content-post">Content post</label>
                        <textarea name="Content" id="Content-post" rows="50"
                                  placeholder="Enter content post"></textarea>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="../dashboard_post" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('Content');
</script>
</body>
</html>