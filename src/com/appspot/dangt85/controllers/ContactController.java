package com.appspot.dangt85.controllers;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.appspot.dangt85.models.Contact;
import com.appspot.dangt85.utils.FlashMap;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {

	@RequestMapping(method = RequestMethod.GET)
	public String contact(Model model) {
		model.addAttribute(new Contact());
		return "contact/form";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String send(@ModelAttribute("contact") Contact contact,
			BindingResult result, HttpServletRequest request, Model model) {

		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("Psych, I joke, I joke, I kidd, I kidd");

		String challenge = request.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr,
				challenge, uresponse);

		if (reCaptchaResponse.isValid()) {
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);

			try {
				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress("dangt85@gmail.com", contact
						.getName()));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						"dangt85@gmail.com", "Daniel Gonzalez"));
				msg.setSubject("Message from " + contact.getName());
				msg.setText("Content: " + contact.getMessage());
				Transport.send(msg);

			} catch (AddressException e) {
				FlashMap.setErrorMessage("The message could not be sent");
				return "contact/form";
			} catch (MessagingException e) {
				FlashMap.setErrorMessage("The message could not be sent");
				return "contact/form";
			} catch (UnsupportedEncodingException e) {
				FlashMap.setErrorMessage("The message could not be sent");
				return "contact/form";
			}

			FlashMap.setSuccessMessage("The message was sent successfully");
		} else {
			FlashMap.setErrorMessage("Wrong answer! try again!");
			return "contact/form";
		}

		return "redirect:/";
	}
}
