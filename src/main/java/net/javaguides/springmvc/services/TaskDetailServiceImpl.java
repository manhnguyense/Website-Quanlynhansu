package net.javaguides.springmvc.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.javaguides.springmvc.dao.TaskDetailDAO;
import net.javaguides.springmvc.entity.TaskDetail;
@Service
public class TaskDetailServiceImpl implements TaskDetailService{

	@Autowired 
	TaskDetailDAO taskDetailDAO;
	public TaskDetail getTaskDetailById(int id) {
		// TODO Auto-generated method stub
		return taskDetailDAO.getTaskDetailById(id);
	}
	public boolean save(TaskDetail taskDetail) {
		// TODO Auto-generated method stub
		return taskDetailDAO.save(taskDetail);
	}

}
