<%@ include file="/WEB-INF/views/includes.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

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

  <form:form modelAttribute="post" action="../posts" method="post">
    <fieldset>
      <legend>Create new post</legend>

      <p>
        <form:label id="titleLabel" for="title" path="title"
          >Title</form:label>
<%--           cssErrorClass="error">Title</form:label> --%>
        <br />
        <form:input path="title" />
<%--         <form:errors path="title" /> --%>
      </p>

      <p>
        <form:label id="contentLabel" for="content" path="content"
          >Content</form:label>
<%--           cssErrorClass="error">Content</form:label> --%>
        <br />
        <form:textarea path="content" rows="4" cols="30" />
<%--         <form:errors path="content" /> --%>
      </p>
      <div style="clear: both"></div>
      <p>
        <input id="create" type="submit" value="Create" />
      </p>
    </fieldset>
  </form:form>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp" %>