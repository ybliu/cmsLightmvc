<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用Java第二课堂后台管理程序</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/admin/main.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/core/jquery.cms.core.js"></script>
<script type="text/javascript">
$(function(){
	$("#left").myaccordion();
});
</script>
</head>
<body>
<div id="left">
<c:if test="${isAdmin }">
<ul class="navMenu navSelected">
	<h3 class="navTitle">
		<span class="navTilteTxt">用户管理</span>
	</h3>
	<li class="navChild">
		<a href="<%=request.getContextPath() %>/kadmin/user/users" target="content">用户信息管理</a>
	</li>
	<li class="navChild">
		<a href="<%=request.getContextPath() %>/kadmin/group/groups" target="content">用户组管理</a>
	</li>
	<li class="navChild">
		<a href="<%=request.getContextPath() %>/kadmin/role/roles" target="content">用户角色管理</a>
	</li>
</ul>
</c:if>
<ul class="navMenu navSelected">
	<h3 class="navTitle">
		<span class="navTilteTxt">文章管理</span>
	</h3>
	<c:if test="${isAdmin }">
	<li class="navChild">
		<a href="<%=request.getContextPath() %>/kadmin/channel/channels" target="content">栏目信息管理</a>
	</li>
	</c:if>
	<li class="navChild">
		<a href="<%=request.getContextPath() %>/kadmin/topic/audits" target="content">文章信息管理</a>
	</li>
</ul>
<c:if test="${isAdmin }">
	<ul class="navMenu navSelected">
		<h3 class="navTitle">
			<span class="navTilteTxt">系统配置</span>
		</h3>
		<li class="navChild">
			<a href="<%=request.getContextPath() %>/kadmin/cmsLink/links" target="content">超级链接管理</a>
		</li>
		<li class="navChild">
			<a href="<%=request.getContextPath() %>/kadmin/system/baseinfo" target="content">网站信息管理</a>
		</li>
		<li class="navChild">
			<a href="<%=request.getContextPath() %>/kadmin/pic/indexPics" target="content">首页图片管理</a>
		</li>
		<li class="navChild">
			<a href="<%=request.getContextPath() %>/kadmin/backups" target="content">网站数据备份</a>
		</li>
		<li class="navChild">
			<a href="<%=request.getContextPath() %>/kadmin/system/cleans" target="content">系统清理管理</a>
		</li>
	</ul>
</c:if>
		</div>
</body>
</html>