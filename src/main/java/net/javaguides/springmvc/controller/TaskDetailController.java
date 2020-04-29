package net.javaguides.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.javaguides.springmvc.entity.Task;
import net.javaguides.springmvc.entity.TaskDetail;
import net.javaguides.springmvc.services.TaskDetailService;

@Controller
@RequestMapping("/getTask/taskDetail/{id}")
public class TaskDetailController {
	@Autowired
	TaskDetailService taskDetailService;
	@GetMapping
	public String addTaskDetail() {
		return "addTaskDetail";
	}
	@PostMapping
	public String add(@RequestParam String taskname,@RequestParam String document,@PathVariable int id) {
		Task task=new Task();
		task.setIdtask(id);
		TaskDetail taskDetail=new TaskDetail();
		taskDetail.setTaskname(taskname);
		taskDetail.setDocument(document);
		taskDetail.setTask(task);
		taskDetailService.save(taskDetail);
		return"redirect:/" ;
		
	}

}
