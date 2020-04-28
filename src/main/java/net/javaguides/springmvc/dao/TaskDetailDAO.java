package net.javaguides.springmvc.dao;

import net.javaguides.springmvc.entity.TaskDetail;

public interface TaskDetailDAO {
	public TaskDetail getTaskDetailById(int id);
	public boolean save(TaskDetail taskDetail);

}
