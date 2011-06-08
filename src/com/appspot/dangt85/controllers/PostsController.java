package com.appspot.dangt85.controllers;

import java.util.ArrayList;
import java.util.List;

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
import com.appspot.dangt85.models.Post;
import com.appspot.dangt85.models.Reply;
import com.appspot.dangt85.models.validators.PostValidator;
import com.appspot.dangt85.utils.FlashMap;
import com.appspot.dangt85.utils.ResourceNotFoundException;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@Controller
@RequestMapping(value = "/posts")
public class PostsController {

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		String query = "select from " + Post.class.getName();
		List<Post> posts = (List<Post>) pm.newQuery(query).execute();

		if (!posts.isEmpty()) {
			mav.addObject("posts", posts);
			mav.addObject("reply", new Reply());
		}
		mav.setViewName("posts/list");
		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateForm(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {
			model.addAttribute(new Post());
			return "posts/new";
		} else {
			return "redirect:"
					+ userService.createLoginURL(request.getRequestURI());
		}
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@ModelAttribute("post") Post post,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {

			// if (user.getEmail().equals("dangt85@gmail.com")) {
			// FlashMap.setErrorMessage("You are not me!");
			// return "redirect:"
			// + userService.createLogoutURL("/");
			// }

			new PostValidator().validate(post, result);

			if (result.hasErrors()) {
				FlashMap.setErrorMessage("There were errors in the form");
				return "posts/new";
			}

			PersistenceManager pm = PMF.get().getPersistenceManager();
			try {
				pm.makePersistent(post);
				FlashMap.setSuccessMessage("The post was successfully created");
			} catch (Exception e) {
				FlashMap.setErrorMessage("The post could not be saved");
				return "posts/new";
			} finally {
				pm.close();
			}

			return "redirect:/posts";

		} else {
			return "redirect:"
					+ userService.createLoginURL(request.getRequestURI());
		}
	}

	@RequestMapping(value = "{id}", method = RequestMethod.POST)
	public String reply(@PathVariable Long id,
			@ModelAttribute("reply") Reply reply, BindingResult result,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {

			PersistenceManager pm = PMF.get().getPersistenceManager();
			try {
				Post post = pm.getObjectById(Post.class, id);
				reply.setRepliedBy(user.getNickname());
				post.addReply(reply);
				pm.makePersistent(post);

				FlashMap.setSuccessMessage("The reply was successfully saved");
			} catch (Exception e) {
				e.printStackTrace();

				FlashMap.setErrorMessage("The reply could not be saved");
				return "posts/new";
			} finally {
				pm.close();
			}
		}
		return "redirect:/posts";
	}

	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public ModelAndView get(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView();

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Post post = pm.getObjectById(Post.class, id);

		if (post == null) {
			throw new ResourceNotFoundException(id);
		} else {
			List<Post> posts = new ArrayList<Post>();
			posts.add(post);
			mav.addObject("posts", posts);
		}
		mav.setViewName("posts/list");
		return mav;
	}

	@RequestMapping(value = "{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable Long id) {

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		if (user != null) {

//			if (user.getEmail().equals("dangt85@gmail.com")) {
//				FlashMap.setErrorMessage("You are not me!");
//				return "redirect:" + userService.createLogoutURL("/");
//			}

			PersistenceManager pm = PMF.get().getPersistenceManager();
			Post post = pm.getObjectById(Post.class, id);

			if (post == null) {
				throw new ResourceNotFoundException(id);
			}

			try {
				pm.deletePersistent(post);
			} finally {
				pm.close();
			}
			FlashMap.setSuccessMessage("The post was successfully deleted");

			return "redirect:/posts";
		} else {
			FlashMap.setErrorMessage("The post could not be deleted");
			return "posts/list";
		}
	}
}
