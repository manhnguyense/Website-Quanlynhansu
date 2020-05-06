package net.javaguides.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.xdevapi.JsonArray;

import net.javaguides.springmvc.entity.Active;
import net.javaguides.springmvc.entity.JsonMember;
import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;
import net.javaguides.springmvc.entity.TaskDetail;
import net.javaguides.springmvc.services.ActiveServices;
import net.javaguides.springmvc.services.MemberServices;
import net.javaguides.springmvc.services.TaskDetailService;
import net.javaguides.springmvc.services.TaskServices;

@Controller
@RequestMapping(value = "api/")
@SessionAttributes({"username" })
public class APIController {
	@Autowired
	TaskServices taskServices;
	@Autowired
	MemberServices memberServices;
	@Autowired
	TaskDetailService taskDetailServices;
	@Autowired
	ActiveServices activeServices;
	
	@GetMapping("add")
	@ResponseBody
	public String addTask(@RequestParam String json) throws IOException {
		ObjectMapper objectMapper=new ObjectMapper();
		JsonNode jsonNode=objectMapper.readTree(json);
		String s=jsonNode.get("duetime").asText();
		Integer hour=Integer.parseInt(s.substring(0,2));
		Task task=new Task();
		task.setDuedateminute(s.substring(3,5));
		Integer timeNotify=Integer.parseInt(s.substring(3,5))-jsonNode.get("notifytime").asInt();
		String duetime="";
		if(timeNotify>=0) {
			if(timeNotify<10&&timeNotify>0) {
				 duetime="0"+timeNotify.toString();
			}else{
				 duetime=timeNotify.toString();
			}
		}else {
			timeNotify=59-jsonNode.get("notifytime").asInt()+Integer.parseInt(s.substring(3,5));
			duetime=timeNotify.toString();
			hour--;
		}
		String covertHour="";
		if(hour<10) {
			covertHour="0"+hour.toString();
		}else {
			covertHour=hour.toString();
		}
		task.setDueNotify(duetime);
		task.setDueNotifyHour(covertHour);
		task.setDuedatehour(s.substring(0,2));
		task.setTitle(jsonNode.get("title").asText());
		task.setDuedatetime(jsonNode.get("duedate").asText());
		task.setDescription(jsonNode.get("describer").asText());
		
		task.setState("Notaccept");
		JsonNode jsonMember=jsonNode.get("listmember");
		Set<Members>listMembers=new HashSet<Members>();
		for (JsonNode jsonNode2 : jsonMember) {
			Members mb=new Members();
			mb.setIdmember(jsonNode2.get("id").asInt());
			listMembers.add(mb); 
		}
		task.setListmember(listMembers);
		boolean rs= taskServices.addTask(task);
		if(rs==true) {
		return "true";		
		}
		return "false";

		
	}
	@PostMapping("addMember")
	@ResponseBody
	public String addMember(@RequestParam String json) throws IOException {
		ObjectMapper oMapper=new ObjectMapper();
		JsonNode jNode=oMapper.readTree(json);
		Members mb=new Members();
		mb.setName(jNode.get("name").asText());
		mb.setEmail(jNode.get("email").asText());
		mb.setPhone(jNode.get("phone").asText());
		mb.setSex(jNode.get("sex").asText());
		mb.setAddress(jNode.get("address").asText());
		mb.setUsername(jNode.get("username").asText());
		String str=jNode.get("password").asText();
		String result = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(str.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		mb.setPassword(result);
		boolean rs =memberServices.addMember(mb);
		if(rs==true) {
			return "true";		
			}
		return "false";
	}
	@PostMapping("updateTask")
	@ResponseBody
	public String updateTask(@RequestParam String json) throws IOException {
		ObjectMapper objectMapper=new ObjectMapper();
		JsonNode jsonNode=objectMapper.readTree(json);
		String s=jsonNode.get("duetime").asText();
		Task task=taskServices.getMemberOfTask(jsonNode.get("id").asInt());
		//task.setIdtask(jsonNode.get("id").asInt());
		task.setDuedateminute(s.substring(0,2));
		task.setDuedatehour(s.substring(3,5));
		task.setTitle(jsonNode.get("title").asText());
		task.setDuedatetime(jsonNode.get("duedate").asText());
		task.setDescription(jsonNode.get("describer").asText());
		task.setState(jsonNode.get("state").asText());
		JsonNode jsonMember=jsonNode.get("listmember");
		Set<Members>listMembers=new HashSet<Members>();
		for (JsonNode jsonNode2 : jsonMember) {
			Members mb=new Members();
			mb.setIdmember(jsonNode2.get("id").asInt());
			listMembers.add(mb);
		}
		task.setListmember(listMembers);
		boolean rs= taskServices.updateTask(task);
		if(rs==true) {
		return "true";		
		}
		return "false";
	}
	@PostMapping("updatestate")
	@ResponseBody
	public String updateState(@RequestParam String json) throws IOException  {
		ObjectMapper oMapper=new ObjectMapper();
		JsonNode jNode=oMapper.readTree(json);
		Task task1=taskServices.getMemberOfTask(jNode.get("id").asInt());
		task1.setState(jNode.get("state").asText());
		Set<TaskDetail>list=new HashSet<TaskDetail>();
		JsonNode jNode2=jNode.get("list");
		for (JsonNode jsonNode : jNode2) {
			TaskDetail task=taskDetailServices.getTaskDetailById(jsonNode.get("id").asInt());
			task.setState(true);
			task.setTask(task1);
		
			taskDetailServices.save(task);
		}
		boolean rs= taskServices.updateTask(task1); 
		if(rs==true)
		{
			  return "true"; 
		}
		return "false";
	}
	@PostMapping("updatestate1")
	@ResponseBody
	public String updateState2(@RequestParam String json) throws IOException  {
		ObjectMapper oMapper=new ObjectMapper();
		JsonNode jNode=oMapper.readTree(json);
		Task task=taskServices.getMemberOfTask(jNode.get("id").asInt());
		task.setState(jNode.get("state").asText());
		System.out.println(json);
		boolean rs= taskServices.updateTask(task); 
		if(rs==true)
		{
			  return "true"; 
		}
		return "false";
	}
	
	@PostMapping("login")
	@ResponseBody
	public String Login(@RequestParam String username,@RequestParam String password,HttpSession session) {
	
		String str=password;
		String result = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(str.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		boolean rs=memberServices.login(username, result);
		
		System.out.println(rs);
		if(rs==true) {
			session.setAttribute("username", username);
			return "true";
		}
		return "false";
	}
	@PostMapping("updatenotifytime")
	@ResponseBody
	public String UpdateNotifyTime(@RequestParam int id,@RequestParam int notifyTime) {
		Task task1=taskServices.getMemberOfTask(id);
		Integer timeNotify=Integer.parseInt(task1.getDuedateminute())-notifyTime;
		String duetime="";
		Integer hour=Integer.parseInt(task1.getDuedatehour());
		if(timeNotify>=0) {
			if(timeNotify<10&&timeNotify>0) {
				 duetime="0"+timeNotify.toString();
			}else{
				 duetime=timeNotify.toString();
			}
		}else {
			timeNotify=59-notifyTime+Integer.parseInt(task1.getDuedateminute());
			duetime=timeNotify.toString();
			hour--;
		}
		task1.setDueNotify(duetime);
		task1.setDueNotifyHour(hour.toString());
		boolean rs= taskServices.updateTask(task1);
		if(rs==true) {
		return "true";		
		}
		return "false";
	}
	@Autowired
	ServletContext context;
	@PostMapping("UploadFile")
	@ResponseBody
	public String UploadFile(MultipartHttpServletRequest request) {
		String path_save_file=context.getRealPath("/resources/document/");
		Iterator<String>listNames=request.getFileNames();
		MultipartFile mpf=request.getFile(listNames.next());
		File file_save=new File(path_save_file+mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(file_save!=null) {
			return "true";
		}
		return"false";
	}
	
	@PostMapping("saveActive")
	@ResponseBody
	public String saveActive(@RequestParam int member,@RequestParam String message,@RequestParam String file) {
		Active active=new Active();
		active.setFilename(file);
		active.setMessage(message);
		active.setDatetimecreated(new Date().toString());
		active.setUserSend("Admin");
		Members mem=new Members();
		mem.setIdmember(member);
		active.setMember(mem);
		activeServices.saveActive(active);
		return "true";
		
	}
	@PostMapping("employSaveActive")
	@ResponseBody
	public String empActive(@RequestParam int id,@RequestParam String message,@RequestParam String file) {
		Active active=new Active();
		active.setFilename(file);
		active.setMessage(message);
		active.setDatetimecreated(new Date().toString());
		Members members=memberServices.getById(id);
		active.setUserSend(members.getName());
		Members mem=new Members();
		mem.setIdmember(id);
		active.setMember(mem);
		activeServices.saveActive(active);
		return "true";
		
	}
	@PostMapping(path="loaddata",produces="application/json;charset=utf-8")
	@ResponseBody
	public JsonMember loadHistory(@RequestParam int member) {
		Members members=memberServices.getById(member);
		JsonMember json=new JsonMember();
		json.setAddress(members.getAddress());
		json.setUsername(members.getUsername());
		json.setEmail(members.getEmail());
		json.setPassword(members.getPassword());
		json.setSex(members.getSex());
		json.setName(members.getName());
		Set<Active>set=new HashSet<Active>();
		for (Active active : members.getListActive()) {
			Active active2=new Active();
			active2.setFilename(active.getFilename());
			active2.setMessage(active.getMessage());
			active2.setDatetimecreated(active.getDatetimecreated());
			active2.setUserSend(active.getUserSend());
			set.add(active2);
		}
		json.setListActive(set);
		return json;
	}

}
