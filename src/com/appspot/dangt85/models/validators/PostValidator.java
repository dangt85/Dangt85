package com.appspot.dangt85.models.validators;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.appspot.dangt85.models.Post;

public class PostValidator {

	public void validate(Post post, Errors errors) {
		if (!StringUtils.hasLength(post.getTitle())) {
			errors.rejectValue("title", "required", "required");
		}
		if (!StringUtils.hasLength(post.getContent())) {
			errors.rejectValue("content", "required", "required");
		}
	}
}
