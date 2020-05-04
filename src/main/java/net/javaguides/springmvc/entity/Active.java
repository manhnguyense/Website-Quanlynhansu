package net.javaguides.springmvc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="ACTIVE")
public class Active {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Id;
	
	private String Filename;
	private String Message;
	private String Datetimecreated;
	
	@OneToOne
	@JoinColumn(name ="Idmember")
	private Members member;
	
	private String UserSend;
	
	
	public String getUserSend() {
		return UserSend;
	}
	public void setUserSend(String userSend) {
		UserSend = userSend;
	}
	public Members getMember() {
		return member;
	}
	public void setMember(Members member) {
		this.member = member;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getFilename() {
		return Filename;
	}
	public void setFilename(String filename) {
		Filename = filename;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public String getDatetimecreated() {
		return Datetimecreated;
	}
	public void setDatetimecreated(String datetimecreated) {
		Datetimecreated = datetimecreated;
	}
	

}
