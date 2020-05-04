package net.javaguides.springmvc.services;

import java.util.List;

import net.javaguides.springmvc.entity.Members;

public interface MemberServices {
	public List<Members>getAll();
	public boolean deleteMember(int id);
	public boolean addMember(Members mb);
	public boolean login(String username,String password);
	public Members getListTask(String username);
	public Members getById(int id);

}
