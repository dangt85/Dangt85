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

  <form:form modelAttribute="contact" action="../contact" method="post">
    <fieldset>
      <legend>Send message</legend>

      <p>
        <form:label id="nameLabel" for="name" path="name"
          >Name</form:label>
<%--           cssErrorClass="error">Name</form:label> --%>
        <br />
        <form:input path="name" />
<%--         <form:errors path="name" /> --%>
      </p>

      <p>
        <form:label id="messageLabel" for="message" path="message"
          >Message</form:label>
<%--           cssErrorClass="error">Message</form:label> --%>
        <br />
        <form:textarea path="message" rows="4" cols="30" />
<%--         <form:errors path="message" /> --%>
      </p>
      <div id="recaptcha" style="margin-top:10px" align="center">
<%--    <%# :theme => red, white, blackglass, clean, custom %> --%>
<%--     <%= recaptcha_tags :display => {:theme => 'blackglass', :tabindex => '6'} %> --%>
  </div>
      <div style="clear: both"></div>
      <p>
        <input id="create" type="submit" value="Create" />
      </p>
    </fieldset>
  </form:form>
</section>
<!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp" %>