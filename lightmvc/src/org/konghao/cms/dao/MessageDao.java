package org.konghao.cms.dao;


import java.util.List;

import org.konghao.basic.dao.BaseDao;
import org.konghao.basic.model.Pager;
import org.konghao.cms.model.Message;
import org.konghao.cms.model.Topic;
import org.springframework.stereotype.Repository;

@Repository("messageDao")
public class MessageDao extends BaseDao<Message> implements IMessageDao {

	 

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
	public List<Message> listTopicsByChannel(int cid) {
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
