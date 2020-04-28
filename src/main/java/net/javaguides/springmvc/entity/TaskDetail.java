package net.javaguides.springmvc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity(name="TASK_DETAIL")
public class TaskDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Id;
	@OneToOne()
	@JoinColumn(name="Idtask")
	private Task task;
	private String document;
	private boolean State;
	private String Taskname;
	
	public String getTaskname() {
		return Taskname;
	}
	public void setTaskname(String taskname) {
		Taskname = taskname;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public boolean isState() {
		return State;
	}
	public void setState(boolean state) {
		State = state;
	}
	

}
