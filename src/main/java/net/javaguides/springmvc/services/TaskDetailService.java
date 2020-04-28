package net.javaguides.springmvc.services;

import net.javaguides.springmvc.entity.TaskDetail;

public interface TaskDetailService {
	public TaskDetail getTaskDetailById(int id);
	public boolean save(TaskDetail taskDetail);

}
