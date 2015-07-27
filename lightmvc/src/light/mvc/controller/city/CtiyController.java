package light.mvc.controller.city;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import light.mvc.controller.base.BaseController;
import light.mvc.framework.constant.GlobalConstant;
import light.mvc.model.city.Tcity;
import light.mvc.model.city.Tprivience;
import light.mvc.pageModel.base.Grid;
import light.mvc.pageModel.base.Json;
import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.SessionInfo;
import light.mvc.pageModel.base.Tree;
import light.mvc.pageModel.sys.User;
import light.mvc.service.base.ServiceException;
import light.mvc.service.city.CityServiceI;
import light.mvc.service.city.PrivienceServiceI;
import light.mvc.service.sys.DictionaryServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/city")
public class CtiyController extends BaseController {

	 
	
	@Autowired
	private CityServiceI cityService;
	
	@Autowired
	private PrivienceServiceI provienceService;
	
	@Autowired
	private DictionaryServiceI dictionaryService;

	
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		request.setAttribute("citytypeJson",JSON.toJSONString(dictionaryService.combox("usertype")));
		return "/admin/city";
	}
	@RequestMapping("/tree")
	@ResponseBody
	public  List<Tree>  tree(){
		
		return provienceService.tree();
		 
	}
	
	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(Tcity city, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(cityService.dataGrid(city, ph));
		grid.setTotal(cityService.count(city, ph));
		return grid;
	}
	
	
	@RequestMapping("/editPwdPage")
	public String editPwdPage(HttpServletRequest request) {
		return "/admin/userEditPwd";
	}
	
	@RequestMapping("/editUserPwd")
	@ResponseBody
	public Json editUserPwd(HttpServletRequest request,String oldPwd, String pwd) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
		Json j = new Json();
		try {
			cityService.editUserPwd(sessionInfo, oldPwd, pwd);
			j.setSuccess(true);
			j.setMsg("密码修改成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/admin/userAdd";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Tcity city) {
		Json j = new Json();
		Tcity u1 = cityService.getByLoginName(city);
		
		if(u1==null){
			j.setMsg("城市名已存在!");
		}else{
			Tcity u=new Tcity();
			u.setCityName("测试");
			u.setZipcode("xxx");
			
			Tprivience u2=new Tprivience();
			u2.setId(1L);
			u.setPrivience(u2);
			Set citys=new HashSet(0);
			citys.add(u);
			
			cityService.add(u);
			try {
				
				//cityService.add(user);
				j.setSuccess(true);
				j.setMsg("添加成功！");
			} catch (Exception e) {
				j.setMsg(e.getMessage());
			}
			
		}
		return j;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public User get(Long id) {
		return cityService.get(id);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Long id) {
		Json j = new Json();
		try {
			cityService.delete(id);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		User u = cityService.get(id);
		request.setAttribute("user", u);
		request.setAttribute("sexList", GlobalConstant.sexlist);
		return "/admin/userEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(User user) {
		Json j = new Json();
		try {
			cityService.edit(user);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (ServiceException e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}
