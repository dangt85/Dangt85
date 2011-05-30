<%@ include file="/WEB-INF/views/header.jsp" %>

	<script type="text/javascript">
	<!--
	$(document).ready(function() {
		$('#next-pag').click(function() {
			$('#content > ol#posts-list').load('/text.txt', function(response, status, xhr) {
				if (status == 'error') {
					var msg = 'Sorry but there was an error: ';
					$('p.error').css('display', 'block').html(msg + xhr.status + ' ' + xhr.statusText);
				}
			});
		});
	});
	//-->
	</script>

    <section id="content" class="body">

    	<nav>
    		<a href="#hentry" id="next-pag">next</a>
    	</nav>
		<ol id="posts-list" class="hfeed">
	      <li>
	        <article class="hentry">	
				<header>
					<h2 class="entry-title"><a href="#" rel="bookmark" title="Permalink to this">Dummy Post</a></h2>
					<a href="/posts?method=delete&id=">remove</a>
				</header>
				
				<footer class="post-info">
					<abbr class="published" title="2005-10-10T14:07:00-07:00"><!-- YYYYMMDDThh:mm:ss+ZZZZ -->
						May 17<sup>th</sup>, 2011
					</abbr>

					<address class="vcard author">
						By <a class="url fn" href="#">Daniel Gonzalez</a>
					</address>
				</footer><!-- /.post-info -->
				
				<div class="entry-content">
					<p>Lorem ipsum</p>
				</div><!-- /.entry-content -->
			</article>
	      </li>
        </ol><!-- /#posts-list -->
	</section><!-- /#content -->

<%@ include file="/WEB-INF/views/footer.jsp" %>