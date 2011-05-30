<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@ include file="/WEB-INF/views/header.jsp"%>

<section id="content" class="body">
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
        <%
          ReCaptcha c = ReCaptchaFactory.newReCaptcha("Psych, I joke, I joke, I kidd, I kidd", 
              "Psych, I joke, I joke, I kidd, I kidd", false);
          out.print(c.createRecaptchaHtml(null, null));
        %>
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