<%@ include file="header.jsp" %>

<section id="content" class="body">

<p class="success">Success <a href="">message</a></p>
<p class="error">Error <a href="">message</a></p>
<p class="notice">Notice <a href="">message</a></p>

<h3>Contact Form</h3>

<form action="/contacts" method="post">
  <p class="req">
    <input type="text" name="name" value="Your Name..."
      onfocus="this.value=(this.value=='Your Name...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Name...' : this.value;"
      tabindex="1" /> *
  </p>
  <p class="req error">
    <input type="text" name="email" value="Your Email..."
      onfocus="this.value=(this.value=='Your Email...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Email...' : this.value;"
      tabindex="2" /> *
  </p>
  <p class="req">
    <textarea name="message" rows="5" cols="30"
      onfocus="this.value=(this.value=='Your Message...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Message...' : this.value;"
      tabindex="3">Your Message...</textarea> *
  </p>
  <div style="clear:both"></div>
  <div id="recaptcha" style="margin-top:10px" align="center">
<%--   	<%# :theme => red, white, blackglass, clean, custom %> --%>
<%--     <%= recaptcha_tags :display => {:theme => 'blackglass', :tabindex => '6'} %> --%>
  </div>
  <p class="no-border">
    <input type="submit" class="button" tabindex="5" />
  </p>
</form>

</section><!-- /#content -->

<%@ include file="footer.jsp" %>