package net.javaguides.springmvc.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="TASK")
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Idtask;
	private String Title;
	private String Description;
	private String Duedatetime;
	private String Duedatehour;
	private String Duedateminute;
	private String State;
	private String DueNotify;
	private String DueNotifyHour;
	

	  

	public void setState(String state) {
		State = state;
	}
	@ManyToMany(fetch = FetchType.EAGER)
	  
	  @JoinTable(name="TASK_MEMBER", joinColumns= {@JoinColumn(name="Idtask")},
	  inverseJoinColumns= {@JoinColumn(name="Idmember")}) private
	  Set<Members>listmember;
	 
	
	public int getIdtask() {
		return Idtask;
	}
	  public String getState() {
		return State;
	}
	public void setIdtask(int idtask) {
		Idtask = idtask;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getDuedatetime() {
		return Duedatetime;
	}
	public void setDuedatetime(String duedatetime) {
		Duedatetime = duedatetime;
	}
	
	public String getDuedatehour() {
		return Duedatehour;
	}
	public void setDuedatehour(String duedatehour) {
		Duedatehour = duedatehour;
	}
	public String getDuedateminute() {
		return Duedateminute;
	}
	public void setDuedateminute(String duedateminute) {
		Duedateminute = duedateminute;
	}
	public Task() {
		
	}
	
	public Set<Members> getListmember()
	{ return listmember; 
	} 
	public void setListmember(Set<Members> listmember) 
	{ 
		this.listmember = listmember; 
	}
	public String getDueNotify() {
		return DueNotify;
	}
	public void setDueNotify(String dueNotify) {
		DueNotify = dueNotify;
	}
	public String getDueNotifyHour() {
		return DueNotifyHour;
	}
	public void setDueNotifyHour(String dueNotifyHour) {
		DueNotifyHour = dueNotifyHour;
	}
	
	 
	
}
