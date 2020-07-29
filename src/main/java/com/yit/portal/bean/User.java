package com.yit.portal.bean;

import java.util.Date;

public class User {

	String username;
	String first_name;
	String last_name;
	Date date_bird;
	int age;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	
	public Date getDate_bird() {
		return date_bird;
	}
	public void setDate_bird(Date date_bird) {
		this.date_bird = date_bird;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
}
