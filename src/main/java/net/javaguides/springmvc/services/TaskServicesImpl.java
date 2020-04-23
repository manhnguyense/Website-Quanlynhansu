package net.javaguides.springmvc.services;

import java.lang.reflect.Member;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.javaguides.springmvc.dao.TaskDAO;
import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;
@Service
public class TaskServicesImpl implements TaskServices{

	@Autowired
	TaskDAO taskDAO;
	public List<Task> getAll() {
		
		return taskDAO.getAll();
	}
	public Task getMemberOfTask(int id) {
		
		return taskDAO.getMemBerOfTask(id);
	}
	public boolean deleteTask(int id) {
		
		return taskDAO.deleteTask(id);
	}
	public boolean addTask(Task task) {
	
		return taskDAO.addTask(task);
	}
	public boolean updateTask(Task task) {
		
		return taskDAO.updateTask(task);
	}
	
	
	

}
