package com.yit.portal.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yit.portal.bean.Product;
import com.yit.portal.bean.User;
import com.yit.portal.util.RestClient;

@Controller
public class WelcomeController {

	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "Hello World";

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		model.put("message", this.message);
		return "welcome";
	}

	@RequestMapping( value = "/query", method = RequestMethod.GET)
	public ModelAndView query(@RequestParam(value="name", required=false) String name) {
		ModelAndView mv = new ModelAndView("list");
        
		RestClient rc = new RestClient();
		String result = rc.get("http://gateway-boot-git:8080/getProduct");
		
		
		List<Product> list = Product.buildJsonToCallsObject(result);
		
        mv.addObject("list",list);
        
        return mv;
	}

	
	
}
