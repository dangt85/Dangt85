<%@ include file="../header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<section id="content" class="body">

  <p class="success">
    Success <a href="#">message</a>
  </p>
  <p class="error">
    Error <a href="#">message</a>
  </p>
  <p class="notice">
    Notice <a href="#">message</a>
  </p>

  <c:if test="${empty posts}">
    <p class="notice">
      There are no posts available. <a href="/posts/create">Create a new post</a>
    </p>
  </c:if>
  <c:if test="${not empty posts}">
    <ol id="posts-list" class="hfeed">
      <li>
        <article class="hentry">
          <header>
            <h2 class="entry-title">
              <a href="#" rel="bookmark"
                title="Permalink to this POST TITLE">${post.title}</a>
            </h2>
            <a href="/posts?method=delete&id=${post.key}">remove</a>
          </header>

          <footer class="post-info">
            <abbr class="published" title="2005-10-10T14:07:00-07:00">${post.createdAt}</abbr>

            <address class="vcard author">
              By <a class="url fn" href="#">Daniel Gonzalez</a>
            </address>
          </footer>
          <!-- /.post-info -->

          <div class="entry-content">
            <p>${post.content}</p>
          </div>
          <!-- /.entry-content -->
        </article>
      </li>
    </ol>
    <!-- /#posts-list -->
  </c:if>
</section>
<!-- /#content -->

<%@ include file="../footer.jsp"%>