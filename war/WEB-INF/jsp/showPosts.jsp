<%@ include file="header.jsp" %>

<%@ page import="com.appspot.models.Posts" %>
<%@ page import="java.util.List" %>

<%
	List<Posts> posts = (List<Posts>) request.getAttribute("posts");
	if(posts == null || posts.isEmpty()) {
%>
<p>There are no posts</p>
<% 
	} else {
		for(Posts post : posts) {
			
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