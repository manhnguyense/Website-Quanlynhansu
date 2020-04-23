package net.javaguides.springmvc.services;

import java.util.List;

import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;

public interface TaskServices {
	public List<Task>getAll();
	public Task getMemberOfTask(int id);
	public boolean deleteTask(int id);
	public  boolean addTask(Task task);
	public boolean updateTask(Task task);

}
