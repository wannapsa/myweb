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

import com.yit.portal.bean.User;

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
        
		List<User> list = new ArrayList<User>();
		
		User u1 = new User();
		u1.setAge(30);
		u1.setDate_bird(new Date());
        u1.setFirst_name("Kriangsak");
    	u1.setLast_name("Pornpantiva");
    	u1.setUsername("kriangpo");
    	
    	User u2 = new User();
		u2.setAge(35);
		u2.setDate_bird(new Date());
        u2.setFirst_name("Test1");
    	u2.setLast_name("Test");
    	u2.setUsername("test");
    	
    	list.add(u1);
    	list.add(u2);
    	
        mv.addObject("list",list);
        
        return mv;
	}

	
	
}
