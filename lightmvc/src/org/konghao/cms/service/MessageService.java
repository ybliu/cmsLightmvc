package org.konghao.cms.service;

import java.util.List;

import javax.inject.Inject;

import org.konghao.basic.model.Pager;
import org.konghao.cms.dao.IMessageDao;
import org.konghao.cms.model.Message;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageService implements IMessageService {
	IMessageDao messageDao;
	
	public IMessageDao getMessageDao() {
		return messageDao;
	}
	@Inject
	public void setMessageDao(IMessageDao messageDao) {
		this.messageDao = messageDao;
	}

	@Override
	public void add(Message message) {
		// TODO Auto-generated method stub
		messageDao.add(message);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Message message, int cid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Message load(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Message> find(Integer cid, String title, Integer status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Message> find(Integer uid, Integer cid, String title,
			Integer status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Message> searchTopicByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Message> searchTopic(String con) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Message> findRecommendTopic(Integer ci) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> listTopicByChannelAndNumber(int cid, int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> listTopicByChannel(int cid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isUpdateIndex(int cid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Message loadLastedTopicByColumn(int cid) {
		// TODO Auto-generated method stub
		return null;
	}
	 
}
