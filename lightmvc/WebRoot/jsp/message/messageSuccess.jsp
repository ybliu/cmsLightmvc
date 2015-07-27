<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问${baseInfo.name }</title>
<meta http-equiv="keywords" content="蓝盾乐庚">   
<meta http-equiv="description" content="蓝盾乐庚">   
<!-- Date: 2013-09-04 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/index/web.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.cycle2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/index/main.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/index/message.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/messageAdd.js"></script>
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="/jsp/template/top.jsp"/>	
 
<div id="content">
<div id="content_con">
<input type="hidden" id="ctx" value="<%=request.getContextPath() %>"/>
	<h3 class="admin_link_bar" style="text-align:center">
	<span>&nbsp;</span>
	</h3>
	<sf:form method="post" modelAttribute="messageDto" id="addForm">
	       <div style="width:800px;margin:10px auto">
			<table>
				<tr>
				    <td>留言提交成功,我们会及时关注您的反馈</td>
				 </tr>
			</table>
			</div>
	</sf:form>
	</div> 
</div>
<jsp:include page="/jsp/template/bottom.jsp"/>
</body>
</html>