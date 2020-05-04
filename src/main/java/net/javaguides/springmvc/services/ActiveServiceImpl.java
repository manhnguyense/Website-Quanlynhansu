package net.javaguides.springmvc.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.javaguides.springmvc.dao.ActiveDAO;
import net.javaguides.springmvc.entity.Active;

@Service
public class ActiveServiceImpl implements ActiveServices {

	@Autowired
	private ActiveDAO activeDAO;
	public boolean saveActive(Active active) {
		// TODO Auto-generated method stub
		return activeDAO.saveActive(active);
	}
	

}
