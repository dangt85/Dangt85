package com.appspot.dangt85.models;

import java.util.Date;

import javax.jdo.annotations.Persistent;

public class Contact {

	@Persistent
	private String name;

	@Persistent
	private String message;

	@Persistent
	private Date createdAt;

	public Contact() {
		this.createdAt = new Date();
	}

	public Contact(String name, String message, Date createdAt) {
		this.name = name;
		this.message = message;
		this.createdAt = createdAt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
