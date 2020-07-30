package com.yit.portal.bean;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Product {

	int id;
	String name;
	String description;
	int price;
	int instock;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getInstock() {
		return instock;
	}
	public void setInstock(int instock) {
		this.instock = instock;
	}
	
	public static List<Product> buildJsonToCallsObject(String json){

		Gson gson = new Gson();
		
		TypeToken<List<Product>> token = new TypeToken<List<Product>>() {};
		List<Product> cList = gson.fromJson(json, token.getType());
		
		
		return cList;
		
	}
	
	public static Product buildJsonToObject(String json){

		Gson gson = new Gson();

		Product c = gson.fromJson(json, Product.class);
		
		
		return c;
		
	}
	
}
