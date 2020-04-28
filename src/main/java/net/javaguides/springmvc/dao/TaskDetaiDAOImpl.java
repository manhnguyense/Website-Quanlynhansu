package net.javaguides.springmvc.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.javaguides.springmvc.entity.TaskDetail;
@Repository
public class TaskDetaiDAOImpl implements TaskDetailDAO{

	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public TaskDetail getTaskDetailById(int id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="From TASK_DETAIL where Id="+id;
		TaskDetail taskDetail=(TaskDetail) session.createQuery(sql).getSingleResult();
		return taskDetail;
	}
	@Transactional
	public boolean save(TaskDetail taskDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(taskDetail);
		return false;
	}

}
