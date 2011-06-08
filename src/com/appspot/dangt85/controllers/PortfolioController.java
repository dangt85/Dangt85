package com.appspot.dangt85.controllers;

import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.appspot.dangt85.models.PMF;
import com.appspot.dangt85.models.Project;
import com.appspot.dangt85.utils.FlashMap;
import com.appspot.dangt85.utils.ResourceNotFoundException;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@Controller
@RequestMapping(value = "/projects")
public class PortfolioController {

	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		String query = "select from " + Project.class.getName();
		List<Project> projects = (List<Project>) pm.newQuery(query).execute();

		if (!projects.isEmpty()) {
			mav.addObject("projects", projects);
		}
		mav.setViewName("projects/list");
		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateForm(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
			model.addAttribute(new Project());
			model.addAttribute("uploadURL",
					blobstoreService.createUploadUrl("/projects"));
			return "projects/new";
		} else {
			return "redirect:"
					+ userService.createLoginURL(request.getRequestURI());
		}
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@ModelAttribute("project") Project project,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {

			if (user.getEmail().equals("dangt85@gmail.com")) {
				FlashMap.setErrorMessage("You are not me!");
				return "redirect:" + userService.createLogoutURL("/");
			}

			// new ProjectValidator().validate(project, result);

			// if (result.hasErrors()) {
			// FlashMap.setErrorMessage("There were errors in the form");
			// return "posts/new";
			// }

			PersistenceManager pm = PMF.get().getPersistenceManager();
			try {

				Map<String, BlobKey> blobs = blobstoreService
						.getUploadedBlobs(request);
				BlobKey blobKey = blobs.get("file");

				ImagesService imagesService = ImagesServiceFactory
						.getImagesService();
				project.setImageURL(imagesService.getServingUrl(blobKey));

				pm.makePersistent(project);

				FlashMap.setSuccessMessage("The project was successfully created");
			} catch (Exception e) {
				FlashMap.setErrorMessage("The project could not be saved");
				return "projects/new";
			} finally {
				pm.close();
			}

			return "redirect:projects";

		} else {
			return "redirect:"
					+ userService.createLoginURL(request.getRequestURI());
		}
	}

	@RequestMapping(value = "{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable Long id) {

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
			
			if (user.getEmail().equals("dangt85@gmail.com")) {
				FlashMap.setErrorMessage("You are not me!");
				return "redirect:" + userService.createLogoutURL("/");
			}
			
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Project project = pm.getObjectById(Project.class, id);

			if (project == null) {
				throw new ResourceNotFoundException(id);
			}

			try {
				pm.deletePersistent(project);
			} finally {
				pm.close();
			}
			FlashMap.setSuccessMessage("The project was successfully deleted");

			return "redirect:/projects";
		} else {
			FlashMap.setErrorMessage("The project could not be deleted");
			return "projects/list";
		}
	}
}
