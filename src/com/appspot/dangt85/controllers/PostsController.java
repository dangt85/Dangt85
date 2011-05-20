package com.appspot.dangt85.controllers;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.appspot.dangt85.models.PMF;
import com.appspot.dangt85.models.Post;

@Controller
@RequestMapping(value = "/posts")
public class PostsController {

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		ModelAndView mav = new ModelAndView();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + Post.class.getName();
		List<Post> posts = (List<Post>) pm.newQuery(query).execute();
		
		System.out.println("aqui hay estos posts: " + posts);
		
		if(!posts.isEmpty()) {
			mav.addObject("posts", posts);
		}
		mav.setViewName("posts/list");
		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateForm(Model model) {
		model.addAttribute(new Post());
		return "posts/new";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@ModelAttribute("post") Post post, BindingResult result, Model model) {

		System.out.println("me meti " + post.getTitle());
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			post.setCreatedAt(new Date());
			pm.makePersistent(post);
		} finally {
			pm.close();
		}

		return "redirect:posts";
	}

	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public @ResponseBody
	Post get(@PathVariable Long id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Post post = pm.getObjectById(Post.class, id);

		if (post == null) {
			throw new ResourceNotFoundException(id);
		}
		return post;
	}
}
