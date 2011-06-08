<%@ include file="/WEB-INF/views/header.jsp"%>

<section id="content" class="body">

  <form:form modelAttribute="project" action="${uploadURL}" method="post" enctype="multipart/form-data">
    <fieldset>
      <legend>Create new project</legend>

      <p>
        <form:label id="nameLabel" for="name" path="name"
          cssErrorClass="error">Name</form:label>
        <br />
        <form:input path="name" />
        <form:errors path="name" />
      </p>

      <p>
        <form:label id="descriptionLabel" for="description" path="description"
          cssErrorClass="error">Description</form:label>
        <br />
        <form:textarea path="description" rows="8" cols="80" />
        <form:errors path="description" />
      </p>
      <div style="clear: both"></div>
      
      <p>
        <form:label id="fileLabel" for="file" path="file"
          cssErrorClass="error">Image</form:label>
        <br />
        <form:input path="file" type="file" />
        <form:errors path="file" />
      </p>
      <p>
        <input id="create" type="submit" value="Create" />
      </p>
    </fieldset>
  </form:form>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp"%>