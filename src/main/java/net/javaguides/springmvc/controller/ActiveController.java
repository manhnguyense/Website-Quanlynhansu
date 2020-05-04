package net.javaguides.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.javaguides.springmvc.services.MemberServices;

@Controller
@RequestMapping("active/")
public class ActiveController {
	@Autowired
	MemberServices memberServices;
	@GetMapping
	public String defaut(ModelMap map) {
		
		map.addAttribute("listmember", memberServices.getAll());
		return"active";
		
	}

}
