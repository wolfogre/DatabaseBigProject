<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.wolfogre.domain.Manager" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/13
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- BootStrap CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/BootStrap/css/bootstrap.min.css"/>
	<!--DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/css/jquery.dataTables.css"/>
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.dataTables.js"></script>

	<title>管理员页面</title>
</head>
<body>
<%
	Manager master = (Manager)session.getAttribute("master");
	if(master == null){
		response.sendRedirect("/index.action");
		return;
	}
%>
<div class="page-header" >
	<div>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;管理员:<%=master.getM_name()%><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工号:<%=master.getM_id()%></small></h2>
	</div>
</div>
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a href="managerIndex.action">基本信息</a></li>
	<li role="presentation"><a href="managerTerm.action">学期管理</a></li>
	<li role="presentation"><a href="managerStudent.action">学生管理</a></li>
	<li role="presentation"><a href="managerTeacher.action">教师管理</a></li>
	<li role="presentation"><a href="managerManager.action">管理员管理</a></li>
	<li role="presentation"><a href="managerCourse.action">课程管理</a></li>
	<li role="presentation"><a href="managerClass.action">开课管理</a></li>
	<li role="presentation"><a href="managerSelection.action">选课管理</a></li>
	<li role="presentation"><a href="${pageContext.request.contextPath}/login.action">退出登录</a></li>
</ul>
<div class="jumbotron" style="height: 100%">
	<div class="panel panel-info center-block" style="width: 50%">
		<div class="panel-body">
			<h2>姓名：<%=master.getM_name()%></h2>
			<h2>工号：<%=master.getM_id()%></h2>
			<h2>身份：管理员</h2>
			<h2>当前学期：<%=request.getAttribute("term")%></h2>
			<h2>当前时间：<%=new SimpleDateFormat("yyyy年M月dd日 HH时mm分").format(new java.util.Date())%></h2>
		</div>
	</div>
</div>
</body>
</html>