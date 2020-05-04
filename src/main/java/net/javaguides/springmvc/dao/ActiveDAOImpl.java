package net.javaguides.springmvc.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import net.javaguides.springmvc.entity.Active;

@Repository
public class ActiveDAOImpl implements ActiveDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public boolean saveActive(Active active) {
		Session session=sessionFactory.getCurrentSession();
		session.save(active);
		return true;
	}
	

}
