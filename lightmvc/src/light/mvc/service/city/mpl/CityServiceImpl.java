package light.mvc.service.city.mpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import light.mvc.dao.BaseDaoI;
import light.mvc.model.city.Tcity;
import light.mvc.model.city.Tdistrict;
import light.mvc.model.city.Tprivience;
import light.mvc.model.sys.Torganization;
import light.mvc.model.sys.Tresource;
import light.mvc.model.sys.Trole;
import light.mvc.model.sys.Tuser;
import light.mvc.pageModel.base.PageFilter;
import light.mvc.pageModel.base.SessionInfo;
import light.mvc.pageModel.sys.User;
import light.mvc.service.city.CityServiceI;
import light.mvc.utils.MD5Util;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityServiceImpl implements CityServiceI {

	@Autowired
	private BaseDaoI<Tuser> userDao;
	
	@Autowired
	private BaseDaoI<Trole> roleDao;
	
	@Autowired
	private BaseDaoI<Torganization> organizationDao;
	
	//无情的分割线------------------------------------------------------
	
	@Autowired
	private BaseDaoI<Tcity> cityDao;
	
	@Autowired
	private BaseDaoI<Tprivience> privienceDao;
	
	@Autowired
	private BaseDaoI<Tdistrict> districtDao;
	//无情的分割线------------------------------------------------------


	@Override
	public void add(Tcity u) {
	//	Tcity t = new Tcity();
		cityDao.save(u);
	}

	@Override
	public void delete(Long id) {
		Tuser t = userDao.get(Tuser.class, id);
		del(t);
	}

	private void del(Tuser t) {
		userDao.delete(t);
	}

	@Override
	public void edit(User user) {
		Tuser t = userDao.get(Tuser.class,user.getId());
		t.setAge(user.getAge());
		t.setLoginname(user.getLoginname());
		t.setName(user.getName());
		t.setOrganization(organizationDao.get(Torganization.class,user.getOrganizationId()));
		List<Trole> roles = new ArrayList<Trole>();
		if (user.getRoleIds() != null) {
			for (String roleId : user.getRoleIds().split(",")) {
				roles.add(roleDao.get(Trole.class, Long.valueOf(roleId)));
			}
		}
		t.setRoles(new HashSet<Trole>(roles));
		t.setSex(user.getSex());
		t.setUsertype(user.getUsertype());
		if(user.getPassword()!=null&&!"".equals(user.getPassword())){
			t.setPassword(MD5Util.md5(user.getPassword()));
		}
		userDao.update(t);
	}

	@Override
	public User get(Long id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Tuser t = userDao.get("from Tuser t  left join fetch t.roles role where t.id = :id", params);
		User u = new User();
		BeanUtils.copyProperties(t, u);
		
		if(t.getOrganization()!=null){
			u.setOrganizationId(t.getOrganization().getId());
			u.setOrganizationName(t.getOrganization().getName());
		}
		
		if (t.getRoles() != null && !t.getRoles().isEmpty()) {
			String roleIds = "";
			String roleNames = "";
			boolean b = false;
			for (Trole role : t.getRoles()) {
				if (b) {
					roleIds += ",";
					roleNames += ",";
				} else {
					b = true;
				}
				roleIds += role.getId();
				roleNames += role.getName();
			}
			u.setRoleIds(roleIds);
			u.setRoleNames(roleNames);
		}
		return u;
	}

	@Override
	public User login(User user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginname", user.getLoginname());
		params.put("password", MD5Util.md5(user.getPassword()));
		Tuser t = userDao.get("from Tuser t where t.loginname = :loginname and t.password = :password", params);
		if (t != null) {
			User u = new User();
			BeanUtils.copyProperties(t, u);
			return u;
		}
		return null;
	}

	@Override
	public List<String> resourceList(Long id) {
		List<String> resourceList = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Tuser t = userDao.get(
				"from Tuser t join fetch t.roles role join fetch role.resources resource where t.id = :id", params);
		if (t != null) {
			Set<Trole> roles = t.getRoles();
			if ((roles != null) && !roles.isEmpty()) {
				for (Trole role : roles) {
					Set<Tresource> resources = role.getResources();
					if ((resources != null) && !resources.isEmpty()) {
						for (Tresource resource : resources) {
							if ((resource != null) && (resource.getUrl() != null)) {
								resourceList.add(resource.getUrl());
							}
						}
					}
				}
			}
		}
		return resourceList;
	}

	@Override
	public List<Tcity> dataGrid(Tcity city, PageFilter ph) {
		List<Tcity> ul = new ArrayList<Tcity>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tcity t Tcity t  join fetch t.privience p";
		List<Tcity> l = cityDao.find(hql + whereHql(city, params) + orderHql(ph), params, ph.getPage(), ph.getRows());
		
		for (Tcity t : l) {
			 
			ul.add(t);
		}
		return ul;
	}

	@Override
	public Long count(Tcity city, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tcity t  join fetch t.privience p ";
		return userDao.count("select count(*) " + hql + whereHql(city, params), params);
	}

	private String whereHql(Tcity city, Map<String, Object> params) {
		String hql = "";
		if (city != null) {
			hql += " where 1=1 ";
			if (city.getCityName()!= null) {
				hql += " and t.cityName like :name";
				params.put("name", "%%" + city.getCityName() + "%%");
			}
			if (city.getZipcode() != null) {
				hql += "and t.zipcode like :zipcode";
				params.put("zipcode", city.getZipcode());
			}
			if(city.getId()!=null)
			{
				hql += "and  p.id ="+city.getId();
				//params.put("zipcode", city.getZipcode());
			}
			 
		}
		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public boolean editUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd) {
		Tuser u = userDao.get(Tuser.class, sessionInfo.getId());
		if (u.getPassword().equalsIgnoreCase(MD5Util.md5(oldPwd))) {// 说明原密码输入正确
			u.setPassword(MD5Util.md5(pwd));
			return true;
		}
		return false;
	}

	@Override
	public Tcity getByLoginName(Tcity city) {
		Tcity t = cityDao.get("from Tcity t  where t.cityName = '"+"中卫市"+"'");
		Tprivience p = privienceDao.get("from Tprivience t  where t.provienceName = '"+"北京市"+"'");
		System.out.println(t);
		return t;
	}
}
