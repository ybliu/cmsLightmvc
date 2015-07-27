package org.konghao.cms.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.konghao.cms.model.Message;
import org.konghao.cms.model.Topic;


public class MessageDto {
	
	private String title;
	private String content;
	private Date publishDate;
	private Date createDate;
	private String author;
	private String address;
	private String phone;
	private String qqnum;
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getPublishDate() {
		return publishDate;
	}


	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getQqnum() {
		return qqnum;
	}


	public void setQqnum(String qqnum) {
		this.qqnum = qqnum;
	}


	public MessageDto(Message t) {
		// TODO Auto-generated constructor stub
		this.setAddress(t.getAddress());
		this.setAuthor(t.getAuthor());
		this.setContent(t.getContent());
		this.setCreateDate(t.getCreateDate());
		this.setPhone(t.getPhone());
		this.setPublishDate(t.getPublishDate());
		this.setQqnum(t.getQqnum());
		this.setTitle(t.getTitle());
		
	}
	
	public MessageDto() {
		
	}
	 
	
}
