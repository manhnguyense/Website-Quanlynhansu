package net.javaguides.springmvc.dao;

import java.util.List;

import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;

public interface TaskDAO {
	public List<Task>getAll();
	public Task getMemBerOfTask(int id);
	public boolean deleteTask(int id);
	public boolean addTask(Task task);
	public boolean updateTask(Task task);
	public List<Task>getDealine(String date,String hour,String minutes);

}
