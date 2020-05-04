package net.javaguides.springmvc.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
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

import org.springframework.util.comparator.InvertibleComparator;

@Entity(name="MEMBERS")
public class Members {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Idmember;
	private String Name;
	private String Address;
	private String Phone;
	private String Email;
	private String Sex;
	private String Username;
	private String Password;
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="Idmember")
	private Set<Active>listActive;
	//method
	public Set<Active> getListActive() {
		return listActive;
	}
	public void setListActive(Set<Active> listActive) {
		this.listActive = listActive;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	@ManyToMany(fetch = FetchType.EAGER)
	  @JoinTable(name="TASK_MEMBER", joinColumns= {@JoinColumn(name="Idmember")},
	  inverseJoinColumns= {@JoinColumn(name="Idtask")}) private Set<Task>listTask;
	 
	
	public int getIdmember() {
		return Idmember;
	}
	public void setIdmember(int idmember) {
		Idmember = idmember;
	}
	
	
	  public Set<Task> getListTask() { return listTask; } 
	 public void
	  setListTask(Set<Task> listTask) { this.listTask = listTask; }
	 
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public Members() {
	
	}
	

}
