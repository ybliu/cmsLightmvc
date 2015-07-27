package org.konghao.cms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_message")
public class Message {
	private int id;
	/**
	 * 留言的标题
	 */
	private String title;
	 
	/**
	 * 留言的内容
	 */
	private String content;
 
	/**
	 * 留言的发布时间，用来进行排序的
	 */
	private Date publishDate;
	/**
	 * 留言的创建时间
	 */
	private Date createDate;
	/**
	 * 留言的作者名称，用来显示用户的昵称，冗余字段
	 */
	private String author;
	/**
	 * 留言人地址
	 */
	private String address;
	
	/**
	 * 留言人电话号码
	 */
	private String phone;

	/**
	 * 留言人QQ号码
	 */
	private String qqnum;
	 
	 
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	
	@Column(name="publish_date")
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
	@Column(name="create_date")
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
	public Message(int id, String title, Date publishDate, String author ) {
		super();
		this.id = id;
		this.title = title;
		this.publishDate = publishDate;
		this.author = author;
	}
	
	public Message() {
	}
	
}
