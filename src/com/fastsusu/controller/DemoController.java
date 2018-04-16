package com.fastsusu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastsusu.model.Feeds;
import com.fastsusu.service.FeedService;

@Controller
public class DemoController {

	@Autowired
	private FeedService feedService;
	
	@RequestMapping("/")
	public String showIndex(Model model) {
		List<Feeds> feeds = feedService.findAllFeeds();
		model.addAttribute("feeds", feeds);
		return "index";
	}
	
	@RequestMapping("/home")
	public String showHome(Model model, HttpServletRequest request) {
		String loggedInUser = request.getUserPrincipal().getName();
		List<Feeds> feeds = feedService.findUserFeeds(loggedInUser);
		model.addAttribute("userFeeds", feeds);
		
		return "home";
	}
	
	// add request mapping for /leaders

	@RequestMapping("/leaders")
	public String showLeaders() {
		
		return "leaders";
	}
	
	// add request mapping for /systems
	
	@RequestMapping("/systems")
	public String showSystems() {
		
		return "systems";
	}
	
	@RequestMapping("/showAbout")
	public String showAbout() {
		
		return "about";
	}
	
}










