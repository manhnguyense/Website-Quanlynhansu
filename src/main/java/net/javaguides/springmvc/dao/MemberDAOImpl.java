package net.javaguides.springmvc.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import net.javaguides.springmvc.entity.Members;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<Members> getAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createQuery("from MEMBERS",Members.class).getResultList();
	}
	@Transactional
	public boolean deleteMembers(int id) {
		Session session=sessionFactory.getCurrentSession();
		Members member=new Members();
		member.setIdmember(id);
		session.delete(member);
		return false;
	}
	@Transactional
	public boolean addMember(Members mb) {
		Session session=sessionFactory.getCurrentSession();
	   if(session.save(mb)!=null) {
		   return true;
	   }
		
		return false;
	}
	@Transactional
	public boolean login(String username, String password) {
		try {
		String sql="from MEMBERS Where Username='"+username+"'and Password='"+password+"'";
		Session session=sessionFactory.getCurrentSession();
		Members mem =(Members) session.createQuery(sql).getSingleResult();
		if(mem!=null) {
			return true;
		}else {
			return false;
		}
		}catch(Exception e) {
			return false;
		}
	}
	@Transactional
	public Members getListTask(String username) {
			String sql="from MEMBERS Where Username='"+username+"'";
			Session session=sessionFactory.getCurrentSession();
			Members mem =(Members) session.createQuery(sql).getSingleResult();
			return mem;
	}
	@Transactional
	public Members getById(int id) {
		String sql="from MEMBERS where Idmember="+id;
		Session session=sessionFactory.getCurrentSession();
		Members members=(Members) session.createQuery(sql).getSingleResult();
		return members;
	}

}
