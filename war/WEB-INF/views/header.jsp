<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
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
				<li <% if(request.getRequestURI().equals("/index")) { out.write("class=\"active\""); } %>>
					<a href="/">home</a>
				</li>
				<li <% if(request.getRequestURI().equals("/posts")) { out.write("class=\"active\""); } %>>
					<a href="/posts">blog</a>
				</li>
				<li <% if(request.getRequestURI().equals("/projects")) { out.write("class=\"active\""); } %>>
					<a href="/projects">portfolio</a>
				</li>
				<li <% if(request.getRequestURI().equals("/contact")) { out.write("class=\"active\""); } %>>
					<a href="/contact">contact</a>
				</li>
			</ul>
		</nav>
	</header><!-- /#banner -->
	
	<aside id="featured" class="body">
		<article>
			<figure>
				<img src="/images/sm-logo.gif" alt="dangt85 logo">
			</figure>
			<hgroup>
				<h2>Featured Article</h2>
				<h3><a href="http://media.smashingmagazine.com/cdn_smash/wp-content/uploads/images/smashing-html5/files/index.html#">HTML5 in Smashing Magazine!</a></h3>
			</hgroup>
			<p>Discover how to use Graceful Degradation and Progressive Enhancement techniques to achieve an outstanding, cross-browser <a href="http://dev.w3.org/html5/spec/Overview.html" rel="external">HTML5</a> and <a href="http://www.w3.org/TR/css3-roadmap/" rel="external">CSS3</a> website today!</p>
		</article>
	</aside><!-- /#featured -->
	