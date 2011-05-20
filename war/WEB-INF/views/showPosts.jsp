<%@ include file="header.jsp" %>

<%@ page import="com.appspot.dangt85.models.Post" %>
<%@ page import="java.util.List" %>

    <section id="content" class="body">
		<ol id="posts-list" class="hfeed">
<%
	List<Post> posts = (List<Post>) request.getAttribute("posts");
	if(posts == null || posts.isEmpty()) {
%>
    <li><h2>There are no posts</h2></li>
<%
	} else {
		for(Post post : posts) {
%>
	      <li>
	        <article class="hentry">	
				<header>
					<h2 class="entry-title"><a href="#" rel="bookmark" title="Permalink to this POST TITLE"><%= post.getTitle() %></a></h2>
					<a href="/posts?method=delete&id=<%= post.getKey() %>">remove</a>
				</header>
				
				<footer class="post-info">
					<abbr class="published" title="2005-10-10T14:07:00-07:00"><!-- YYYYMMDDThh:mm:ss+ZZZZ -->
						<%= post.getCreatedAt() %>
					</abbr>

					<address class="vcard author">
						By <a class="url fn" href="#">Daniel Gonzalez</a>
					</address>
				</footer><!-- /.post-info -->
				
				<div class="entry-content">
					<p><%= post.getContent() %></p>
				</div><!-- /.entry-content -->
			</article>
	      </li>
<% 
		}
	}
%>
        </ol><!-- /#posts-list -->

<form action="/posts" method="post">
Title: <input name="title" type="text" /><br />
<textarea rows="4" cols="30" name="content"></textarea><div style="clear:both"></div><br />
<input type="submit" />
</form>
	</section><!-- /#content -->

<%@ include file="footer.jsp" %>