package org.konghao.cms.service;

import java.util.List;

import org.konghao.basic.model.Pager;
import org.konghao.cms.model.Message;
import org.konghao.cms.model.Topic;

public interface IMessageService {
	/**
	 * 添加带有附件信息的留言
	 * @param topic 留言对象
	 */
	public void add(Message message);
	 
	public void delete(int id);
	/**
	 * 没有带附件信息的留言更新
	 * @param topic
	 */
	public void update(Message message,int cid);
	 
	
	public Message load(int id);
	
	/**
	 * 根据栏目和标题和状态进行留言的检索
	 * @param cid
	 * @param title
	 * @return
	 */
	public Pager<Message> find(Integer cid,String title,Integer status);
	/**
	 * 根据用户，栏目和标题和状态进行检索
	 * @param uid
	 * @param cid
	 * @param title
	 * @return
	 */
	public Pager<Message> find(Integer uid,Integer cid,String title,Integer status);
	/**
	 * 根据关键字进行留言的检索，仅仅只是检索关键字类似的
	 * @param keyword
	 * @return
	 */
	public Pager<Message> searchTopicByKeyword(String keyword);
	/**
	 * 通过某个条件来检索，该条件会在标题，内容和摘要中检索
	 * @param con
	 * @return
	 */
	public Pager<Message> searchTopic(String con);
	/**
	 * 检索某个栏目的推荐留言，如果cid为空，表示检索全部的留言
	 * @param ci
	 * @return
	 */
	public Pager<Message> findRecommendTopic(Integer ci);
	
	public List<Message> listTopicByChannelAndNumber(int cid,int num);
	
	public List<Message> listTopicByChannel(int cid);
	
	/**
	 * 判断所添加留言的栏目是否需要进行更新
	 * @param cid
	 * @return
	 */
	public boolean isUpdateIndex(int cid);
	
	public Message loadLastedTopicByColumn(int cid);
}
