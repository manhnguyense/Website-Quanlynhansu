package net.javaguides.springmvc.controller;

import java.lang.reflect.Member;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;

import javax.sound.midi.Soundbank;
import javax.validation.constraints.Min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
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
import net.javaguides.springmvc.entity.TaskDetail;
import net.javaguides.springmvc.services.MemberServices;
import net.javaguides.springmvc.services.TaskServices;

@Controller
@RequestMapping("/")
public class TaskController {
	@Autowired 
	TaskServices taskServices;
	@Autowired
	MemberServices memberServices;
	@Autowired
    public JavaMailSender emailSender;
	@GetMapping
	public String getAll(ModelMap map) {
		List<Task>list=taskServices.getAll();
		List<Members>listmember=memberServices.getAll();
		map.addAttribute("listTask", list);
		map.addAttribute("listMember", listmember);
		return "task";
		
		
	}
	// Scheduled send mail notify 
	
	 @Scheduled(fixedDelay = 1000*60) 
	  public void scheduleFixedDelayTask() {
		  	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/YYYY HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			String currentDate=dtf.format(now).toString();
			Integer minute=Integer.parseInt(currentDate.substring(14,16));
			List<Task>listDealine=taskServices.getDealine(currentDate.substring(0,10),currentDate.substring(11,13),minute.toString());
			//List<Task>listDealine=taskServices.getDealine("04/27/2020","08","32");		
			 for (Task task : listDealine) 
			 { Set<Members>listmem=task.getListmember(); 
				 for (Members mem:listmem) 
				 { 
					 SimpleMailMessage message = new SimpleMailMessage();
				     message.setTo(mem.getEmail()); message.setSubject("TASK dealine "+task.getTitle()+
				     task.getDuedatetime()+" by "+mem.getName());
				     message.setText("You can Succes States your task"); //Send Message!
				     this.emailSender.send(message);
				  } 
			 }
			 
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
