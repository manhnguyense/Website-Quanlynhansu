package net.javaguides.springmvc.dao;

import java.util.List;

import net.javaguides.springmvc.entity.Members;

public interface MemberDAO {
	public List<Members>getAll();
	public boolean deleteMembers(int id);
	public boolean addMember(Members mb);
	public boolean login(String username,String password);
	public Members getListTask(String username);

}
