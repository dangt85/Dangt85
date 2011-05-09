<%@ include file="header.jsp" %>

<h3>Contact Form</h3>

<form action="contact" method="post">
  <p>
    <input type="text" ="name" value="Your Name..."
      onfocus="this.value=(this.value=='Your Name...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Name...' : this.value;"
      tabindex="1" />
  </p>
  <p>
    <input type="text" name="email" value="Your Email..."
      onfocus="this.value=(this.value=='Your Email...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Email...' : this.value;"
      tabindex="2" />
  </p>
  <p>
    <input type="text" name="url" value="Your Website..."
      onfocus="this.value=(this.value=='Your Website...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Website...' : this.value;"
      tabindex="3" />
  </p>
  <p>
    <input type="text" name="subject" value="Message Subject..."
      onfocus="this.value=(this.value=='Message Subject...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Message Subject...' : this.value;"
      tabindex="4" />
  </p>
  <p>
    <textarea name="message" rows="10" cols="30"
      onfocus="this.value=(this.value=='Your Message...') ? '' : this.value;"
      onblur="this.value=(this.value=='') ? 'Your Message...' : this.value;"
      tabindex="5">Your Message...</textarea>
  </p>
  <div id="recaptcha" style="margin-top:10px" align="center">
<%--   	<%# :theme => red, white, blackglass, clean, custom %> --%>
<%--     <%= recaptcha_tags :display => {:theme => 'blackglass', :tabindex => '6'} %> --%>
  </div>
  <p class="no-border">
    <input type="submit" class="button" tabindex="7" />
  </p>
</form>

<%@ include file="footer.jsp" %>