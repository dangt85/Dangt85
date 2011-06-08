<%@ include file="/WEB-INF/views/header.jsp" %>

<script type="text/javascript">
<!--
$(document).ready(function() {
	$('#next-pag').click(function() {
		$('#content > ol#posts-list').load('/text.txt', function(response, status, xhr) {
			if (status == 'error') {
				var msg = 'Sorry but there was an error: ';
				$('p.error').css('display', 'block').html(msg + xhr.status + ' ' + xhr.statusText);
			}
		});
	});
});
//-->
</script>

<section id="content" class="body">

  <c:if test="${empty projects}">
    <p class="notice">
      There are no projects available. <a href="/projects/create">Create a
        new project</a>
    </p>
  </c:if>
  
<!--   <nav> -->
<!--     <a href="#hentry" id="next-pag">next</a> -->
<!--   </nav> -->
  
  <c:if test="${not empty projects}">
    <ol id="posts-list" class="hfeed">
      <c:forEach items="${projects}" var="project">
      
      <img src="${project.imageURL}" alt="iamge" />
      
        <li>
          <article class="hentry">
            <header>
              <h2 class="entry-title">
                <a href="#" rel="bookmark" title="Permalink to this PROJECT">
                  <c:out value="${project.name}" />
                </a>
              </h2>
            </header>

            <footer class="post-info">
              <% if(user != null) { %>
                <spring:url value="/projects/{projectId}" var="deleteProjectURL">
                  <spring:param name="projectId" value="${project.id}" />
                </spring:url>
                <form:form id="deleteProject"
                  action="${fn:escapeXml(deleteProjectURL)}" method="delete">
                  <a href="#" onclick="javascript:confirmDelete('project', '#deleteProject');">Delete</a>
                </form:form>
              <% } %>
              <abbr class="published" title="${project.createdAt}">
                <fmt:formatDate value="${project.createdAt}" pattern="MM/dd/yyyy" />
              </abbr>

              <address class="vcard author">
                By <a class="url fn" href="#">Daniel Gonzalez</a>
              </address>
            </footer>
            <!-- /.post-info -->

            <div class="entry-content">
              <p><c:out value="${project.description}" /></p>
            </div>
            <!-- /.entry-content -->
          </article></li>
      </c:forEach>
    </ol>
    <!-- /#posts-list -->
  </c:if>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp" %>