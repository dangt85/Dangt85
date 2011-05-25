<%@ include file="/WEB-INF/views/includes.jsp"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<section id="content" class="body">

  <c:if test="${not empty message}">
    <p id="message" class="${message.type}">${message.text}</p>	
  </c:if>

  <form:form modelAttribute="post" action="/posts" method="post">
    <fieldset>
      <legend>Create new post</legend>

      <p>
        <form:label id="titleLabel" for="title" path="title"
          cssErrorClass="error">Title</form:label>
        <br />
        <form:input path="title" />
        <form:errors path="title" />
      </p>

      <p>
        <form:label id="contentLabel" for="content" path="content"
          cssErrorClass="error">Content</form:label>
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
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp"%>