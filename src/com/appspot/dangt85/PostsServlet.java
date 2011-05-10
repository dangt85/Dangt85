package com.appspot.dangt85;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.models.PMF;
import com.appspot.models.Post;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

/**
 * Servlet implementation class PostsServlet
 */
public class PostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostsServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
			response.setContentType("text/html");
			PersistenceManager pm = PMF.get().getPersistenceManager();

			String method = request.getParameter("method");

			if (method != null) {
				if (method.equals("delete")) {
					String id = request.getParameter("id");
					try {
						Post post = pm.getObjectById(Post.class,
								Long.valueOf(id));
						pm.deletePersistent(post);
					} catch (Exception e) {
					}
				}
			}

			String query = "select from " + Post.class.getName();
			List<Post> posts = (List<Post>) pm.newQuery(query).execute();
			request.setAttribute("posts", posts);
			RequestDispatcher rd = request.getRequestDispatcher("/showPosts");
			rd.forward(request, response);
		} else {
			response.sendRedirect(userService.createLoginURL(request
					.getRequestURI()));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
			response.setContentType("text/html");
			String title = (String) request.getParameter("title");
			String content = (String) request.getParameter("content");
			Post post = new Post(user, title, content, new Date(), new Date());

			if (post.isValid()) {
				PersistenceManager pm = PMF.get().getPersistenceManager();
				try {
					pm.makePersistent(post);
				} finally {
					pm.close();
				}
			}
			response.sendRedirect("/posts");
		} else {
			response.sendRedirect(userService.createLoginURL(request
					.getRequestURI()));
		}
	}

}
