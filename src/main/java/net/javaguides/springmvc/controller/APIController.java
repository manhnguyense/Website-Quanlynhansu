package net.javaguides.springmvc.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.xdevapi.JsonArray;

import net.javaguides.springmvc.entity.Members;
import net.javaguides.springmvc.entity.Task;
import net.javaguides.springmvc.services.MemberServices;
import net.javaguides.springmvc.services.TaskServices;

@Controller
@RequestMapping(value = "api/")
@SessionAttributes({"username" })
public class APIController {
	@Autowired
	TaskServices taskServices;
	@Autowired
	MemberServices memberServices;
	
	
	@GetMapping("add")
	@ResponseBody
	public String addTask(@RequestParam String json) throws IOException {
		ObjectMapper objectMapper=new ObjectMapper();
		JsonNode jsonNode=objectMapper.readTree(json);
		String s=jsonNode.get("duetime").asText();
		Task task=new Task();
		task.setDuedateminute(s.substring(3,5));
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
		Task task=new Task();
		task.setIdtask(jsonNode.get("id").asInt());
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
	public String updateTask(@RequestParam int id,@RequestParam String state)  {
		Task task1=taskServices.getMemberOfTask(id);
		task1.setState(state);
		boolean rs= taskServices.updateTask(task1);
		if(rs==true) {
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

}
