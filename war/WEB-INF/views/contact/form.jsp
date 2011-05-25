<%@ include file="/WEB-INF/views/includes.jsp"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<section id="content" class="body">

  <c:if test="${not empty message}">
    <p id="message" class="${message.type}">${message.text}</p>
  </c:if>

  <form:form modelAttribute="contact" action="/contact" method="post">
    <fieldset>
      <legend>Send message</legend>

      <p>
        <form:label id="nameLabel" for="name" path="name"
          cssErrorClass="error">Name</form:label>
        <br />
        <form:input path="name" />
        <form:errors path="name" />
      </p>

      <p>
        <form:label id="messageLabel" for="message" path="message"
          cssErrorClass="error">Message</form:label>
        <br />
        <form:textarea path="message" rows="8" cols="80" />
        <form:errors path="message" />
      </p>
      <div id="recaptcha" style="margin-top: 10px" align="center">
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

<%@ include file="/WEB-INF/views/footer.jsp"%>