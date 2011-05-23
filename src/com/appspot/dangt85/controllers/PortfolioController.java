package com.appspot.dangt85.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/projects")
public class PortfolioController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		
//		PersistenceManager pm = PMF.get().getPersistenceManager();
//		
//		String query = "select from " + Post.class.getName();
//		List<Post> posts = (List<Post>) pm.newQuery(query).execute();
//
//		if(!posts.isEmpty()) {
//			mav.addObject("posts", posts);
//		}
		mav.setViewName("portfolio/projects");
		return mav;
	}
}
