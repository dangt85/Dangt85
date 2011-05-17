package com.appspot.dangt85;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.models.Contact;
import com.appspot.models.PMF;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Contact contact = new Contact(request.getParameter("name"), 
				request.getParameter("email"), request.getParameter("url"),
				request.getParameter("subject"), request.getParameter("message"),
				new Date(), new Date());
		
		if (contact.isValid()) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try {
				pm.makePersistent(contact);
			} finally {
				pm.close();
			}
		}
		
		response.setContentType("text/plain");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String query = "select from " + Contact.class.getName();
			List<Contact> contacts = (List<Contact>)pm.newQuery(query).execute();
			for(Contact c : contacts) {
				response.getWriter().println(c.toString());
			}
		} finally {
			pm.close();
		}
	}

}
