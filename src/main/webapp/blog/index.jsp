<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<style>
    .btn:hover{
        color: #FFF;
    }
</style>
<main>
    <!-- feature header -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Posts</h1>
                <div class="feature-header__link">
                    <a href="../Home/index.jsp" class="home">Home</a>
                    <span>/</span>
                    <a href="index.jsp" class="blog">Posts</a>
                </div>
            </div>
        </div>
    </div>
    <!-- blog-posts -->
    <div class="blog-posts">
        <div class="main-content">
            <div class="blog-posts__content">
                <div class="blog-posts__left">
                    <!-- list card blog -->
                    <div class="list-item-courses">
                        <%
                            if (request.getAttribute("allposts") != null) {
                                List<Post> posts = (List<Post>) request.getAttribute("allposts");

                                for (Post post : posts) {
                        %>
                        <div class="item__card-blog">
                            <figure class="card-blog">
                                <div class="card-blog__thumb">
                                    <a href="/detail-blog?id=<%=post.getId()%>"> <img src="/images/<%=post.getImage()%>" alt=""
                                                                                      class="card-blog__img"></a>
                                </div>

                                <div class="card-blog__content">
                                    <div class="blog-meta-tags">
                                        <a href="#"
                                           class="blog-date"><%=post.getCreatedAt().getDate()
                                                +" / "+post.getCreatedAt().getMonth()
                                                +" / "+(post.getCreatedAt().getYear()+1900)

                                        %></a>
                                    </div>
                                    <div class="title-blog">
                                        <a href="/detail-blog?id=<%=post.getId()%>"><%=post.getTitle()%></a>
                                    </div>
                                    <div class="blog-meta-tags">
                                        <a href="#" class="blog-comment"><i class="fa-regular fa-comment"></i>
                                            <%=post.getAuthor().getName()%></a>
                                    </div>
                                </div>
                            </figure>
                        </div>

                        <%
                                }
                            }
                        %>
                    </div>

                    <ul class="pagination justify-content-start">
                        <li id="prev" onclick="previousPage()"
                            class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li id="next" onclick="nextPage()" class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </div>
                <div class="blog-posts__right">
                    <!-- add new post -->
                    <% if (session.getAttribute("user") != null) { %>
                        <a href="/create-my-post" class="btn btn__add-new-post" style="background: #0c2e60">Add new
                            post</a>
                    <% }%>

                    <!-- search form -->
                    <div class="widget widget-search">
                        <form action="/blogs" method="get">
                            <input type="text" name="query" placeholder="Search...">
                            <button type="submit" style="background-color: #fff; border: none;"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                    </div>
                    <!-- list categories -->
                    <div class="widget list-categories">
                        <h3 class="widget__title list-categories__title">Categories</h3>
                        <ul>
                            <%
                                if (request.getAttribute("categories") != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    for (Category category : categories) {
                            %>
                            <li><a href="/courses?category=<%=category.getId()%>"><%=category.getName()%> <span>(<%=category.getTotalCourse()%>)</span></a>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <!-- recent-posts -->
                    <div class="widget recent-posts">
                        <h3 class="widget__title">recent posts</h3>
                        <ul>
                            <%@include file="../Component/recent-posts__item.jsp" %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/blogs?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/blogs?page=" + nextPage;
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
<%@include file="../Component/footer.jsp" %>