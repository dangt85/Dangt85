<%@ include file="/WEB-INF/views/header.jsp"%>

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
                <a href="/posts/${post.id}" rel="bookmark"
                  title="Permalink to this POST TITLE">
                    <c:out value="${post.title}" />
                  </a>
              </h2>
            </header>

            <footer class="post-info">
              <% if(user != null) { %>
                <spring:url value="/posts/{postId}" var="postURL">
                  <spring:param name="postId" value="${post.id}" />
                </spring:url>
                <form:form id="deletePost"
                  action="${fn:escapeXml(postURL)}" method="delete">
                  <a href="#"
                    onclick="javascript:confirmDelete('post', '#deletePost');">Delete</a>
                </form:form>
              <% } %>
              Posted on <abbr class="published" title="${post.createdAt}">
                <fmt:formatDate value="${post.createdAt}"
                  pattern="MM/dd/yyyy" /> </abbr>

              <address class="vcard author">
                by <a class="url fn" href="#">Daniel Gonzalez</a>
              </address>
            </footer>
            <!-- /.post-info -->

            <div class="entry-content">
              <p><c:out value="${post.content}" /></p>
            </div>
            <!-- /.entry-content -->
          </article>
          </li>

        <c:forEach items="${post.replies}" var="reply">
          <li>
            <article class="hentry">
              <footer class="post-info">
                Replied on <abbr class="published" title="${reply.createdAt}">
                  <fmt:formatDate value="${reply.createdAt}"
                    pattern="MM/dd/yyyy" /> </abbr>

                <address class="vcard author">
                  by <b><c:out value="${reply.repliedBy}" />
                  </b>
                </address>
              </footer>
              <div class="entry-content">
                <p>
                  <c:out value="${reply.content}" />
                </p>
              </div>
              <!-- /.entry-content -->
            </article>
          </li>
        </c:forEach>

        <li>
          <% if(user != null) { %>
          <form:form modelAttribute="reply"
            action="${fn:escapeXml(postURL)}" method="post">
            <fieldset>
              <legend>Reply</legend>
              <p>
                <form:label id="contentLabel" for="content"
                  path="content" cssErrorClass="error">Content</form:label>
                <br />
                <form:textarea path="content" rows="8" cols="80" />
                <form:errors path="content" />
              </p>
              <div style="clear: both"></div>
              <p>
                <input id="create" type="submit" value="Create" />
              </p>
            </fieldset>
          </form:form>
          <% } %>
        </li>
      </c:forEach>
    </ol>
    <!-- /#posts-list -->
  </c:if>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp"%>