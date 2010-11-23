package com.appspot.dangt85;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Dangt85Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world2");
	}
}
