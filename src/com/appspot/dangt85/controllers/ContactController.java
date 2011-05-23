package com.appspot.dangt85.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.appspot.dangt85.models.Contact;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {

	@RequestMapping(method = RequestMethod.GET)
	public String contact(Model model) {
		model.addAttribute(new Contact());
		return "contact/form";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String send(@ModelAttribute("contact") Contact contact, BindingResult result, Model model) {
		
		System.out.println(contact.getMessage());
		
		return "redirect:/";
	}
}
