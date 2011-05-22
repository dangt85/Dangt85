<%@ include file="/WEB-INF/views/includes.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<section id="content" class="body">

  <c:if test="${empty posts}">
    <p class="notice">
      There are no posts available. <a href="/posts/create">Create a
        new post</a>
    </p>
  </c:if>

  <c:if test="${not empty posts}">
    <ol id="posts-list" class="hfeed">
      <c:forEach items="${posts}" var="post">
        <li>
          <article class="hentry">
            <header>
              <h2 class="entry-title">
                <a href="#" rel="bookmark"
                  title="Permalink to this POST TITLE">${post.title}</a>
              </h2>
              <form:form id="deletePost" method="delete">
                <a href="#" onclick="$('#deletePost').submit();">remove</a>
			  </form:form>
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
      </c:forEach>
    </ol>
    <!-- /#posts-list -->
  </c:if>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp" %>