package net.javaguides.springmvc.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;
import net.javaguides.springmvc.services.MemberServices;

@Controller
@RequestMapping("member/")
@SessionAttributes({"username" })
public class MembersController {
	@Autowired
	MemberServices mem;
	@GetMapping
	public String deFault(ModelMap map) {
		map.addAttribute("listmember",mem.getAll());
		return "members";
	}
	@GetMapping("{id}")
	public String deleteMembers(ModelMap map,@PathVariable int id) {
	
		mem.deleteMember(id);
		return "redirect:/member/";
	}
	@GetMapping("taskMember")
	public String getMember(ModelMap map, HttpSession httpSession) {
		
		 String username=(String) httpSession.getAttribute("username");
		 Members members=mem.getListTask(username);
		 Set<Task>list=members.getListTask();
		 int taskSuccess=0;
		 
		 
		 for (Task task : list) {
				if(task.getState().equals("Success")) {
					taskSuccess++;
				}
		 }
		 int Total=(taskSuccess*100)/list.size();
	
		
		
		 map.addAttribute("listTask", list);
		 map.addAttribute("numSuccess",Total);
		
		return"TaskMemberDetail";
	}
}
