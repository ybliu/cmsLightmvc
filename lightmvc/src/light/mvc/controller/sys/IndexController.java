package light.mvc.controller.sys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import light.mvc.controller.base.BaseController;
import light.mvc.framework.constant.GlobalConstant;
import light.mvc.pageModel.base.Json;
import light.mvc.pageModel.base.SessionInfo;
import light.mvc.pageModel.sys.User;
import light.mvc.service.sys.ResourceServiceI;
import light.mvc.service.sys.UserServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class IndexController extends BaseController {

	@Autowired
	private UserServiceI userService;
	
	@Autowired
	private ResourceServiceI resourceService;

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
		if ((sessionInfo != null) && (sessionInfo.getId() != null)) {
			return "/index";
		}
		return "/login";
	}
/*	@responsebody表示该方法的返回结果直接写入HTTP response body中
	一般在异步获取数据时使用，在使用@RequestMapping后，返回值通常解析为跳转路径，
	加上@responsebody后返回结果不会被解析为跳转路径，而是直接写入HTTP
	 response body中。比如异步获取json数据，加上@responsebody后，
	 会直接返回json数据。*/

	@ResponseBody
	@RequestMapping("/login")
	public Json login(User user, HttpSession session,String loginname) {
		Json j = new Json();
		User sysuser = userService.login(user);
		if (sysuser != null) {
			j.setSuccess(true);
			j.setMsg("登陆成功！");

			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setId(sysuser.getId());
			sessionInfo.setLoginname(sysuser.getLoginname());
			sessionInfo.setName(sysuser.getName());
			// user.setIp(IpUtil.getIpAddr(getRequest()));
			//资源列表
			sessionInfo.setResourceList(userService.resourceList(sysuser.getId()));
			sessionInfo.setResourceAllList(resourceService.resourceAllList());
			session.setAttribute(GlobalConstant.SESSION_INFO, sessionInfo);
			
			
			
			
			
		} else {
			j.setMsg("用户名或密码错误！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/logout")
	public Json logout(HttpSession session) {
		Json j = new Json();
		if (session != null) {
			session.invalidate();
		}
		j.setSuccess(true);
		j.setMsg("注销成功！");
		return j;
	}

}
