package com.entity;

public class Contact {
	private String id;
	private String name;
	private String mobileno;
	private String work;
	private String about;
	
	public Contact(String name, String mobileno, String work, String about) {
		super();
		this.name = name;
		this.mobileno = mobileno;
		this.work = work;
		this.about = about;
	}

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String string) {
		this.id = string;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	

}
