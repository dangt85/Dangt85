<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="stylesheets/screen.css" media="screen" rel="stylesheet" type="text/css" />
	<script src="javascripts/application.js" type="text/javascript"></script>
	<script src="javascripts/prototype.js" type="text/javascript"></script>
	<script src="javascripts/effects.js" type="text/javascript"></script>
	<script src="javascripts/controls.js" type="text/javascript"></script>
	<script src="javascripts/dragdrop.js" type="text/javascript"></script>
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
  
  <body>

    <!-- header starts-->
    <div id="header-wrap"><div id="header" class="container_16">

        <h1 id="logo-text"><a href="/">Daniel Gonzalez</a></h1>
        <p id="intro">Freelance web developer...</p>

        <!-- navigation -->
        <div id="nav">
          <ul>
            <li <% if(request.getRequestURI().equals("/index")) { out.write("id=\"current\""); } %>>
              <a href="/">Home</a>
            </li>
            <li <% if(request.getRequestURI().equals("/showPosts")) { out.write("id=\"current\""); } %>>
              <a href="/posts">Blog</a>
            </li>
            <li>
              <a href="/">Portfolio</a>
            </li>
            <li <% if(request.getRequestURI().equals("/contact")) { out.write("id=\"current\""); } %>>
              <a href="/contact">Contact</a>
            </li>
          </ul>
        </div>

        <div id="header-image"></div>

        <form action="http://www.google.com/cse" id="cse-search-box">
          <div>
            <input type="hidden" name="cx" value="000220205247216395737:9z_0-tsdijw" />
            <input type="hidden" name="ie" value="UTF-8" />
            <input class="tbox" id="qsearch" type="text" name="q" />
            <input class="btn" alt="Search" type="image" name="sa" title="Search" src="/images/search.gif" />
          </div>
        </form>

        <script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box"></script>

        <!-- header ends here -->
      </div></div>

    <!-- content starts -->
    <div id="content-outer"><div id="content-wrapper" class="container_16">

        <!-- main -->
        <div id="main" class="grid_8">