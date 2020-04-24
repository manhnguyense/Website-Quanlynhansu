package net.javaguides.springmvc.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;


import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TaskDAOImpl implements TaskDAO{

	@Autowired
	private SessionFactory sessionFactory;
	@Transactional
	public List<Task> getAll() {
		String sql="From TASK";
		Session session=sessionFactory.getCurrentSession();
		List<Task>getAll=session.createQuery(sql).getResultList();
		return getAll;
	}
	@Transactional
	public Task getMemBerOfTask(int id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="from TASK where Idtask ="+id;
		Task task=(Task) session.createQuery(sql).getSingleResult();
	
		return task;
		
	}
	@Transactional
	public boolean deleteTask(int id) {
		Session session= sessionFactory.getCurrentSession();
		Task task=new Task();
		task.setIdtask(id);
		session.delete(task);
		return false;
	}
	@Transactional
	public boolean addTask(Task task) {
		Session session=sessionFactory.getCurrentSession();
		if(session.save(task)!=null) {
			return true;
		}
		return false;
	}
	@Transactional
	public boolean updateTask(Task task) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(task);
		if(session!=null) {
			return true;
		}
		return false;
	}
	@Transactional
	public List<Task> getDealine(String date, String hour, String minutes) {
		String sql="from TASK where Duedatetime ='"+date+"' and Duedatehour ='"+hour+"' and Duedateminute='"+minutes+"'";
		Session session=sessionFactory.getCurrentSession();
		List<Task>list=session.createQuery(sql).getResultList();
		return list;
	}
	

}
