<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Daniel Gonzalez</title>
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon.ico" />
    <meta name="keywords" content="daniel gonzalez, venezuela, web developer, freelancer, j2ee, ruby on rails, ruby, php, mysql, oracle, software developer, database administrator, database desingner, blog, portfolio" />
    <meta name="description" content="personal freelancer web developer portfolio and blog website" />
    <meta name="author" content="Daniel Gonzalez" />
    
    <link rel="stylesheet" href="/css/main.css" type="text/css">

	<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
		<script src="js/IE8.js" type="text/javascript"></script>
	<![endif]-->
		
	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/>
	<![endif]-->
    
    
	<script src="/js/jquery-1.6.1.min.js" type="text/javascript"></script>
	<script src="/js/application.js" type="text/javascript"></script>
    
    <!-- %= auto_discovery_link_tag(:rss, {:controller => 'posts', :action=> 'index', :format => 'rss'}, {:title => 'RSS Feeds'}) %-->
  	
  	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-6566238-4']);
	  _gaq.push(['_trackPageview']);
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</script>
  </head>
  
  <body id="index" class="home">
  	<header id="banner" class="body">
		<h1><a href="/">Daniel Gonzalez <strong>Software Developer in the year <del>2022</del> <ins>2011</ins></strong></a></h1>
		<nav>
			<ul>
              <% String currentPath = request.getAttribute("javax.servlet.forward.request_uri").toString(); %>
				<li <% if(currentPath.equals("/")) { out.write("class=\"active\""); } %>>
					<a href="/">home</a>
				</li>
				<li <% if(currentPath.startsWith("/posts")) { out.write("class=\"active\""); } %>>
					<a href="/posts">blog</a>
				</li>
				<li <% if(currentPath.startsWith("/projects")) { out.write("class=\"active\""); } %>>
					<a href="/projects">portfolio</a>
				</li>
				<li <% if(currentPath.startsWith("/contact")) { out.write("class=\"active\""); } %>>
					<a href="/contact">contact</a>
				</li>
			</ul>
		</nav>
	</header><!-- /#banner -->
  
    <% 
      UserService userService = UserServiceFactory.getUserService();
      User user = userService.getCurrentUser();
      if(user != null) { 
    %>
        <section id="content" class="body" style="text-align: right;">
          Welcome <b><%= user.getNickname() %></b> | <a href="<%= userService.createLogoutURL("/") %>">logout</a>
        </section>
    <% } %>
    
    <c:if test="${not empty message}">
      <section id="content" class="body">
        <p id="message" class="${message.type}">${message.text}</p> 
      </section>
    </c:if>