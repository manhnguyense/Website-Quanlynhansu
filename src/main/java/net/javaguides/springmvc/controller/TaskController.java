package net.javaguides.springmvc.controller;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.Min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;
import net.javaguides.springmvc.services.MemberServices;
import net.javaguides.springmvc.services.TaskServices;

@Controller
@RequestMapping("/")
public class TaskController {
	@Autowired 
	TaskServices taskServices;
	@Autowired
	MemberServices memberServices;
	@GetMapping
	public String getAll(ModelMap map) {
		List<Task>list=taskServices.getAll();
		List<Members>listmember=memberServices.getAll();
		map.addAttribute("listTask", list);
		map.addAttribute("listMember", listmember);
		return "task";
		
	}
	@GetMapping("{id}")
	public String deleteTask(@PathVariable int id) {
		System.out.println(id);
		taskServices.deleteTask(id);
		return"redirect:/";
	}
	@GetMapping("/getTask/{id}")
	public String getMemberOfList(ModelMap map,@PathVariable int id) {
		Task task =taskServices.getMemberOfTask(id);
		map.addAttribute("task",task );
		List<Members>listmember=memberServices.getAll();
		map.addAttribute("listMember", listmember);
		return "taskDetail";
		
	}
	@GetMapping("login")
	public String login() {
		return "login";
	}
	




	
}
