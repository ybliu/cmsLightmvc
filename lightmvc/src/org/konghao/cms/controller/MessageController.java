package org.konghao.cms.controller;

import java.util.Date;

import javax.inject.Inject;

import org.konghao.cms.dto.MessageDto;
import org.konghao.cms.model.Message;
import org.konghao.cms.service.IMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@AuthClass("login")
@RequestMapping("/message")
public class MessageController {
	private IMessageService messageService;

	public IMessageService getMessageService() {
		return messageService;
	}
	@Inject
	public void setMessageService(IMessageService messageService) {
		this.messageService = messageService;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	//@AuthMethod(role="ROLE_PUBLISH")
	public String add(Model model) {
		Message t = new Message();
		t.setPublishDate(new Date());
		MessageDto td = new MessageDto(t);
		model.addAttribute("messageDto",td);
		return "index/message";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	//@AuthMethod(role="ROLE_PUBLISH")
	public String addSuccess(@Validated MessageDto messageDto) {
		System.out.println(messageDto);
		System.out.println(messageDto.getTitle());
		Message t = new Message();
		//t.setId(1);
		t.setPublishDate(new Date());
		t.setTitle(messageDto.getTitle());
		t.setAddress(messageDto.getAddress());
		t.setContent(messageDto.getContent());
		t.setAuthor(messageDto.getAuthor());
		messageService.add(t);
		return "redirect:/jsp/message/messageSuccess.jsp";
	}
	
	
	
	
	  
	 
}
