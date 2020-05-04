package net.javaguides.springmvc.entity;

import java.util.Set;

public class JsonMember {

	private int Idmember;
	private String Name;
	private String Address;
	private String Phone;
	private String Email;
	private String Sex;
	private String Username;
	private String Password;
	private String Usersend;
	private Set<Active>listActive;
	public int getIdmember() {
		return Idmember;
	}
	
	public String getUsersend() {
		return Usersend;
	}

	public void setUsersend(String usersend) {
		Usersend = usersend;
	}

	public void setIdmember(int idmember) {
		Idmember = idmember;
	}
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
	public Set<Active> getListActive() {
		return listActive;
	}
	public void setListActive(Set<Active> listActive) {
		this.listActive = listActive;
	}
}
