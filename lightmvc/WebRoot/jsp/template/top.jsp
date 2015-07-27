<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <input type="hidden" id="ctx" value="<%=request.getContextPath()%>"/>
<div id="header">
	<div id="header_con">
		<div id="logo">
		<div id="main_nav">
			<ul>
				<li><a class="main_nav_link" href="<%=request.getContextPath()%>/topic/38">客户服务</a></li>
				<li><a class="main_nav_link" href="<%=request.getContextPath()%>/message/add">意见反馈</a></li>
				<li><a class="main_nav_link" href="<%=request.getContextPath()%>/kadmin">后台管理</a></li>
				<li><a class="main_nav_link" href="mailto:support_bdlogan@chinabluedon.cn">联系我们</a></li>
			</ul>
		</div>
		</div>
		
		<div id="search">
			<input type="text" id="search_con" value="Search.." />
			<div id="search_btn"></div>
		</div>
	</div>
</div>
<div id="nav">
	<div id="nav_con">
		<ul>
			<li><span href="<%=request.getContextPath()%>/index">蓝盾首页</span></li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/6">公司简介</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/11">安全新闻</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/10">通知公告</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/12">政策法规</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/8">安全知识</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/7">旗下产品</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/19">体验中心</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/21">案例分享</span>
				</li>
				<li>
					<span href="<%=request.getContextPath()%>/channel/20">活动专区</span>
				</li>
		</ul>
	</div>
</div>