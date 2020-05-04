package net.javaguides.springmvc.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.javaguides.springmvc.dao.MemberDAO;
import net.javaguides.springmvc.entity.Members;

@Service
public class MemberServicesImpl implements MemberServices{

	@Autowired
	MemberDAO memberDAO;
	public List<Members> getAll() {
	
		return memberDAO.getAll();
	}
	public boolean deleteMember(int id) {
	
		return memberDAO.deleteMembers(id);
	}
	public boolean addMember(Members mb) {
		
		return memberDAO.addMember(mb);
	}
	public boolean login(String username, String password) {

		return memberDAO.login(username, password);
	}
	public Members getListTask(String username) {
	
		return memberDAO.getListTask(username);
	}
	public Members getById(int id) {
		
		return memberDAO.getById(id);
	}

}
