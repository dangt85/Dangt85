<%@ include file="header.jsp" %>

<%@ page import="com.appspot.models.Post" %>
<%@ page import="java.util.List" %>

<%
	List<Post> posts = (List<Post>) request.getAttribute("posts");
	if(posts == null || posts.isEmpty()) {
%>
<p>There are no posts</p>
<%
	} else {
		for(Post post : posts) {
%>
	<h3><%= post.getTitle() %></h3>
	<a href="/posts?method=delete&id=<%= post.getKey() %>">remove</a>
	<p><%= post.getContent() %></p>
<% 
		}
	} 
%>
<form action="/posts" method="post">
Title: <input name="title" type="text" /><br />
Content: <textarea rows="4" cols="30" name="content"></textarea><br />
<input type="submit" />
</form>

<%@ include file="footer.jsp" %>